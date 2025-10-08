// lib/screens/printable_patient_data_screen.dart

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import '../models/paciente.dart';
import '../models/medicamento_calculado.dart';
import 'package:intl/intl.dart';

class PrintablePatientDataScreen extends StatelessWidget {
  final Paciente paciente;
  final List<MedicamentoCalculado> medicamentosCalculados;

  const PrintablePatientDataScreen({
    Key? key,
    required this.paciente,
    required this.medicamentosCalculados,
  }) : super(key: key);

  Future<Uint8List> _generatePdf(PdfPageFormat format) async {
    final pdf = pw.Document();

    final ByteData bytes = await rootBundle.load('assets/images/pedx.png');
    final Uint8List byteList = bytes.buffer.asUint8List();
    final pw.MemoryImage logo = pw.MemoryImage(byteList);

    final Map<String, List<MedicamentoCalculado>>
    groupedCalculatedMedicamentos = {};
    for (var med in medicamentosCalculados) {
      final String categoria = med.medicamentoOriginal.categoria;
      if (!groupedCalculatedMedicamentos.containsKey(categoria)) {
        groupedCalculatedMedicamentos[categoria] = [];
      }
      groupedCalculatedMedicamentos[categoria]!.add(med);
    }

    final String reportDate = DateFormat(
      'dd/MM/yyyy HH:mm',
    ).format(DateTime.now());

    pdf.addPage(
      pw.MultiPage(
        pageFormat: format,
        build: (pw.Context context) {
          return [
            // Header Section
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'Reporte de Paciente',
                      style: pw.TextStyle(
                        fontSize: 14,
                        fontWeight: pw.FontWeight.bold,
                        color: PdfColors.blue800,
                      ),
                    ),
                    pw.Text(
                      'Pedx Calc - Cálculos',
                      style: const pw.TextStyle(
                        fontSize: 9,
                        color: PdfColors.grey700,
                      ),
                    ),
                  ],
                ),
                pw.Image(logo, width: 40, height: 40),
              ],
            ),
            pw.Divider(color: PdfColors.blueGrey200, thickness: 1.5),
            pw.SizedBox(height: 10),

            // Patient Data Section
            pw.Container(
              padding: const pw.EdgeInsets.all(8),
              decoration: pw.BoxDecoration(
                color: PdfColors.blueGrey50,
                borderRadius: pw.BorderRadius.circular(5),
              ),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    'Datos del Paciente:',
                    style: pw.TextStyle(
                      fontSize: 10,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.blue700,
                    ),
                  ),
                  pw.SizedBox(height: 5),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text(
                        'Peso: ${paciente.pesoKg.toStringAsFixed(2)} Kg',
                        style: const pw.TextStyle(fontSize: 9),
                      ),
                      pw.Text(
                        'Edad: ${paciente.edadAnios > 0 ? '${paciente.edadAnios} años' : '${paciente.edadMeses} meses'}',
                        style: const pw.TextStyle(fontSize: 9),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            pw.SizedBox(height: 15),

            // Calculated Medications Section
            pw.Text(
              'Medicamentos Calculados:',
              style: pw.TextStyle(
                fontSize: 10,
                fontWeight: pw.FontWeight.bold,
                color: PdfColors.blue700,
              ),
            ),
            pw.SizedBox(height: 8),

            // Iterate and display by category
            ...groupedCalculatedMedicamentos.keys.map((categoria) {
              final List<MedicamentoCalculado> medsInGroup =
                  groupedCalculatedMedicamentos[categoria]!;

              return pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.SizedBox(height: 10),
                  pw.Text(
                    categoria,
                    style: pw.TextStyle(
                      fontSize: 10,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.blue800,
                    ),
                  ),
                  pw.Divider(
                    color: PdfColors.blueGrey100,
                    height: 8,
                    thickness: 0.8,
                  ),
                  pw.Table.fromTextArray(
                    border: null,
                    cellPadding: const pw.EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 6,
                    ),
                    headerStyle: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 7,
                      color: PdfColors.white,
                    ),
                    headerDecoration: const pw.BoxDecoration(
                      color: PdfColors.blue600,
                    ),
                    cellAlignment: pw.Alignment.centerLeft,
                    cellStyle: const pw.TextStyle(fontSize: 6),
                    // Cambia los encabezados de la tabla a solo los que necesitas
                    headers: [
                      'Medicamento',
                      'Dosis Calculada', // Un solo encabezado para la dosis
                      'Observaciones',
                    ],
                    data: medsInGroup.map((med) {
                      // **Lógica corregida para mostrar la dosis calculada**
                      final String dosisToDisplay;
                      if (med.dosisDisplayString != 'N/A') {
                        dosisToDisplay = med.dosisDisplayString;
                      } else {
                        // Combina las dosis numéricas si existen
                        final List<String> numericDoses = [];
                        if (med.dosisMgDisplay != 'N/A') {
                          numericDoses.add(med.dosisMgDisplay);
                        }
                        if (med.dosisMlDisplay != 'N/A') {
                          numericDoses.add(med.dosisMlDisplay);
                        }
                        if (med.dosisJuliosDisplay != 'N/A') {
                          numericDoses.add(med.dosisJuliosDisplay);
                        }
                        dosisToDisplay = numericDoses.join(' / ');
                      }

                      return [
                        med.medicamentoOriginal.nombre,
                        dosisToDisplay,
                        med.medicamentoOriginal.observaciones ?? 'N/A',
                      ];
                    }).toList(),
                  ),
                ],
              );
            }).toList(),

            pw.Spacer(),
            // Footer Section
            pw.Divider(color: PdfColors.blueGrey200, thickness: 1),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(
                  'Generado por Pedx Calc',
                  style: const pw.TextStyle(
                    fontSize: 7,
                    color: PdfColors.grey600,
                  ),
                ),
                pw.Text(
                  'Fecha: $reportDate',
                  style: const pw.TextStyle(
                    fontSize: 7,
                    color: PdfColors.grey600,
                  ),
                ),
              ],
            ),
          ];
        },
      ),
    );

    return pdf.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reporte de Paciente')),
      body: PdfPreview(
        build: (format) => _generatePdf(format),
        onPrinted: (context) {},
        onError: (context, error) {
          return Center(child: Text('Error al generar PDF: $error'));
        },
      ),
    );
  }
}
