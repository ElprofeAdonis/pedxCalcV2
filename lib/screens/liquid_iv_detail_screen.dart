import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mi_app/models/paciente.dart';
import 'package:mi_app/models/medicamento.dart';
import 'package:mi_app/utils/dosis_calculator_meses.dart';
import 'package:mi_app/screens/printable_patient_data_screen.dart';
import 'package:mi_app/models/medicamento_calculado.dart';

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
    this.hco3Valor, // Ahora acepta un valor de HCO3
    this.sodioValor,
  });

  @override
  // ignore: library_private_types_in_public_api
  _LiquidIVDetailScreenState createState() => _LiquidIVDetailScreenState();
}

class _LiquidIVDetailScreenState extends State<LiquidIVDetailScreen> {
  late String dosisDisplay;
  late String dosisMgFormateada;
  late String dosisJuliosFormateada;

  Map<String, dynamic>? _hco3Doses;
  Map<String, dynamic>? _sodioDoses;

  @override
  void initState() {
    super.initState();
    if (widget.medicamento.categoria == 'Reposición de HCO3') {
      _calculateHco3Doses();
    } else if (widget.medicamento.categoria == 'Reposición de Sodio') {
      _calculateSodioDoses();
    } else {
      _calculateAndFormatDoses();
    }
  }

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
    final Map<String, dynamic> calculatedDoses =
        DosisCalculatorMeses.calculateDosis(
          widget.paciente,
          widget.medicamento,
          porcentaje: widget.porcentajeLiquidos,
        );

    if (calculatedDoses.containsKey('display_string')) {
      dosisDisplay = calculatedDoses['display_string'] as String;
      dosisMgFormateada = 'N/A';
      dosisJuliosFormateada = 'N/A';
    } else {
      final double dosisMl = (calculatedDoses['ml'] as double?) ?? 0.0;
      final double dosisMg = (calculatedDoses['mg'] as double?) ?? 0.0;
      final double dosisJulios = (calculatedDoses['julios'] as double?) ?? 0.0;

      dosisDisplay = dosisMl > 0.005
          ? '${DosisCalculatorMeses.formatDosis(dosisMl)} ml'
          : 'N/A';
      dosisMgFormateada = dosisMg > 0.005
          ? '${DosisCalculatorMeses.formatDosis(dosisMg)} mg'
          : 'N/A';
      dosisJuliosFormateada = dosisJulios > 0.005
          ? '${DosisCalculatorMeses.formatDosis(dosisJulios)} J'
          : 'N/A';
    }
  }

  void copyToClipboard(String text) {
    if (text == 'N/A') return;
    Clipboard.setData(ClipboardData(text: text)).then((_) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('"$text" copiado al portapapeles'),
          // ignore: use_build_context_synchronously
          backgroundColor: Theme.of(context).colorScheme.secondary,
          duration: const Duration(seconds: 2),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color onSurfaceColor = Theme.of(context).colorScheme.onSurface;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.medicamento.nombre),
        actions: [
          IconButton(
            icon: const Icon(Icons.print),
            onPressed: () {
              final List<MedicamentoCalculado> medicamentosCalculados =
                  _getMedicamentosParaImprimir();

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PrintablePatientDataScreen(
                    paciente: widget.paciente,
                    medicamentosCalculados: medicamentosCalculados,
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
                        'Dosis:',
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
                    if (widget.medicamento.categoria == 'Reposición de HCO3')
                      _buildHco3Doses()
                    else if (widget.medicamento.categoria ==
                        'Reposición de Sodio')
                      _buildSodioDoses()
                    else
                      Column(
                        children: [
                          if (dosisDisplay != 'N/A')
                            _buildDoseRow(
                              context,
                              'Dosis:',
                              dosisDisplay,
                              dosisDisplay,
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSodioDoses() {
    if (_sodioDoses == null) {
      return const Text(
        'Calculando...',
        style: TextStyle(fontStyle: FontStyle.italic),
      );
    }

    String? displayValue;
    String? label;

    if (widget.medicamento.nombre == 'Déficit de Sodio') {
      label = 'Déficit:';
      displayValue = _sodioDoses!['deficit_display'];
    } else if (widget.medicamento.nombre == 'Volumen de SG5%') {
      label = 'Volumen:';
      displayValue = _sodioDoses!['volumen_display'];
    } else if (widget.medicamento.nombre ==
        'Velocidad de Infusión a pasar en 3h') {
      label = 'Velocidad:';
      displayValue = _sodioDoses!['velocidad_display'];
    } else if (widget.medicamento.nombre == 'Con SF') {
      label = 'Con SF:';
      displayValue = _sodioDoses!['con_sf_display'];
    }

    if (displayValue != null) {
      return _buildDoseRow(
        context,
        label!,
        displayValue,
        displayValue,
        const Color.fromARGB(255, 83, 232, 103),
      );
    }

    return const Text(
      'Información no disponible.',
      style: TextStyle(color: Colors.red),
    );
  }

  Widget _buildHco3Doses() {
    if (_hco3Doses == null) {
      return const Text(
        'Calculando...',
        style: TextStyle(fontStyle: FontStyle.italic),
      );
    }
    String? displayValue;
    String? label;

    if (widget.medicamento.nombre == 'Déficit de HCO3') {
      label = '';
      displayValue = _hco3Doses!['deficit_display'];
    } else if (widget.medicamento.nombre == 'Volumen de SG5%') {
      label = '';
      displayValue = _hco3Doses!['volumen_display'];
    } else if (widget.medicamento.nombre ==
        'Velocidad de Infusión a pasar en 3h') {
      label = '';
      displayValue = _hco3Doses!['velocidad_display'];
    }

    if (displayValue != null) {
      return _buildDoseRow(
        context,
        label!,
        displayValue,
        displayValue,
        const Color.fromARGB(255, 83, 232, 103),
      );
    }

    return const Text('Información no disponible.');
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
    if (widget.medicamento.categoria == 'Reposición de HCO3') {
      return [
        MedicamentoCalculado(
          medicamentoOriginal: widget.medicamento,
          dosisMlDisplay: _hco3Doses!['deficit_display'],
          dosisMgDisplay: _hco3Doses!['volumen_display'],
          dosisJuliosDisplay: _hco3Doses!['velocidad_display'],
        ),
      ];
    } else {
      return [
        MedicamentoCalculado(
          medicamentoOriginal: widget.medicamento,
          dosisMlDisplay: dosisDisplay,
          dosisMgDisplay: dosisMgFormateada,
          dosisJuliosDisplay: dosisJuliosFormateada,
        ),
      ];
    }
  }
}
