// lib/screens/medicamento_detail_meses_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mi_app/models/medicamento.dart';
import 'package:mi_app/models/paciente.dart';
import 'package:mi_app/utils/dosis_calculator_meses.dart';
import 'package:mi_app/screens/printable_patient_data_screen.dart';
import 'package:mi_app/models/medicamento_calculado.dart';
import '../l10n/app_localizations.dart';

// ✅ i18n meds
import '../i18n/med_i18n.dart';

class MedicamentoDetailMesesScreen extends StatefulWidget {
  final Medicamento medicamento;
  final Paciente paciente;

  const MedicamentoDetailMesesScreen({
    super.key,
    required this.medicamento,
    required this.paciente,
  });

  @override
  State<MedicamentoDetailMesesScreen> createState() =>
      _MedicamentoDetailMesesScreenState();
}

class _MedicamentoDetailMesesScreenState
    extends State<MedicamentoDetailMesesScreen> {
  late List<String> _dosisList;
  late String _displayStringForPrint;

  @override
  void initState() {
    super.initState();
    _calculateAndFormatDoses();
  }

  // ---------- Helpers parsing ----------

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
    final Map<String, dynamic> calculatedDoses =
        DosisCalculatorMeses.calculateDosis(
          widget.paciente,
          widget.medicamento,
        );

    _dosisList = [];
    _displayStringForPrint = 'N/A';

    if (calculatedDoses.containsKey('display_string')) {
      final ds = (calculatedDoses['display_string'] ?? 'N/A').toString().trim();
      _displayStringForPrint = ds.isEmpty ? 'N/A' : ds;

      final parts = _splitMultiDose(_displayStringForPrint);
      _dosisList = parts.isNotEmpty ? parts : ['N/A'];
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

  // ---------- Clipboard ----------

  void _copyToClipboard(String text, AppLocalizations t) {
    if (text.trim().isEmpty || text.toUpperCase() == 'N/A') return;
    Clipboard.setData(ClipboardData(text: text)).then((_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(t.copiedText(text)),
          duration: const Duration(seconds: 2),
        ),
      );
    });
  }

  String _safeText(String v) => v.trim().isEmpty ? '—' : v.trim();

  // ✅ helper: mostrar solo si hay texto útil
  bool _hasText(String v) => v.trim().isNotEmpty && v.trim() != '—';

  // ---------- UI helpers ----------

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
      return _pill(parsed.value);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: _pillDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(parsed.value, style: _pillValueStyle()),
          if (parsed.unit.isNotEmpty) ...[
            const SizedBox(width: 10),
            _pillUnit(parsed.unit),
          ],
        ],
      ),
    );
  }

  BoxDecoration _pillDecoration() => BoxDecoration(
    color: const Color.fromARGB(25, 83, 232, 103),
    borderRadius: BorderRadius.circular(14),
    border: Border.all(color: const Color.fromARGB(70, 83, 232, 103)),
  );

  TextStyle _pillValueStyle() => const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w900,
    color: Color.fromARGB(255, 83, 232, 103),
  );

  Widget _pill(String text) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
    decoration: _pillDecoration(),
    child: Text(text, style: _pillValueStyle()),
  );

  Widget _pillUnit(String unit) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    decoration: BoxDecoration(
      color: const Color.fromARGB(30, 14, 113, 194),
      borderRadius: BorderRadius.circular(999),
      border: Border.all(color: const Color.fromARGB(70, 14, 113, 194)),
    ),
    child: Text(
      unit,
      style: const TextStyle(
        fontWeight: FontWeight.w900,
        color: Color.fromARGB(255, 14, 113, 194),
        fontSize: 12,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final med = widget.medicamento;

    // ✅ TEXTOS TRADUCIDOS (si no existen keys, caen al original)
    final medName = MedI18n.name(med, t);
    final medCategory = MedI18n.category(med.categoria, t);

    final medRange = MedI18n.rangeDose(med, t); // rangoDosisOriginal traducido
    final medDose = MedI18n.currentDose(med, t); // dosisActualMG traducida
    final medNotes = MedI18n.notes(med, t); // observaciones traducidas

    final medicamentoCalculadoParaImprimir = MedicamentoCalculado(
      medicamentoOriginal: med,
      dosisDisplayString: _displayStringForPrint,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(medName), // ✅ antes: med.nombre
        actions: [
          IconButton(
            icon: const Icon(Icons.print),
            tooltip: t.printReport,
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
                    Text(t.medInfoTitle, style: _sectionTitle()),
                    const SizedBox(height: 14),

                    // ✅ categoría traducida
                    _infoLine(t.medCategory, _safeText(medCategory)),

                    if (med.subcategoria?.trim().isNotEmpty ?? false)
                      _infoLine(t.medSubcategory, _safeText(med.subcategoria!)),

                    // ✅ rango traducido (solo si trae texto útil)
                    if (_hasText(_safeText(medRange)))
                      _infoLine(t.medOriginalDoseRange, _safeText(medRange)),

                    // ✅ dosis traducida
                    if (_hasText(_safeText(medDose)))
                      _infoLine(t.medPediatricDose, _safeText(medDose)),

                    // ✅ observaciones traducidas
                    if (_hasText(_safeText(medNotes)))
                      _infoLine(t.medObservations, _safeText(medNotes)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 14),
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
                    Text(t.calculatedDoseTitle, style: _sectionTitle()),
                    const SizedBox(height: 14),
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
                              icon: const Icon(Icons.copy),
                              tooltip: t.copy,
                              onPressed: () => _copyToClipboard(d, t),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle _sectionTitle() => const TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 18,
    color: Color.fromARGB(255, 14, 113, 194),
  );
}
