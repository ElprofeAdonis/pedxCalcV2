// lib/screens/medicamento_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mi_app/models/medicamento.dart';
import 'package:mi_app/models/paciente.dart';
import 'package:mi_app/utils/dosis_calculator.dart';
import 'package:mi_app/screens/printable_patient_data_screen.dart';
import 'package:mi_app/models/medicamento_calculado.dart';
import '../l10n/app_localizations.dart';

// ✅ i18n meds
import '../i18n/med_i18n.dart';

class MedicamentoDetailScreen extends StatefulWidget {
  final Medicamento medicamento;
  final Paciente paciente;

  const MedicamentoDetailScreen({
    super.key,
    required this.medicamento,
    required this.paciente,
  });

  @override
  State<MedicamentoDetailScreen> createState() =>
      _MedicamentoDetailScreenState();
}

class _MedicamentoDetailScreenState extends State<MedicamentoDetailScreen> {
  late List<String> _dosisList;
  late String _displayStringForPrint;

  @override
  void initState() {
    super.initState();
    _calculateAndFormatDoses();
  }

  // ---------- Helpers de parsing ----------

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

  // ---------- Cálculo ----------

  void _calculateAndFormatDoses() {
    final Map<String, dynamic> calculatedDoses = DosisCalculator.calculateDosis(
      widget.paciente,
      widget.medicamento,
    );

    _dosisList = [];
    _displayStringForPrint = 'N/A';

    if (calculatedDoses.containsKey('display_string')) {
      final ds = (calculatedDoses['display_string'] ?? 'N/A').toString().trim();
      _displayStringForPrint = ds.isEmpty ? 'N/A' : ds;

      final parts = _splitMultiDose(_displayStringForPrint);
      if (parts.isNotEmpty) {
        _dosisList.addAll(parts);
      } else {
        _dosisList.add('N/A');
      }
      return;
    }

    final double ml = (calculatedDoses['ml'] as double?) ?? 0.0;
    final double mg = (calculatedDoses['mg'] as double?) ?? 0.0;
    final double j = (calculatedDoses['julios'] as double?) ?? 0.0;

    if (ml.abs() > 0.005) _dosisList.add('${ml.toStringAsFixed(2)} ml');
    if (mg.abs() > 0.005) _dosisList.add('${mg.toStringAsFixed(2)} mg');
    if (j.abs() > 0.005) _dosisList.add('${j.toStringAsFixed(2)} J');

    if (_dosisList.isEmpty) _dosisList.add('N/A');
  }

  void _copyToClipboard(String text, AppLocalizations t) {
    Clipboard.setData(ClipboardData(text: text)).then((_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(t.medDetailCopied(text)),
          duration: const Duration(seconds: 2),
        ),
      );
    });
  }

  String _safeText(String v, AppLocalizations t) =>
      v.trim().isEmpty ? t.commonDash : v.trim();

  bool _hasText(String v, AppLocalizations t) {
    final s = _safeText(v, t).trim();
    return s.isNotEmpty && s != t.commonDash;
  }

  // ---------- UI ----------

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

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final med = widget.medicamento;

    // ✅ UI traducida
    final medNameUi = MedI18n.name(med, t);
    final medCategoryUi = MedI18n.category(med.categoria, t);
    final medRangeUi = MedI18n.rangeDose(med, t);
    final medDoseUi = MedI18n.currentDose(med, t);
    final medNotesUi = MedI18n.notes(med, t);

    // Para imprimir (sin tocar tu lógica)
    final medicamentoCalculadoParaImprimir = MedicamentoCalculado(
      medicamentoOriginal: med,
      dosisDisplayString: _displayStringForPrint,
      dosisMlDisplay: _dosisList.firstWhere(
        (e) => e.toLowerCase().contains('ml'),
        orElse: () => t.commonNA,
      ),
      dosisMgDisplay: _dosisList.firstWhere(
        (e) => e.toLowerCase().contains('mg') || e.contains('µg'),
        orElse: () => t.commonNA,
      ),
      dosisJuliosDisplay: _dosisList.firstWhere(
        (e) => e.contains('J'),
        orElse: () => t.commonNA,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(medNameUi), // ✅ antes: med.nombre
        actions: [
          IconButton(
            icon: const Icon(Icons.print),
            tooltip: t.medDetailPrintTooltip,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PrintablePatientDataScreen(
                    paciente: widget.paciente,
                    medicamentosCalculados: [medicamentoCalculadoParaImprimir],
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
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      t.medDetailInfoTitle,
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                        color: Color.fromARGB(255, 14, 113, 194),
                      ),
                    ),
                    const SizedBox(height: 14),

                    _infoLine(t.medDetailCategory, _safeText(medCategoryUi, t)),

                    if (med.subcategoria != null &&
                        med.subcategoria!.trim().isNotEmpty)
                      _infoLine(
                        t.medDetailSubcategory,
                        _safeText(med.subcategoria!, t),
                      ),

                    if (_hasText(medRangeUi, t))
                      _infoLine(
                        t.medDetailOriginalDoseRange,
                        _safeText(medRangeUi, t),
                      ),

                    if (_hasText(medDoseUi, t))
                      _infoLine(
                        t.medDetailPediatricDose,
                        _safeText(medDoseUi, t),
                      ),

                    if (_hasText(medNotesUi, t))
                      _infoLine(t.medDetailNotes, _safeText(medNotesUi, t)),
                  ],
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
                        t.medDetailDoseTitle,
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
                                onPressed: () => _copyToClipboard(d, t),
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
