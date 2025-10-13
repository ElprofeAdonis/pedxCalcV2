import 'package:flutter/material.dart';
import 'package:mi_app/models/paciente.dart';
import 'package:mi_app/utils/dosis_calculator_meses.dart';
import 'package:mi_app/models/medicamento.dart';
import 'package:mi_app/screens/liquid_iv_detail_screen.dart';
import 'package:mi_app/screens/printable_patient_data_screen.dart';
import 'package:mi_app/models/medicamento_calculado.dart';

final List<Medicamento> hco3Medicamentos = [
  Medicamento(
    nombre: 'HCO3 del paciente',
    categoria: 'Reposición de HCO3',
    subcategoria: '(pH < 7,2; HCO3 < 8); Nunca mezclar con Calcio',
    observaciones: 'Control de Na y Gases al finalizar',
  ),
  Medicamento(
    nombre: 'Déficit de HCO3',
    categoria: 'Reposición de HCO3',
    subcategoria: '(pH < 7,2; HCO3 < 8); Nunca mezclar con Calcio',
    dosisActualMG: 'de Bicarbonato de Sodio al 1M (1mEq/mL)',
  ),
  Medicamento(
    nombre: 'Volumen de SG5%',
    categoria: 'Reposición de HCO3',
    subcategoria: '(pH < 7,2; HCO3 < 8); Nunca mezclar con Calcio',
    rangoDosisOriginal: 'a diluir déficit de HCO3',
    dosisActualMG: 'Pasar en 3h',
  ),
  Medicamento(
    nombre: 'Velocidad de Infusión a pasar en 3h',
    categoria: 'Reposición de HCO3',
    subcategoria: '(pH < 7,2; HCO3 < 8); Nunca mezclar con Calcio',
    rangoDosisOriginal: 'a diluir déficit de HCO3',
    dosisActualMG: 'Pasar en 3h',
  ),
];
final List<Medicamento> sodioMedicamentos = [
  Medicamento(
    nombre: 'Sodio del paciente',
    categoria: 'Reposición de Sodio',
    subcategoria: '(Na < 130mEq/L)',
    observaciones: 'Control de Na y Osm al finalizar',
  ),
  Medicamento(
    nombre: 'Déficit de Sodio',
    categoria: 'Reposición de Sodio',
    subcategoria: '(Na < 130mEq/L)',
    dosisActualMG: 'de NaCl4M (4mEq/mL)',
  ),
  Medicamento(
    nombre: 'Volumen de SG5%',
    categoria: 'Reposición de Sodio',
    subcategoria: '(Na < 130mEq/L)',
    dosisActualMG: 'Pasar en 3h',
  ),
  Medicamento(
    nombre: 'Velocidad de Infusión a pasar en 3h',
    categoria: 'Reposición de Sodio',
    subcategoria: '(Na < 130mEq/L)',
    dosisActualMG: 'Pasar en 3h',
  ),
  Medicamento(
    nombre: 'Con SF',
    categoria: 'Reposición de Sodio',
    subcategoria: '(Na < 130mEq/L)',
    dosisActualMG: 'Pasar en 3h',
  ),
];

class CalculosEspecialesScreen extends StatefulWidget {
  final Paciente paciente;

  const CalculosEspecialesScreen({super.key, required this.paciente});

  @override
  // ignore: library_private_types_in_public_api
  _CalculosEspecialesScreenState createState() =>
      _CalculosEspecialesScreenState();
}

class _CalculosEspecialesScreenState extends State<CalculosEspecialesScreen> {
  final TextEditingController _porcentajeController = TextEditingController();
  final TextEditingController _hco3Controller = TextEditingController();
  final TextEditingController _sodioController = TextEditingController();
  double _porcentaje = 40;
  double _hco3Valor = 7;
  double _sodioValor = 100;

  @override
  void initState() {
    super.initState();
    _porcentajeController.text = _porcentaje.toString();
    _porcentajeController.addListener(() {
      setState(() {
        _porcentaje = double.tryParse(_porcentajeController.text) ?? 0.0;
      });
    });

    _hco3Controller.addListener(() {
      setState(() {
        _hco3Valor = double.tryParse(_hco3Controller.text) ?? 0.0;
      });
    });
    _sodioController.addListener(() {
      setState(() {
        _sodioValor = double.tryParse(_sodioController.text) ?? 0.0;
      });
    });
  }

  @override
  void dispose() {
    _porcentajeController.dispose();
    _hco3Controller.dispose();
    _sodioController.dispose();
    super.dispose();
  }

  String _getHco3Display(Medicamento medicamento) {
    final hco3Doses = DosisCalculatorMeses.calculateHco3Dosis(
      widget.paciente,
      _hco3Valor,
    );

    switch (medicamento.nombre) {
      case 'Déficit de HCO3':
        return hco3Doses['deficit_display'];
      case 'Volumen de SG5%':
        return hco3Doses['volumen_display'];
      case 'Velocidad de Infusión a pasar en 3h':
        return hco3Doses['velocidad_display'];
      default:
        return 'N/A';
    }
  }

  String _getSodioDisplay(Medicamento medicamento) {
    final sodioDoses = DosisCalculatorMeses.calculateSodioDosis(
      widget.paciente,
      _sodioValor,
    );

    switch (medicamento.nombre) {
      case 'Déficit de Sodio':
        return sodioDoses['deficit_display'];
      case 'Volumen de SG5%':
        return sodioDoses['volumen_display'];
      case 'Velocidad de Infusión a pasar en 3h':
        return sodioDoses['velocidad_display'];
      case 'Con SF':
        return sodioDoses['con_sf_display'];
      default:
        return 'N/A';
    }
  }

  String _getDosisDisplay(Medicamento medicamento) {
    final Map<String, dynamic> calculatedDoses =
        DosisCalculatorMeses.calculateDosis(
          widget.paciente,
          medicamento,
          porcentaje: _porcentaje,
        );
    if (calculatedDoses.containsKey('display_string')) {
      return calculatedDoses['display_string'];
    } else {
      final double ml = calculatedDoses['ml'] ?? 0.0;
      return '${DosisCalculatorMeses.formatDosis(ml)} ml';
    }
  }

  Widget _buildMedicamentoListTile(
    Medicamento medicamento,
    String dosisDisplay, {
    required Function() onTapAction,
  }) {
    return Card(
      key: ValueKey('${medicamento.nombre}-${medicamento.categoria}'),
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 1.0),
      elevation: 0.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: ListTile(
        title: Text(
          medicamento.nombre,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        subtitle: Text(
          dosisDisplay,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: const Color.fromARGB(255, 83, 232, 103),
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16.0,
          color: Color.fromARGB(255, 14, 113, 194),
        ),
        onTap: onTapAction,
        tileColor: Colors.white,
        selectedTileColor: Theme.of(
          context,
          // ignore: deprecated_member_use
        ).colorScheme.primary.withOpacity(0.05),
        // ignore: deprecated_member_use
        splashColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
      ),
    );
  }

  List<MedicamentoCalculado> _calcularTodasLasDosis() {
    final List<MedicamentoCalculado> medicamentosCalculados = [];

    final List<Medicamento> liquidosIVMedicamentos = [
      Medicamento(
        nombre: 'Solución mixta',
        categoria: 'Líquids IV',
        rangoDosisOriginal: '(Requerimientos al 100%)',
        dosisActualMG: 'pasar en Bomba de Infusión continua en 24h IV',
        observaciones: '',
      ),
      Medicamento(
        nombre: 'Goteo',
        categoria: 'Líquids IV',
        observaciones: 'Requerimientos diarios',
        rangoDosisOriginal: '',
        dosisActualMG: '',
      ),
      Medicamento(
        nombre: 'Resultado',
        categoria: 'Líquids IV',
        dosisActualMG: 'Restar medicamentos',
        observaciones: '',
        rangoDosisOriginal: '',
      ),
      Medicamento(
        nombre: 'Goteo.',
        categoria: 'Líquids IV',
        dosisActualMG: 'Restar infusiones',
        observaciones: 'Cálculo de líquidos por porcentaje',
        rangoDosisOriginal: '',
      ),
    ];

    for (var med in liquidosIVMedicamentos) {
      _getDosisDisplay(med);
      medicamentosCalculados.add(
        MedicamentoCalculado(
          medicamentoOriginal: med,
          dosisMlDisplay: 'N/A',
          dosisMgDisplay: 'N/A',
          dosisJuliosDisplay: 'N/A',
          dosisDisplayString: 'N/A',
        ),
      );
    }

    for (var med in hco3Medicamentos.skip(1)) {
      _getHco3Display(med);
      medicamentosCalculados.add(
        MedicamentoCalculado(
          medicamentoOriginal: med,
          dosisMlDisplay: 'N/A',
          dosisMgDisplay: 'N/A',
          dosisJuliosDisplay: 'N/A',
          dosisDisplayString: 'N/A',
        ),
      );
    }

    // 3. Agregar los medicamentos de Reposición de Sodio
    for (var med in sodioMedicamentos.skip(1)) {
      _getSodioDisplay(med);
      medicamentosCalculados.add(
        MedicamentoCalculado(
          medicamentoOriginal: med,
          dosisMlDisplay: 'N/A',
          dosisMgDisplay: 'N/A',
          dosisJuliosDisplay: 'N/A',
          dosisDisplayString: 'N/A',
        ),
      );
    }
    return medicamentosCalculados;
  }

  @override
  Widget build(BuildContext context) {
    final List<Medicamento> liquidosIVMedicamentos = [
      Medicamento(
        nombre: 'Solución mixta',
        categoria: 'Líquids IV',
        rangoDosisOriginal: '(Requerimientos al 100%)',
        dosisActualMG: 'pasar en Bomba de Infusión continua en 24h IV',
        observaciones: '',
      ),
      Medicamento(
        nombre: 'Goteo',
        categoria: 'Líquids IV',
        observaciones: 'Requerimientos diarios',
        rangoDosisOriginal: '',
        dosisActualMG: '',
      ),
      Medicamento(
        nombre: 'Resultado',
        categoria: 'Líquids IV',
        dosisActualMG: 'Restar medicamentos',
        observaciones: '',
        rangoDosisOriginal: '',
      ),
      Medicamento(
        nombre: 'Goteo.',
        categoria: 'Líquids IV',
        dosisActualMG: 'Restar infusiones',
        observaciones: 'Cálculo de líquidos por porcentaje',
        rangoDosisOriginal: '',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cálculos especiales'),
        actions: [
          IconButton(
            icon: const Icon(Icons.print),
            onPressed: () {
              final List<MedicamentoCalculado> medicamentosCalculados =
                  _calcularTodasLasDosis();
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
            tooltip: 'Imprimir Reporte de Líquidos IV',
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Card(
                color: const Color.fromARGB(255, 250, 250, 250),
                margin: const EdgeInsets.symmetric(
                  horizontal: 0.0,
                  vertical: 2.0,
                ),
                elevation: 0.5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                  title: const Text('Cálculo por porcentaje de líquids IV'),
                  trailing: SizedBox(
                    width: 65,
                    height: 35,
                    child: TextField(
                      controller: _porcentajeController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color.fromRGBO(92, 158, 212, 1),
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        hintText: '40',
                        hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 14, 113, 194),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 14, 113, 194),
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 83, 232, 103),
                            width: 2.0,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5.0,
                vertical: 2.0,
              ),
              child: Card(
                color: const Color.fromARGB(255, 250, 250, 250),
                margin: const EdgeInsets.symmetric(
                  horizontal: 0.0,
                  vertical: 2.0,
                ),
                elevation: 0.5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                  title: const Text('Cálculo de reposición HCO3'),
                  trailing: SizedBox(
                    width: 65,
                    height: 35,
                    child: TextField(
                      controller: _hco3Controller,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color.fromRGBO(92, 158, 212, 1),
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        hintText: '7',
                        hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 14, 113, 194),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 14, 113, 194),
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 83, 232, 103),
                            width: 2.0,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5.0,
                vertical: 2.0,
              ),
              child: Card(
                color: const Color.fromARGB(255, 250, 250, 250),
                margin: const EdgeInsets.symmetric(
                  horizontal: 0.0,
                  vertical: 2.0,
                ),
                elevation: 0.5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                  title: const Text('Cálculo de reposición sodio'),
                  trailing: SizedBox(
                    width: 65,
                    height: 35,
                    child: TextField(
                      controller: _sodioController,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color.fromRGBO(92, 158, 212, 1),
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        hintText: '100',
                        hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 14, 113, 194),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 14, 113, 194),
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 83, 232, 103),
                            width: 2.0,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 4.0,
              ),
              child: Text(
                'Líquids IV',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 14, 113, 194),
                  fontSize: 18,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((
              BuildContext context,
              int index,
            ) {
              final medicamento = liquidosIVMedicamentos[index];
              final String dosisDisplay = _getDosisDisplay(medicamento);
              return _buildMedicamentoListTile(
                medicamento,
                dosisDisplay,
                onTapAction: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => LiquidIVDetailScreen(
                        medicamento: medicamento,
                        paciente: widget.paciente,
                        porcentajeLiquidos: _porcentaje,
                      ),
                    ),
                  );
                },
              );
            }, childCount: liquidosIVMedicamentos.length),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 4.0,
              ),
              child: Text(
                'Reposición de HCO3',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 14, 113, 194),
                  fontSize: 18,
                ),
              ),
            ),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate((
              BuildContext context,
              int index,
            ) {
              final medicamento = hco3Medicamentos[index + 1];
              DosisCalculatorMeses.calculateHco3Dosis(
                widget.paciente,
                _hco3Valor,
              );
              final String dosisDisplay = _getHco3Display(medicamento);

              return _buildMedicamentoListTile(
                medicamento,
                dosisDisplay,
                onTapAction: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => LiquidIVDetailScreen(
                        paciente: widget.paciente,
                        medicamento: medicamento,
                        porcentajeLiquidos: 0.0,
                        hco3Valor: _hco3Valor,
                      ),
                    ),
                  );
                },
              );
            }, childCount: hco3Medicamentos.length - 1),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 4.0,
              ),
              child: Text(
                'Reposición de sodio',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 14, 113, 194),
                  fontSize: 18,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((
              BuildContext context,
              int index,
            ) {
              final medicamento = sodioMedicamentos[index + 1];
              final String dosisDisplay = _getSodioDisplay(medicamento);
              return _buildMedicamentoListTile(
                medicamento,
                dosisDisplay,
                onTapAction: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => LiquidIVDetailScreen(
                        paciente: widget.paciente,
                        medicamento: medicamento,
                        porcentajeLiquidos: 0.0,
                        sodioValor: _sodioValor,
                      ),
                    ),
                  );
                },
              );
            }, childCount: sodioMedicamentos.length - 1),
          ),
        ],
      ),
    );
  }
}
