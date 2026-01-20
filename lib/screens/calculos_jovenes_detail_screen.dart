// lib/screens/calculos_jovenes_detail_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mi_app/models/paciente.dart';
import 'package:mi_app/models/medicamento.dart';
import 'package:mi_app/utils/dosis_calculator_jovenes.dart';
import 'package:mi_app/models/medicamento_calculado.dart';
import 'package:mi_app/screens/printable_patient_data_screen.dart';

import '../l10n/app_localizations.dart';
import '../i18n/med_i18n.dart';

class CalculosJovenesDetailScreen extends StatefulWidget {
  final Paciente paciente;
  final Medicamento medicamento;

  final double sodioValor;
  final double hco3Valor;
  final double liquidosIvValor;

  /// 'Sodio' | 'HCO3' | 'Liquidos IV'
  final String calculoType;

  const CalculosJovenesDetailScreen({
    super.key,
    required this.paciente,
    required this.medicamento,
    required this.sodioValor,
    required this.hco3Valor,
    required this.liquidosIvValor,
    required this.calculoType,
  });

  @override
  State<CalculosJovenesDetailScreen> createState() =>
      _CalculosJovenesDetailScreenState();
}

class _CalculosJovenesDetailScreenState
    extends State<CalculosJovenesDetailScreen> {
  late Map<String, String> _calculatedDoses;

  // UI “pills”
  late List<String> _dosisList;
  late String _displayStringForPrint;

  @override
  void initState() {
    super.initState();

    // Cálculo base
    if (widget.calculoType == 'Sodio') {
      _calculatedDoses = DosisCalculatorJovenes.calculateSodioDosis(
        widget.paciente.pesoKg,
        widget.sodioValor,
      );
    } else if (widget.calculoType == 'HCO3') {
      _calculatedDoses = DosisCalculatorJovenes.calculateHco3Dosis(
        widget.paciente.pesoKg,
        widget.hco3Valor,
      );
    } else {
      _calculatedDoses = DosisCalculatorJovenes.calculateLiquidosIvDosis(
        widget.paciente.pesoKg,
        widget.liquidosIvValor,
      );
    }

    _dosisList = ['N/A'];
    _displayStringForPrint = 'N/A';

    _buildDoseListForUI();
  }

  // =========================
  // Parsing para pills (igual estilo pro)
  // =========================

  bool _looksLikeRange(String s) {
    final t = s.toLowerCase();
    if (!t.contains('-')) return false;
    final nums = RegExp(r'[-+]?\d*\.?\d+').allMatches(t).length;
    return nums >= 2;
  }

  List<String> _splitMultiDose(String raw) {
    var v = raw.trim();
    if (v.isEmpty || v.toUpperCase() == 'N/A') return [];

    // Si es rango, NO partir
    if (_looksLikeRange(v)) return [v];

    // Normaliza separadores
    v = v.replaceAll(' / ', ', ');
    v = v.replaceAll(' /', ', ');
    v = v.replaceAll('/ ', ', ');
    v = v.replaceAll('/', ',');
    v = v.replaceAll(' ,', ',');

    final parts = v
        .split(',')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();

    return parts.isEmpty ? [raw.trim()] : parts;
  }

  ({String value, String unit, bool canSplit}) _splitValueUnitSmart(String s) {
    final t = s.trim();
    if (t.isEmpty || t.toUpperCase() == 'N/A') {
      return (value: 'N/A', unit: '', canSplit: false);
    }

    if (_looksLikeRange(t)) {
      return (value: t, unit: '', canSplit: false);
    }

    final m = RegExp(r'^([-+]?\d*\.?\d+)\s*(.+)$').firstMatch(t);
    if (m == null) return (value: t, unit: '', canSplit: false);

    final value = (m.group(1) ?? t).trim();
    final unit = (m.group(2) ?? '').trim();

    // Si la unidad tiene otro número -> no split (evita cosas raras)
    final hasAnotherNumber = RegExp(r'\d').hasMatch(unit);
    if (hasAnotherNumber) return (value: t, unit: '', canSplit: false);

    return (value: value, unit: unit, canSplit: true);
  }

  // =========================
  // Dosis actual (según tipo + medicamento)
  // =========================

  String _currentDoseString() {
    String? displayString;

    if (widget.calculoType == 'Sodio') {
      switch (widget.medicamento.nombre) {
        case 'Déficit de Sodio':
          displayString = _calculatedDoses['deficit_display'];
          break;
        case 'Volumen de SG5%':
          displayString = _calculatedDoses['volumen_display'];
          break;
        case 'Con SF':
          displayString = _calculatedDoses['con_sf_display'];
          break;
        case 'Velocidad de Infusión':
          displayString = _calculatedDoses['velocidad_display'];
          break;
      }
    } else if (widget.calculoType == 'HCO3') {
      switch (widget.medicamento.nombre) {
        case 'Déficit de HCO3':
          displayString = _calculatedDoses['deficit_display'];
          break;
        case 'Volumen de SG5% a diluir déficit de HCO3':
          displayString = _calculatedDoses['volumen_display'];
          break;
        case 'Velocidad de Infusión.':
          displayString = _calculatedDoses['velocidad_display'];
          break;
      }
    } else if (widget.calculoType == 'Liquidos IV') {
      switch (widget.medicamento.nombre) {
        case 'Solución mixta mantenimiento':
          displayString = _calculatedDoses['solucion_mixta'];
          break;
        case 'Resultado':
          displayString = _calculatedDoses['resultado'];
          break;
        case 'Goteo':
          displayString = _calculatedDoses['goteo_ml_h'];
          break;
        case 'Goteo.':
          displayString = _calculatedDoses['goteo_ml_h_ajustado'];
          break;
      }
    }

    return (displayString ?? 'N/A').trim().isEmpty ? 'N/A' : displayString!;
  }

  void _buildDoseListForUI() {
    final raw = _currentDoseString().trim();
    _displayStringForPrint = raw.isEmpty ? 'N/A' : raw;

    final parts = _splitMultiDose(_displayStringForPrint);
    _dosisList = parts.isEmpty ? ['N/A'] : parts;
  }

  // =========================
  // Clipboard
  // =========================

  void _copyToClipboard(String text) {
    final t = AppLocalizations.of(context);
    if (text.trim().isEmpty || text == 'N/A') return;

    Clipboard.setData(ClipboardData(text: text)).then((_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(t.snackbarCopied(text)),
          backgroundColor: Theme.of(context).colorScheme.secondary,
          duration: const Duration(seconds: 2),
        ),
      );
    });
  }

  // =========================
  // UI Helpers (pro)
  // =========================

  String _safeText(String v) => v.trim().isEmpty ? '—' : v.trim();

  Widget _infoLine(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 155,
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black.withAlpha((0.55 * 255).round()),
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dosePill(String doseText) {
    final parsed = _splitValueUnitSmart(doseText);

    // Si es rango o texto complejo, pill simple
    if (!parsed.canSplit) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(25, 83, 232, 103),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color.fromARGB(70, 83, 232, 103)),
        ),
        child: Text(
          parsed.value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w900,
            color: Color.fromARGB(255, 83, 232, 103),
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(25, 83, 232, 103),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color.fromARGB(70, 83, 232, 103)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            parsed.value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              color: Color.fromARGB(255, 83, 232, 103),
            ),
          ),
          if (parsed.unit.isNotEmpty) ...[
            const SizedBox(width: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: const Color.fromARGB(30, 14, 113, 194),
                borderRadius: BorderRadius.circular(999),
                border: Border.all(
                  color: const Color.fromARGB(70, 14, 113, 194),
                ),
              ),
              child: Text(
                parsed.unit,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Color.fromARGB(255, 14, 113, 194),
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  // =========================
  // Print
  // =========================

  List<MedicamentoCalculado> _getMedicamentosParaImprimir() {
    final dose = _currentDoseString();
    return [
      MedicamentoCalculado(
        medicamentoOriginal: widget.medicamento,
        dosisDisplayString: dose,
      ),
    ];
  }

  // =========================
  // Label UI para tipo de cálculo (i18n)
  // =========================
  String _calculoTypeLabel(String type, AppLocalizations t) {
    switch (type.trim()) {
      case 'Sodio':
        return t.calcTypeSodium;
      case 'HCO3':
        return t.calcTypeHco3;
      case 'Liquidos IV':
        return t.calcTypeIvFluids;
      default:
        return type;
    }
  }

  // =========================
  // Build
  // =========================
  @override
  Widget build(BuildContext context) {
    final med = widget.medicamento;
    final t = AppLocalizations.of(context);

    final dose = _currentDoseString();

    // ✅ UI traducida (si no hay key, cae al original)
    final medNameUi = MedI18n.name(med, t);
    final medNotesUi = MedI18n.notes(med, t);

    // ✅ traducir el tipo de cálculo (sin romper lógica)
    final calcTypeUi = _calculoTypeLabel(widget.calculoType, t);

    return Scaffold(
      appBar: AppBar(
        title: Text(medNameUi),
        actions: [
          IconButton(
            icon: const Icon(Icons.print),
            tooltip: t.printReportTooltip,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => PrintablePatientDataScreen(
                    paciente: widget.paciente,
                    medicamentosCalculados: _getMedicamentosParaImprimir(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            // ===== Info card =====
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        t.calcInfoTitle,
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 18,
                          color: Color.fromARGB(255, 14, 113, 194),
                        ),
                      ),
                      const SizedBox(height: 14),
                      _infoLine(t.calcTypeLabel, _safeText(calcTypeUi)),
                      _infoLine(t.calcMedicationLabel, _safeText(medNameUi)),
                      if (medNotesUi.trim().isNotEmpty)
                        _infoLine(
                          t.calcObservationsLabel,
                          _safeText(medNotesUi),
                        ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 14),

            // ===== Resultado card =====
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        t.patientCalculatedDoseTitle,
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 18,
                          color: Color.fromARGB(255, 14, 113, 194),
                        ),
                      ),
                      const SizedBox(height: 14),
                      if (dose == 'N/A')
                        Text(
                          t.notAvailable,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black.withAlpha((0.55 * 255).round()),
                          ),
                        )
                      else
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: _dosisList.map((d) {
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                _dosePill(d),
                                const SizedBox(width: 6),
                                IconButton(
                                  icon: const Icon(
                                    Icons.copy,
                                    color: Color.fromARGB(255, 14, 113, 194),
                                  ),
                                  onPressed: () => _copyToClipboard(d),
                                  tooltip: t.copyTooltip,
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
