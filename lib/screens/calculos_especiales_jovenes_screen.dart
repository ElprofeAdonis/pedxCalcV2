// lib/screens/calculos_especiales_jovenes_screen.dart

import 'package:flutter/material.dart';
import 'package:mi_app/models/paciente.dart';
import 'package:mi_app/utils/dosis_calculator_jovenes.dart';
import 'package:mi_app/models/medicamento.dart';
import 'package:mi_app/screens/printable_patient_data_screen.dart';
import 'package:mi_app/models/medicamento_calculado.dart';
import 'package:mi_app/screens/calculos_jovenes_detail_screen.dart';

final List<Medicamento> sodioMedicamentos = [
  Medicamento(
    nombre: 'Sodio del paciente',
    categoria: 'REPOSICION DE SODIO (Na <130mEq/L)',
    observaciones: 'Control de Na y Osm al finalizar',
  ),
  Medicamento(
    nombre: 'Déficit de Sodio',
    categoria: 'REPOSICION DE SODIO (Na <130mEq/L)',
    observaciones: 'de NaCl4M (4mEq/mL)',
  ),
  Medicamento(
    nombre: 'Volumen de SG5%',
    categoria: 'REPOSICION DE SODIO (Na <130mEq/L)',
    observaciones: 'Pasar en 3h',
  ),
  Medicamento(
    nombre: 'Con SF',
    categoria: 'REPOSICION DE SODIO (Na <130mEq/L)',
    observaciones: 'Pasar en 3h',
  ),
  Medicamento(
    nombre: 'Velocidad de Infusión',
    categoria: 'REPOSICION DE SODIO (Na <130mEq/L)',
    observaciones: 'Pasar en 3h (ml/h)',
  ),
];

final List<Medicamento> hco3Medicamentos = [
  Medicamento(
    nombre: 'HCO3 del paciente',
    categoria: 'Reposición de HCO3',
    subcategoria: '(pH < 7,2; HCO3 < 8); Nunca mezclar con Calcio',
  ),
  Medicamento(
    nombre: 'Déficit de HCO3',
    categoria: 'Reposición de HCO3',
    subcategoria: '(pH < 7,2; HCO3 < 8); Nunca mezclar con Calcio',
    dosisActualMG: 'de Bicarbonato de Sodio al 1M (1mEq/mL)',
  ),
  Medicamento(
    nombre: 'Volumen de SG5% a diluir déficit de HCO3',
    categoria: 'Reposición de HCO3',
    subcategoria: '(pH < 7,2; HCO3 < 8); Nunca mezclar con Calcio',
    rangoDosisOriginal: 'a diluir déficit de HCO3',
    dosisActualMG: 'Pasar en 3h',
  ),
  Medicamento(
    nombre: 'Velocidad de Infusión.',
    categoria: 'Reposición de HCO3',
    subcategoria: '(pH < 7,2; HCO3 < 8); Nunca mezclar con Calcio',
    rangoDosisOriginal: 'a diluir déficit de HCO3',
    dosisActualMG: 'Pasar en 3h',
  ),
];

// Nueva lista de medicamentos para Líquidos IV
final List<Medicamento> liquidosIVMedicamentos = [
  Medicamento(
    nombre: 'Solución mixta mantenimiento',
    categoria: 'LÍQUIDOS IV',
    observaciones: '< 10 kg (100cc/kg), 10-20 kg (50cc/kg), > 20 kg (20cc/kg)',
  ),
  Medicamento(
    nombre: 'Calculo de Porcentaje',
    categoria: 'LÍQUIDOS IV',
    SituacionesEspeciales:
        'Riesgo SIADH: 80%, CAF/VMA:60-70%, LRA + NVO: 45%, LRA + VO: 30%',
  ),
  Medicamento(nombre: 'Resultado', categoria: 'LÍQUIDOS IV'),
  Medicamento(nombre: 'Goteo', categoria: 'LÍQUIDOS IV'),
  Medicamento(nombre: 'Goteo.', categoria: 'LÍQUIDOS IV'),
];

class CalculosEspecialesJovenesScreen extends StatefulWidget {
  final Paciente paciente;

  const CalculosEspecialesJovenesScreen({Key? key, required this.paciente})
    : super(key: key);

  @override
  _CalculosEspecialesJovenesScreenState createState() =>
      _CalculosEspecialesJovenesScreenState();
}

class _CalculosEspecialesJovenesScreenState
    extends State<CalculosEspecialesJovenesScreen> {
  final TextEditingController _sodioController = TextEditingController();
  final TextEditingController _hco3Controller = TextEditingController();
  final TextEditingController _liquidosIvController = TextEditingController();

  double _sodioValor = 120.0;
  double _hco3Valor = 7.0;
  double _liquidosIvValor = 100.0;

  @override
  void initState() {
    super.initState();
    _sodioController.text = _sodioValor.toString();
    _sodioController.addListener(() {
      setState(() {
        _sodioValor = double.tryParse(_sodioController.text) ?? 0.0;
      });
    });

    _hco3Controller.text = _hco3Valor.toString();
    _hco3Controller.addListener(() {
      setState(() {
        _hco3Valor = double.tryParse(_hco3Controller.text) ?? 0.0;
      });
    });

    _liquidosIvController.text = _liquidosIvValor.toString();
    _liquidosIvController.addListener(() {
      setState(() {
        _liquidosIvValor = double.tryParse(_liquidosIvController.text) ?? 0.0;
      });
    });
  }

  @override
  void dispose() {
    _sodioController.dispose();
    _hco3Controller.dispose();
    _liquidosIvController.dispose();
    super.dispose();
  }

  // --- Lógica de cálculo para Líquidos IV ---
  String _getLiquidosIvDisplay(Medicamento medicamento) {
    final liquidosIvDoses = DosisCalculatorJovenes.calculateLiquidosIvDosis(
      widget.paciente.pesoKg,
      _liquidosIvValor,
    );
    switch (medicamento.nombre) {
      case 'Solución mixta mantenimiento':
        return liquidosIvDoses['solucion_mixta']!;
      case 'Resultado':
        return liquidosIvDoses['resultado']!;
      case 'Goteo':
        return liquidosIvDoses['goteo_ml_h']!;
      case 'Goteo.':
        return liquidosIvDoses['goteo_ml_h_ajustado']!;
      default:
        return 'N/A';
    }
  }

  // --- Lógica de cálculo para Sodio ---
  String _getSodioDisplay(Medicamento medicamento) {
    final sodioDoses = DosisCalculatorJovenes.calculateSodioDosis(
      widget.paciente.pesoKg,
      _sodioValor,
    );
    switch (medicamento.nombre) {
      case 'Déficit de Sodio':
        return sodioDoses['deficit_display']!;
      case 'Volumen de SG5%':
        return sodioDoses['volumen_display']!;
      case 'Con SF':
        return sodioDoses['con_sf_display']!;
      case 'Velocidad de Infusión':
        return sodioDoses['velocidad_display']!;
      default:
        return 'N/A';
    }
  }

  // --- Lógica de cálculo para HCO3 ---
  String _getHco3Display(Medicamento medicamento) {
    final hco3Doses = DosisCalculatorJovenes.calculateHco3Dosis(
      widget.paciente.pesoKg,
      _hco3Valor,
    );
    switch (medicamento.nombre) {
      case 'Déficit de HCO3':
        return hco3Doses['deficit_display']!;
      case 'Volumen de SG5% a diluir déficit de HCO3':
        return hco3Doses['volumen_display']!;
      case 'Velocidad de Infusión.':
        return hco3Doses['velocidad_display']!;
      default:
        return 'N/A';
    }
  }

  List<MedicamentoCalculado> _calcularTodasLasDosis() {
    final List<MedicamentoCalculado> medicamentosCalculados = [];

    // Agregar medicamentos de Líquidos IV
    for (var med in liquidosIVMedicamentos) {
      if (med.nombre != 'Calculo de Porcentaje') {
        medicamentosCalculados.add(
          MedicamentoCalculado(
            medicamentoOriginal: med,
            dosisDisplayString: _getLiquidosIvDisplay(med),
          ),
        );
      }
    }
    // Agregar medicamentos de HCO3
    for (var med in hco3Medicamentos.skip(1)) {
      medicamentosCalculados.add(
        MedicamentoCalculado(
          medicamentoOriginal: med,
          dosisDisplayString: _getHco3Display(med),
        ),
      );
    }
    // Agregar medicamentos de Sodio
    for (var med in sodioMedicamentos.skip(1)) {
      medicamentosCalculados.add(
        MedicamentoCalculado(
          medicamentoOriginal: med,
          dosisDisplayString: _getSodioDisplay(med),
        ),
      );
    }
    return medicamentosCalculados;
  }

  Widget _buildMedicamentoListTile(
    Medicamento medicamento,
    String dosisDisplay, {
    required VoidCallback onTapAction,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      elevation: 0.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: ListTile(
        title: Text(
          medicamento.nombre,
          style: const TextStyle(
            color: Color.fromARGB(255, 14, 113, 194),
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          dosisDisplay,
          style: const TextStyle(
            color: Color.fromARGB(255, 83, 232, 103),
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cálculos especiales jóvenes'),
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
            tooltip: 'Imprimir reporte completo',
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          // --- Sección para Líquidos IV ---
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5.0,
                vertical: 2.0,
              ),
              child: Card(
                color: const Color.fromARGB(255, 250, 250, 250),
                elevation: 0.5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                  title: const Text('Calculo por porcentaje'),
                  trailing: SizedBox(
                    width: 60,
                    height: 25,
                    child: TextField(
                      controller: _liquidosIvController,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: Color.fromRGBO(92, 158, 212, 1),
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        hintText: '100.0',
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
                horizontal: 5.0,
                vertical: 2.0,
              ),
              child: Card(
                color: const Color.fromARGB(255, 250, 250, 250),
                elevation: 0.5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                  title: const Text('Cálculo de sodio del paciente'),
                  trailing: SizedBox(
                    width: 60,
                    height: 25,
                    child: TextField(
                      controller: _sodioController,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: Color.fromRGBO(92, 158, 212, 1),
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        hintText: '120.0',
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
                horizontal: 5.0,
                vertical: 2.0,
              ),
              child: Card(
                color: const Color.fromARGB(255, 250, 250, 250),
                elevation: 0.5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                  title: const Text('Cálculo de reposición HCO3'),
                  trailing: SizedBox(
                    width: 60,
                    height: 25,
                    child: TextField(
                      controller: _hco3Controller,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: Color.fromRGBO(92, 158, 212, 1),
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        hintText: '7.0',
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
                horizontal: 16.0,
                vertical: 4.0,
              ),
              child: Text(
                'Líquidos endovenosos',
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
              if (medicamento.nombre == 'Calculo de Porcentaje') {
                return const SizedBox.shrink(); // Ocultar el ListTile para el campo de entrada
              }
              final String dosisDisplay = _getLiquidosIvDisplay(medicamento);
              return _buildMedicamentoListTile(
                medicamento,
                dosisDisplay,
                onTapAction: () {
                  // Lógica de navegación para los detalles de Líquidos IV
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CalculosJovenesDetailScreen(
                        paciente: widget.paciente,
                        medicamento: medicamento,
                        sodioValor: _sodioValor,
                        hco3Valor: _hco3Valor,
                        liquidosIvValor: _liquidosIvValor,
                        calculoType: 'Liquidos IV',
                      ),
                    ),
                  );
                },
              );
            }, childCount: liquidosIVMedicamentos.length),
          ),

          // --- Sección para Sodio ---
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
                      builder: (context) => CalculosJovenesDetailScreen(
                        paciente: widget.paciente,
                        medicamento: medicamento,
                        sodioValor: _sodioValor,
                        hco3Valor: _hco3Valor,
                        liquidosIvValor: _liquidosIvValor,
                        calculoType: 'Sodio',
                      ),
                    ),
                  );
                },
              );
            }, childCount: sodioMedicamentos.length - 1),
          ),

          // --- Sección para HCO3 ---
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 4.0,
              ),
              child: Text(
                'Reposición HCO3',
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
              final String dosisDisplay = _getHco3Display(medicamento);
              return _buildMedicamentoListTile(
                medicamento,
                dosisDisplay,
                onTapAction: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CalculosJovenesDetailScreen(
                        paciente: widget.paciente,
                        medicamento: medicamento,
                        sodioValor: _sodioValor,
                        hco3Valor: _hco3Valor,
                        liquidosIvValor: _liquidosIvValor,
                        calculoType: 'HCO3',
                      ),
                    ),
                  );
                },
              );
            }, childCount: hco3Medicamentos.length - 1),
          ),
        ],
      ),
    );
  }
}
