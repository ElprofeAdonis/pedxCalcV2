import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mi_app/models/paciente.dart';
import 'package:mi_app/models/medicamento.dart';
import 'package:mi_app/utils/dosis_calculator_meses.dart';
import 'package:mi_app/screens/printable_patient_data_screen.dart';
import 'package:mi_app/models/medicamento_calculado.dart';

import '../l10n/app_localizations.dart';
import '../i18n/med_i18n.dart'; // ✅ NUEVO

class LiquidIVDetailScreen extends StatefulWidget {
  final Paciente paciente;
  final Medicamento medicamento;
  final double porcentajeLiquidos;
  final double? sodioValor;
  final double? hco3Valor;

  const LiquidIVDetailScreen({
    super.key,
    required this.paciente,
    required this.medicamento,
    required this.porcentajeLiquidos,
    this.hco3Valor,
    this.sodioValor,
  });

  @override
  State<LiquidIVDetailScreen> createState() => _LiquidIVDetailScreenState();
}

class _LiquidIVDetailScreenState extends State<LiquidIVDetailScreen> {
  // Para casos normales (liquidos iv / otros)
  late String _dosisDisplay;
  late String _dosisMgFormateada;
  late String _dosisJuliosFormateada;

  // Para casos especiales
  Map<String, dynamic>? _hco3Doses;
  Map<String, dynamic>? _sodioDoses;

  // UI tipo “pills”
  late List<String> _dosisList;
  late String _displayStringForPrint;

  String _computeDoseForPrintNow() {
    // 👇 Siempre toma la dosis REAL en el momento de imprimir
    // (incluye tus casos especiales HCO3/Sodio)
    final ds = _currentDoseString().trim();
    if (ds.isNotEmpty && ds != 'N/A') return ds;

    // Si por alguna razón aún no está listo, recalcula aquí mismo:
    final calculated = DosisCalculatorMeses.calculateDosis(
      widget.paciente,
      widget.medicamento,
      porcentaje: widget.porcentajeLiquidos,
    );

    if (calculated.containsKey('display_string')) {
      final v = (calculated['display_string'] ?? 'N/A').toString().trim();
      return v.isEmpty ? 'N/A' : v;
    }

    final double ml = (calculated['ml'] as double?) ?? 0.0;
    final double mg = (calculated['mg'] as double?) ?? 0.0;
    final double j = (calculated['julios'] as double?) ?? 0.0;

    final parts = <String>[];
    if (ml.abs() > 0.005)
      parts.add('${DosisCalculatorMeses.formatDosis(ml)} ml');
    if (mg.abs() > 0.005)
      parts.add('${DosisCalculatorMeses.formatDosis(mg)} mg');
    if (j.abs() > 0.005) parts.add('${DosisCalculatorMeses.formatDosis(j)} J');

    return parts.isEmpty ? 'N/A' : parts.join(' / ');
  }

  @override
  void initState() {
    super.initState();

    _dosisDisplay = 'N/A';
    _dosisMgFormateada = 'N/A';
    _dosisJuliosFormateada = 'N/A';
    _dosisList = ['N/A'];
    _displayStringForPrint = 'N/A';

    if (widget.medicamento.categoria == 'Reposición de HCO3') {
      _calculateHco3Doses();
    } else if (widget.medicamento.categoria == 'Reposición de Sodio') {
      _calculateSodioDoses();
    } else {
      _calculateAndFormatDoses();
    }

    _buildDoseListForUI();
  }

  // =========================
  // Helpers de parsing
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

    if (_looksLikeRange(v)) return [v];

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

    final hasAnotherNumber = RegExp(r'\d').hasMatch(unit);
    if (hasAnotherNumber) {
      return (value: t, unit: '', canSplit: false);
    }

    return (value: value, unit: unit, canSplit: true);
  }

  // =========================
  // Cálculos
  // =========================

  void _calculateSodioDoses() {
    final double sodioValor = widget.sodioValor ?? 0.0;
    _sodioDoses = DosisCalculatorMeses.calculateSodioDosis(
      widget.paciente,
      sodioValor,
    );
  }

  void _calculateHco3Doses() {
    final double hco3Valor = widget.hco3Valor ?? 0.0;
    _hco3Doses = DosisCalculatorMeses.calculateHco3Dosis(
      widget.paciente,
      hco3Valor,
    );
  }

  void _calculateAndFormatDoses() {
    final calculatedDoses = DosisCalculatorMeses.calculateDosis(
      widget.paciente,
      widget.medicamento,
      porcentaje: widget.porcentajeLiquidos,
    );

    if (calculatedDoses.containsKey('display_string')) {
      _dosisDisplay = (calculatedDoses['display_string'] ?? 'N/A').toString();
      _dosisMgFormateada = 'N/A';
      _dosisJuliosFormateada = 'N/A';
      return;
    }

    final double dosisMl = (calculatedDoses['ml'] as double?) ?? 0.0;
    final double dosisMg = (calculatedDoses['mg'] as double?) ?? 0.0;
    final double dosisJulios = (calculatedDoses['julios'] as double?) ?? 0.0;

    _dosisDisplay = dosisMl.abs() > 0.005
        ? '${DosisCalculatorMeses.formatDosis(dosisMl)} ml'
        : 'N/A';

    _dosisMgFormateada = dosisMg.abs() > 0.005
        ? '${DosisCalculatorMeses.formatDosis(dosisMg)} mg'
        : 'N/A';

    _dosisJuliosFormateada = dosisJulios.abs() > 0.005
        ? '${DosisCalculatorMeses.formatDosis(dosisJulios)} J'
        : 'N/A';
  }

  String _currentDoseString() {
    final nombre = widget.medicamento.nombre.trim().toLowerCase();

    if (widget.medicamento.categoria == 'Reposición de HCO3') {
      if (_hco3Doses == null) return 'N/A';

      if (nombre.contains('déficit') || nombre.contains('deficit')) {
        return (_hco3Doses!['deficit_display'] ?? 'N/A').toString();
      }

      if (nombre.contains('volumen')) {
        return (_hco3Doses!['volumen_display'] ?? 'N/A').toString();
      }

      // ✅ aquí estaba el fallo por mayúsculas / textos distintos
      if (nombre.contains('velocidad')) {
        return (_hco3Doses!['velocidad_display'] ?? 'N/A').toString();
      }

      return 'N/A';
    }

    if (widget.medicamento.categoria == 'Reposición de Sodio') {
      if (_sodioDoses == null) return 'N/A';

      if (nombre.contains('déficit') || nombre.contains('deficit')) {
        return (_sodioDoses!['deficit_display'] ?? 'N/A').toString();
      }

      if (nombre.contains('volumen')) {
        return (_sodioDoses!['volumen_display'] ?? 'N/A').toString();
      }

      if (nombre.contains('velocidad')) {
        return (_sodioDoses!['velocidad_display'] ?? 'N/A').toString();
      }

      if (nombre.contains('con sf') || nombre == 'con sf') {
        return (_sodioDoses!['con_sf_display'] ?? 'N/A').toString();
      }

      return 'N/A';
    }

    // normales
    if (_dosisDisplay.trim().isNotEmpty && _dosisDisplay != 'N/A') {
      return _dosisDisplay;
    }

    final parts = <String>[];
    if (_dosisMgFormateada != 'N/A') parts.add(_dosisMgFormateada);
    if (_dosisJuliosFormateada != 'N/A') parts.add(_dosisJuliosFormateada);

    return parts.isEmpty ? 'N/A' : parts.join(' / ');
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
          duration: const Duration(seconds: 2),
        ),
      );
    });
  }

  // =========================
  // UI helpers
  // =========================

  String _safeText(String v) => v.trim().isEmpty ? '—' : v.trim();
  bool _hasText(String v) => v.trim().isNotEmpty && v.trim() != '—';

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

  List<MedicamentoCalculado> _getMedicamentosParaImprimir(AppLocalizations t) {
    final doseForPrint = _computeDoseForPrintNow();

    // 🔥 construye la lista “para PDF” desde el doseForPrint real
    final partsForPrint = _splitMultiDose(doseForPrint);
    final listForPickers = partsForPrint.isEmpty
        ? <String>[doseForPrint]
        : partsForPrint;

    return [
      MedicamentoCalculado(
        medicamentoOriginal: widget.medicamento,
        dosisDisplayString: doseForPrint,

        dosisMlDisplay: listForPickers.firstWhere(
          (e) => e.toLowerCase().contains('ml'),
          orElse: () => t.commonNA,
        ),
        dosisMgDisplay: listForPickers.firstWhere(
          (e) => e.toLowerCase().contains('mg') || e.contains('µg'),
          orElse: () => t.commonNA,
        ),
        dosisJuliosDisplay: listForPickers.firstWhere(
          (e) => e.contains('J'),
          orElse: () => t.commonNA,
        ),
      ),
    ];
  }

  // =========================
  // Build
  // =========================

  @override
  Widget build(BuildContext context) {
    final med = widget.medicamento;
    final t = AppLocalizations.of(context);

    // ✅ Textos traducidos (si no hay mapping, cae al original)
    final medName = MedI18n.name(med, t);
    final medCategory = MedI18n.category(med.categoria, t);
    final medRange = MedI18n.rangeDose(med, t);
    final medDose = MedI18n.currentDose(med, t);
    final medNotes = MedI18n.notes(med, t);

    return Scaffold(
      appBar: AppBar(
        title: Text(medName), // ✅ antes: med.nombre
        actions: [
          IconButton(
            icon: const Icon(Icons.print),
            tooltip: t.printReportTooltip,
            onPressed: () {
              final t = AppLocalizations.of(context);

              // 1) Recalcular dosis AHORA MISMO (no uses variables de initState)
              final calculated = DosisCalculatorMeses.calculateDosis(
                widget.paciente,
                widget.medicamento,
                porcentaje: widget.porcentajeLiquidos,
              );

              debugPrint('PRINT CALC: $calculated');

              String doseString;
              if (calculated.containsKey('display_string')) {
                final v = (calculated['display_string'] ?? 'N/A')
                    .toString()
                    .trim();
                doseString = v.isEmpty ? 'N/A' : v;
              } else {
                final double ml = (calculated['ml'] as double?) ?? 0.0;
                final double mg = (calculated['mg'] as double?) ?? 0.0;
                final double j = (calculated['julios'] as double?) ?? 0.0;

                final parts = <String>[];
                if (ml.abs() > 0.005)
                  parts.add('${DosisCalculatorMeses.formatDosis(ml)} ml');
                if (mg.abs() > 0.005)
                  parts.add('${DosisCalculatorMeses.formatDosis(mg)} mg');
                if (j.abs() > 0.005)
                  parts.add('${DosisCalculatorMeses.formatDosis(j)} J');

                doseString = parts.isEmpty ? 'N/A' : parts.join(' / ');
              }

              // 2) Crear el MedicamentoCalculado como en MedicamentoDetailScreen
              final partsForPickers = _splitMultiDose(doseString);
              final listForPickers = partsForPickers.isEmpty
                  ? <String>[doseString]
                  : partsForPickers;

              final medCalc = MedicamentoCalculado(
                medicamentoOriginal: widget.medicamento,
                dosisDisplayString: doseString,
                dosisMlDisplay: listForPickers.firstWhere(
                  (e) => e.toLowerCase().contains('ml'),
                  orElse: () => t.commonNA,
                ),
                dosisMgDisplay: listForPickers.firstWhere(
                  (e) => e.toLowerCase().contains('mg') || e.contains('µg'),
                  orElse: () => t.commonNA,
                ),
                dosisJuliosDisplay: listForPickers.firstWhere(
                  (e) => e.contains('J'),
                  orElse: () => t.commonNA,
                ),
              );

              // 3) Enviar al PDF
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PrintablePatientDataScreen(
                    paciente: widget.paciente,
                    medicamentosCalculados: [medCalc],
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
                        t.medInfoTitle,
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 18,
                          color: Color.fromARGB(255, 14, 113, 194),
                        ),
                      ),
                      const SizedBox(height: 14),

                      // ✅ Categoría traducida
                      _infoLine(t.medInfoCategoryLabel, _safeText(medCategory)),

                      if (med.subcategoria != null &&
                          med.subcategoria!.trim().isNotEmpty)
                        _infoLine(
                          t.medInfoSubcategoryLabel,
                          _safeText(med.subcategoria!),
                        ),

                      // ✅ Rango traducido
                      if (_hasText(_safeText(medRange)))
                        _infoLine(
                          t.medInfoOriginalDoseRangeLabel,
                          _safeText(medRange),
                        ),

                      // ✅ Dosis pediátrica traducida
                      if (_hasText(_safeText(medDose)))
                        _infoLine(
                          t.medInfoPediatricDoseLabel,
                          _safeText(medDose),
                        ),

                      // ✅ Observaciones traducidas
                      if (_hasText(_safeText(medNotes)))
                        _infoLine(
                          t.medInfoObservationsLabel,
                          _safeText(medNotes),
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
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: _dosisList.map((d) {
                          return Wrap(
                            spacing: 6,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              ConstrainedBox(
                                constraints: const BoxConstraints(
                                  maxWidth: 280,
                                ), // ajusta 240-320
                                child: _dosePill(d),
                              ),
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
