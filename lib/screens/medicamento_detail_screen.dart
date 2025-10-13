// lib/screens/medicamento_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Importación para Clipboard
import 'package:mi_app/models/medicamento.dart';
import 'package:mi_app/models/paciente.dart';
import 'package:mi_app/utils/dosis_calculator.dart'; // Tu clase DosisCalculator
import 'package:mi_app/screens/printable_patient_data_screen.dart';
import 'package:mi_app/models/medicamento_calculado.dart';

class MedicamentoDetailScreen extends StatefulWidget {
  final Medicamento medicamento;
  final Paciente paciente;

  const MedicamentoDetailScreen({
    super.key,
    required this.medicamento,
    required this.paciente,
  });

  @override
  // ignore: library_private_types_in_public_api
  _MedicamentoDetailScreenState createState() =>
      _MedicamentoDetailScreenState();
}

class _MedicamentoDetailScreenState extends State<MedicamentoDetailScreen> {
  late String dosisMlFormateada;
  late String dosisMgFormateada;
  late String dosisJuliosFormateada;

  @override
  void initState() {
    super.initState();
    _calculateAndFormatDoses();
  }

  void _calculateAndFormatDoses() {
    // Llama al método estático calculateDosis de DosisCalculator
    final Map<String, dynamic> calculatedDoses = DosisCalculator.calculateDosis(
      widget.paciente,
      widget.medicamento,
    );
    if (calculatedDoses.containsKey('display_string')) {
      dosisMlFormateada = calculatedDoses['display_string'] as String;
      dosisMgFormateada = 'N/A';
      dosisJuliosFormateada = 'N/A';
    } else {
      // Lógica anterior para cuando el cálculo es numérico
      final double dosisMl = calculatedDoses['ml'] as double;
      final double dosisMg = calculatedDoses['mg'] as double;
      final double dosisJulios = calculatedDoses['julios'] as double;

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

  // Función para copiar al portapapeles
  void copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text)).then((_) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('"$text" copiado al portapapeles'),
          backgroundColor: Theme.of(
            // ignore: use_build_context_synchronously
            context,
          ).colorScheme.secondary,
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
          dosisMlDisplay: dosisMlFormateada,
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
                        'Subcategoría:',
                        widget.medicamento.subcategoria!,
                        onSurfaceColor,
                      ),
                    if (widget.medicamento.rangoDosisOriginal.isNotEmpty)
                      _buildDetailRow(
                        context,
                        'Rango Dosis Original:',
                        widget.medicamento.rangoDosisOriginal,
                        onSurfaceColor,
                      ),
                    if (widget.medicamento.dosisActualMG.isNotEmpty)
                      _buildDetailRow(
                        context,
                        'Dosis Pediátrica:',
                        widget.medicamento.dosisActualMG,
                        onSurfaceColor,
                      ),
                    if (widget.medicamento.observaciones.isNotEmpty)
                      _buildDetailRow(
                        context,
                        'Observaciones:',
                        widget.medicamento.observaciones,
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
                // ignore: deprecated_member_use
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
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.copy,
              color: const Color.fromARGB(255, 14, 113, 194),
            ),
            onPressed: () => copyToClipboard(copyValue),
            tooltip: 'Copiar',
          ),
        ],
      ),
    );
  }
}
