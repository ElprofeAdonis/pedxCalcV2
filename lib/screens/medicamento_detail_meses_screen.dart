// lib/screens/medicamento_detail_meses_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Importación para Clipboard
import 'package:mi_app/models/medicamento.dart';
import 'package:mi_app/models/paciente.dart';
import 'package:mi_app/utils/dosis_calculator_meses.dart'; // Importación para pacientes en meses
import 'package:mi_app/screens/printable_patient_data_screen.dart';
import 'package:mi_app/models/medicamento_calculado.dart';

class MedicamentoDetailMesesScreen extends StatefulWidget {
  final Medicamento medicamento;
  final Paciente paciente;

  const MedicamentoDetailMesesScreen({
    Key? key,
    required this.medicamento,
    required this.paciente,
  }) : super(key: key);

  @override
  _MedicamentoDetailMesesScreenState createState() =>
      _MedicamentoDetailMesesScreenState();
}

class _MedicamentoDetailMesesScreenState
    extends State<MedicamentoDetailMesesScreen> {
  late String dosisMlFormateada;
  late String dosisMgFormateada;
  late String dosisJuliosFormateada;
  late String dosisStringFormateada;

  @override
  void initState() {
    super.initState();
    _calculateAndFormatDoses();
  }

  void _calculateAndFormatDoses() {
    final Map<String, dynamic> calculatedDoses =
        DosisCalculatorMeses.calculateDosis(
          widget.paciente,
          widget.medicamento,
        );
    if (calculatedDoses.containsKey('display_string')) {
      dosisStringFormateada = calculatedDoses['display_string'] as String;
      dosisMlFormateada = 'N/A';
      dosisMgFormateada = 'N/A';
      dosisJuliosFormateada = 'N/A';
    } else {
      dosisStringFormateada = 'N/A';
      final double dosisMl = (calculatedDoses['ml'] as double?) ?? 0.0;
      final double dosisMg = (calculatedDoses['mg'] as double?) ?? 0.0;
      final double dosisJulios = (calculatedDoses['julios'] as double?) ?? 0.0;

      dosisMlFormateada = dosisMl > 0.005
          ? '${dosisMl.toStringAsFixed(2)} ml'
          : 'N/A';
      dosisMgFormateada = dosisMg > 0.005
          ? '${dosisMg.toStringAsFixed(2)} mg'
          : 'N/A';
      dosisJuliosFormateada = dosisJulios > 0.005
          ? '${dosisJulios.toStringAsFixed(2)} J'
          : 'N/A';
    }
  }

  void copyToClipboard(String text) {
    if (text == 'N/A') return;
    Clipboard.setData(ClipboardData(text: text)).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('"${text}" copiado al portapapeles'),
          backgroundColor: Theme.of(context).colorScheme.secondary,
          duration: const Duration(seconds: 2),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final MedicamentoCalculado medicamentoCalculadoParaImprimir =
        MedicamentoCalculado(
          medicamentoOriginal: widget.medicamento,
          dosisMlDisplay: dosisStringFormateada != 'N/A'
              ? dosisStringFormateada
              : dosisMlFormateada,
          dosisMgDisplay: dosisMgFormateada,
          dosisJuliosDisplay: dosisJuliosFormateada,
        );

    final Color onSurfaceColor = Theme.of(context).colorScheme.onSurface;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.medicamento.nombre),
        actions: [
          IconButton(
            icon: const Icon(Icons.print),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PrintablePatientDataScreen(
                    paciente: widget.paciente,
                    medicamentosCalculados: [medicamentoCalculadoParaImprimir],
                  ),
                ),
              );
            },
            tooltip: 'Imprimir Reporte',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Información del Medicamento',
                      style: Theme.of(context).textTheme.headlineSmall!
                          .copyWith(
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 14, 113, 194),
                            fontSize: 20,
                          ),
                    ),
                    const SizedBox(height: 16.0),
                    _buildDetailRow(
                      context,
                      'Categoría:',
                      widget.medicamento.categoria,
                      onSurfaceColor,
                    ),
                    if (widget.medicamento.subcategoria != null &&
                        widget.medicamento.subcategoria!.isNotEmpty)
                      _buildDetailRow(
                        context,
                        'Subcategoría: ',
                        widget.medicamento.subcategoria!,
                        onSurfaceColor,
                      ),
                    if (widget.medicamento.rangoDosisOriginal != null &&
                        widget.medicamento.rangoDosisOriginal!.isNotEmpty)
                      _buildDetailRow(
                        context,
                        'Rango Dosis Original:',
                        widget.medicamento.rangoDosisOriginal!,
                        onSurfaceColor,
                      ),
                    if (widget.medicamento.dosisActualMG != null &&
                        widget.medicamento.dosisActualMG!.isNotEmpty)
                      _buildDetailRow(
                        context,
                        'Dosis:',
                        widget.medicamento.dosisActualMG!,
                        onSurfaceColor,
                      ),
                    if (widget.medicamento.observaciones != null &&
                        widget.medicamento.observaciones!.isNotEmpty)
                      _buildDetailRow(
                        context,
                        'Observaciones:',
                        widget.medicamento.observaciones!,
                        onSurfaceColor,
                      ),
                    const SizedBox(height: 18.0),
                    Text(
                      'Dosis Calculada para el Paciente:',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 14, 113, 194),
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    if (dosisStringFormateada != 'N/A')
                      _buildDoseRow(
                        context,
                        'Dosis:',
                        dosisStringFormateada,
                        dosisStringFormateada,
                        onSurfaceColor,
                      )
                    else ...[
                      if (dosisMlFormateada != 'N/A')
                        _buildDoseRow(
                          context,
                          'Dosis:',
                          dosisMlFormateada,
                          dosisMlFormateada,
                          onSurfaceColor,
                        ),
                      if (dosisMgFormateada != 'N/A')
                        _buildDoseRow(
                          context,
                          'Dosis:',
                          dosisMgFormateada,
                          dosisMgFormateada,
                          onSurfaceColor,
                        ),
                      if (dosisJuliosFormateada != 'N/A')
                        _buildDoseRow(
                          context,
                          'Dosis:',
                          dosisJuliosFormateada,
                          dosisJuliosFormateada,
                          onSurfaceColor,
                        ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(
    BuildContext context,
    String label,
    String value,
    Color textColor,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w500,
                color: textColor.withOpacity(0.6),
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(color: textColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDoseRow(
    BuildContext context,
    String label,
    String displayValue,
    String copyValue,
    Color textColor,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              '$label $displayValue',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 83, 232, 103),
                fontSize: 17.0,
              ),
              softWrap: true,
              overflow: TextOverflow.visible,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.copy,
              color: Color.fromARGB(255, 14, 113, 194),
            ),
            onPressed: () => copyToClipboard(copyValue),
            tooltip: 'Copiar',
          ),
        ],
      ),
    );
  }
}
