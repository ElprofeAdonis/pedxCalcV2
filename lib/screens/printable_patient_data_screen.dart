import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:intl/intl.dart';

import '../models/paciente.dart';
import '../models/medicamento_calculado.dart';
import '../l10n/app_localizations.dart';
import '../i18n/med_i18n.dart';

class PrintablePatientDataScreen extends StatelessWidget {
  final Paciente paciente;
  final List<MedicamentoCalculado> medicamentosCalculados;

  const PrintablePatientDataScreen({
    super.key,
    required this.paciente,
    required this.medicamentosCalculados,
  });

  // ✅ Sanitiza caracteres que suelen romper el PDF (emoji/dashes)
  String _pdfSafe(String s, AppLocalizations t) {
    final v = s.trim();
    if (v.isEmpty) return t.commonDash;

    return v
        .replaceAll('—', '-') // em dash
        .replaceAll('–', '-') // en dash
        .replaceAll('✅', 'OK') // emoji
        .replaceAll('⚠️', '!'); // emoji
  }

  String _safeObs(String v, AppLocalizations t) => _pdfSafe(v, t);

  String _dosisToDisplay(MedicamentoCalculado med, AppLocalizations t) {
    final ds = med.dosisDisplayString.trim();
    if (ds.isNotEmpty && ds != 'N/A') return _pdfSafe(ds, t);

    final parts = <String>[];
    if (med.dosisMgDisplay.trim().isNotEmpty && med.dosisMgDisplay != 'N/A') {
      parts.add(med.dosisMgDisplay);
    }
    if (med.dosisMlDisplay.trim().isNotEmpty && med.dosisMlDisplay != 'N/A') {
      parts.add(med.dosisMlDisplay);
    }
    if (med.dosisJuliosDisplay.trim().isNotEmpty &&
        med.dosisJuliosDisplay != 'N/A') {
      parts.add(med.dosisJuliosDisplay);
    }

    final joined = parts.join(' / ').trim();
    return joined.isEmpty ? t.commonNA : _pdfSafe(joined, t);
  }

  String _ageDisplay(Paciente p, AppLocalizations t) {
    if (p.edadAnios > 0) return '${p.edadAnios} ${t.printYearsUnit}';
    return '${p.edadMeses} ${t.printMonthsUnit}';
  }

  Future<Uint8List> _generatePdf(
    PdfPageFormat format,
    AppLocalizations t,
  ) async {
    final pdf = pw.Document();

    // ✅ Fuentes SIN assets (funciona mejor en Web/Chrome)
    final fontRegular = await PdfGoogleFonts.robotoRegular();
    final fontBold = await PdfGoogleFonts.robotoBold();

    final theme = pw.ThemeData.withFont(base: fontRegular, bold: fontBold);

    // Logo
    final bytes = await rootBundle.load('assets/images/pedx.png');
    final logo = pw.MemoryImage(bytes.buffer.asUint8List());

    // Agrupar por categoría
    final Map<String, List<MedicamentoCalculado>> grouped = {};
    for (final med in medicamentosCalculados) {
      final cat = med.medicamentoOriginal.categoria;
      grouped.putIfAbsent(cat, () => []);
      grouped[cat]!.add(med);
    }

    final categoriasOrdenadas = grouped.keys.toList()..sort();
    for (final cat in categoriasOrdenadas) {
      grouped[cat]!.sort(
        (a, b) => MedI18n.name(
          a.medicamentoOriginal,
          t,
        ).compareTo(MedI18n.name(b.medicamentoOriginal, t)),
      );
    }

    final reportDate = DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now());

    pdf.addPage(
      pw.MultiPage(
        theme: theme,
        pageFormat: format,
        margin: const pw.EdgeInsets.fromLTRB(28, 24, 28, 24),

        header: (context) => pw.Column(
          children: [
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      _pdfSafe(t.printPatientReportTitle, t),
                      style: pw.TextStyle(
                        fontSize: 16,
                        fontWeight: pw.FontWeight.bold,
                        color: PdfColors.blue800,
                      ),
                    ),
                    pw.SizedBox(height: 2),
                    pw.Text(
                      _pdfSafe(t.printAppSubtitle, t),
                      style: const pw.TextStyle(
                        fontSize: 9,
                        color: PdfColors.grey700,
                      ),
                    ),
                  ],
                ),
                pw.Container(
                  width: 44,
                  height: 44,
                  padding: const pw.EdgeInsets.all(6),
                  decoration: pw.BoxDecoration(
                    color: PdfColors.blue50,
                    borderRadius: pw.BorderRadius.circular(10),
                    border: pw.Border.all(color: PdfColors.blue100),
                  ),
                  child: pw.Image(logo),
                ),
              ],
            ),
            pw.SizedBox(height: 8),
            pw.Divider(color: PdfColors.blueGrey200, thickness: 1),
          ],
        ),

        footer: (context) => pw.Column(
          children: [
            pw.Divider(color: PdfColors.blueGrey200, thickness: 1),
            pw.SizedBox(height: 4),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(
                  _pdfSafe(t.printGeneratedBy, t),
                  style: const pw.TextStyle(
                    fontSize: 7,
                    color: PdfColors.grey600,
                  ),
                ),
                pw.Text(
                  '${_pdfSafe(t.printDateLabel, t)}: $reportDate · '
                  '${_pdfSafe(t.printPageLabel, t)} ${context.pageNumber} '
                  '${_pdfSafe(t.printPageOfLabel, t)} ${context.pagesCount}',
                  style: const pw.TextStyle(
                    fontSize: 7,
                    color: PdfColors.grey600,
                  ),
                ),
              ],
            ),
          ],
        ),

        build: (context) {
          return [
            pw.SizedBox(height: 10),

            pw.Container(
              padding: const pw.EdgeInsets.all(10),
              decoration: pw.BoxDecoration(
                color: PdfColors.blueGrey50,
                borderRadius: pw.BorderRadius.circular(8),
                border: pw.Border.all(color: PdfColors.blueGrey100),
              ),
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        _pdfSafe(t.printPatientDataTitle, t),
                        style: pw.TextStyle(
                          fontSize: 10,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.blue700,
                        ),
                      ),
                      pw.SizedBox(height: 6),
                      pw.Text(
                        '${_pdfSafe(t.printWeightLabel, t)}: ${paciente.pesoKg.toStringAsFixed(2)} kg',
                        style: const pw.TextStyle(fontSize: 9),
                      ),
                    ],
                  ),
                  pw.Text(
                    '${_pdfSafe(t.printAgeLabel, t)}: ${_ageDisplay(paciente, t)}',
                    style: const pw.TextStyle(fontSize: 9),
                  ),
                ],
              ),
            ),

            pw.SizedBox(height: 14),

            pw.Text(
              _pdfSafe(t.printMedsCalculatedTitle, t),
              style: pw.TextStyle(
                fontSize: 11,
                fontWeight: pw.FontWeight.bold,
                color: PdfColors.blue700,
              ),
            ),
            pw.SizedBox(height: 8),

            ...categoriasOrdenadas.map((categoria) {
              final meds = grouped[categoria]!;
              final data = meds.map((med) {
                return [
                  _pdfSafe(MedI18n.name(med.medicamentoOriginal, t), t),
                  _dosisToDisplay(med, t),
                  _safeObs(MedI18n.notes(med.medicamentoOriginal, t), t),
                ];
              }).toList();

              return pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.SizedBox(height: 10),
                  pw.Text(
                    _pdfSafe(MedI18n.category(categoria, t), t),
                    style: pw.TextStyle(
                      fontSize: 10.5,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.blue800,
                    ),
                  ),
                  pw.SizedBox(height: 6),
                  pw.Table.fromTextArray(
                    headers: [
                      _pdfSafe(t.printTableHeaderMedication, t),
                      _pdfSafe(t.printTableHeaderDose, t),
                      _pdfSafe(t.printTableHeaderNotes, t),
                    ],
                    data: data,
                    border: null,
                    headerDecoration: const pw.BoxDecoration(
                      color: PdfColors.blue600,
                    ),
                    headerStyle: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 9,
                      color: PdfColors.white,
                    ),
                    cellStyle: const pw.TextStyle(fontSize: 8),
                    cellPadding: const pw.EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 6,
                    ),
                    columnWidths: {
                      0: const pw.FlexColumnWidth(2.2),
                      1: const pw.FlexColumnWidth(1.0),
                      2: const pw.FlexColumnWidth(1.8),
                    },
                    cellAlignments: {
                      0: pw.Alignment.centerLeft,
                      1: pw.Alignment.center,
                      2: pw.Alignment.centerLeft,
                    },
                    rowDecoration: const pw.BoxDecoration(
                      color: PdfColors.white,
                    ),
                    oddRowDecoration: const pw.BoxDecoration(
                      color: PdfColors.blueGrey50,
                    ),
                  ),
                ],
              );
            }).toList(),
          ];
        },
      ),
    );

    return pdf.save();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(t.printPatientReportTitle)),
      body: PdfPreview(
        build: (format) => _generatePdf(format, t),
        onError: (context, error) =>
            Center(child: Text(t.printPreviewError(error.toString()))),
      ),
    );
  }
}
