// lib/screens/calculos_jovenes_detail_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mi_app/models/paciente.dart';
import 'package:mi_app/models/medicamento.dart';
import 'package:mi_app/utils/dosis_calculator_jovenes.dart';
import 'package:mi_app/models/medicamento_calculado.dart';
import 'package:mi_app/screens/printable_patient_data_screen.dart';

class CalculosJovenesDetailScreen extends StatefulWidget {
  final Paciente paciente;
  final Medicamento medicamento;
  final double sodioValor;
  final double hco3Valor;
  // AÑADE ESTE NUEVO PARÁMETRO
  final double liquidosIvValor;
  final String calculoType;

  const CalculosJovenesDetailScreen({
    Key? key,
    required this.paciente,
    required this.medicamento,
    required this.sodioValor,
    required this.hco3Valor,
    // AÑADE ESTE NUEVO PARÁMETRO
    required this.liquidosIvValor,
    required this.calculoType,
  }) : super(key: key);

  @override
  _CalculosJovenesDetailScreenState createState() =>
      _CalculosJovenesDetailScreenState();
}

class _CalculosJovenesDetailScreenState
    extends State<CalculosJovenesDetailScreen> {
  late Map<String, String> _calculatedDoses;

  @override
  void initState() {
    super.initState();
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
      // NUEVA LÓGICA PARA LÍQUIDOS IV
      _calculatedDoses = DosisCalculatorJovenes.calculateLiquidosIvDosis(
        widget.paciente.pesoKg,
        widget.liquidosIvValor,
      );
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

  Widget _buildDetailRow({
    required BuildContext context,
    required String label,
    required String value,
    required Color textColor,
  }) {
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

  Widget _buildDoseRow({
    required BuildContext context,
    required String label,
    required String displayValue,
    required String copyValue,
    required Color textColor,
  }) {
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
                color: textColor,
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

  List<MedicamentoCalculado> _getMedicamentosParaImprimir() {
    final List<MedicamentoCalculado> medicamentos = [];
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
      // NUEVA LÓGICA PARA IMPRIMIR LÍQUIDOS IV
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

    if (displayString != null) {
      medicamentos.add(
        MedicamentoCalculado(
          medicamentoOriginal: widget.medicamento,
          dosisDisplayString: displayString,
        ),
      );
    }

    return medicamentos;
  }

  @override
  Widget build(BuildContext context) {
    final Color onSurfaceColor = Theme.of(context).colorScheme.onSurface;

    String dosisLabel = '';
    String dosisValue = 'N/A';

    // Lógica para obtener el resultado único a mostrar
    if (widget.calculoType == 'Sodio') {
      switch (widget.medicamento.nombre) {
        case 'Déficit de Sodio':
          dosisLabel = 'Déficit:';
          dosisValue = _calculatedDoses['deficit_display']!;
          break;
        case 'Volumen de SG5%':
          dosisLabel = 'Volumen:';
          dosisValue = _calculatedDoses['volumen_display']!;
          break;
        case 'Con SF':
          dosisLabel = 'Con SF:';
          dosisValue = _calculatedDoses['con_sf_display']!;
          break;
        case 'Velocidad de Infusión':
          dosisLabel = 'Velocidad:';
          dosisValue = _calculatedDoses['velocidad_display']!;
          break;
      }
    } else if (widget.calculoType == 'HCO3') {
      switch (widget.medicamento.nombre) {
        case 'Déficit de HCO3':
          dosisLabel = 'Déficit:';
          dosisValue = _calculatedDoses['deficit_display']!;
          break;
        case 'Volumen de SG5% a diluir déficit de HCO3':
          dosisLabel = 'Volumen:';
          dosisValue = _calculatedDoses['volumen_display']!;
          break;
        case 'Velocidad de Infusión.':
          dosisLabel = 'Velocidad:';
          dosisValue = _calculatedDoses['velocidad_display']!;
          break;
      }
    } else if (widget.calculoType == 'Liquidos IV') {
      // NUEVA LÓGICA PARA MOSTRAR LÍQUIDOS IV
      switch (widget.medicamento.nombre) {
        case 'Solución mixta mantenimiento':
          dosisLabel = 'Solución:';
          dosisValue = _calculatedDoses['solucion_mixta']!;
          break;
        case 'Resultado':
          dosisLabel = 'Resultado:';
          dosisValue = _calculatedDoses['resultado']!;
          break;
        case 'Goteo':
          dosisLabel = 'Goteo (ml/h):';
          dosisValue = _calculatedDoses['goteo_ml_h']!;
          break;
        case 'Goteo.':
          dosisLabel = 'Goteo (ajustado):';
          dosisValue = _calculatedDoses['goteo_ml_h_ajustado']!;
          break;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.medicamento.nombre),
        actions: [
          IconButton(
            icon: const Icon(Icons.print),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PrintablePatientDataScreen(
                    paciente: widget.paciente,
                    medicamentosCalculados: _getMedicamentosParaImprimir(),
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
                      'Información del Cálculo',
                      style: Theme.of(context).textTheme.headlineSmall!
                          .copyWith(
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 14, 113, 194),
                            fontSize: 20,
                          ),
                    ),
                    const SizedBox(height: 16.0),
                    _buildDetailRow(
                      context: context,
                      label: 'Tipo:',
                      value: widget.calculoType,
                      textColor: onSurfaceColor,
                    ),
                    _buildDetailRow(
                      context: context,
                      label: 'Medicamento:',
                      value: widget.medicamento.nombre,
                      textColor: onSurfaceColor,
                    ),
                    _buildDetailRow(
                      context: context,
                      label: 'Observaciones:',
                      value: widget.medicamento.observaciones ?? 'N/A',
                      textColor: onSurfaceColor,
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
                    if (dosisValue != 'N/A')
                      _buildDoseRow(
                        context: context,
                        label: dosisLabel,
                        displayValue: dosisValue,
                        copyValue: dosisValue,
                        textColor: const Color.fromARGB(255, 83, 232, 103),
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
}
