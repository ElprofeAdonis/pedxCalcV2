import 'package:flutter/material.dart';
import 'package:mi_app/models/paciente.dart';
import 'package:mi_app/screens/medicamentos_list_meses_screen.dart';
import 'package:mi_app/screens/instrucciones_screen_with_terms.dart';
import 'package:mi_app/screens/edad_selection_screen.dart';

class PacienteDataMesesScreen extends StatefulWidget {
  const PacienteDataMesesScreen({super.key});

  @override
  State<PacienteDataMesesScreen> createState() =>
      _PacienteDataMesesScreenState();
}

class _PacienteDataMesesScreenState extends State<PacienteDataMesesScreen> {
  final _formKey = GlobalKey<FormState>();
  final _edadMesesController = TextEditingController();
  final _pesoController = TextEditingController();

  String _pesoEstimadoSegunEdad = 'N/A';
  double? _pesoEstimadoKg;

  @override
  void initState() {
    super.initState();
    _edadMesesController.addListener(_calcularPesoEstimado);
  }

  @override
  void dispose() {
    _edadMesesController.removeListener(_calcularPesoEstimado);
    _edadMesesController.dispose();
    _pesoController.dispose();
    super.dispose();
  }

  void _calcularPesoEstimado() {
    final int? edadMeses = int.tryParse(_edadMesesController.text);
    if (edadMeses != null && edadMeses >= 1 && edadMeses <= 11) {
      double estimado;
      if (edadMeses <= 4) {
        estimado = (edadMeses * 2) + 8;
      } else {
        // edadMeses >= 5
        estimado = (edadMeses * 3) + 3;
      }
      setState(() {
        _pesoEstimadoSegunEdad = '${estimado.toStringAsFixed(1)} kg';
        _pesoEstimadoKg = estimado;
      });
    } else {
      setState(() {
        _pesoEstimadoSegunEdad = 'N/A';
        _pesoEstimadoKg = null;
      });
    }
  }

  void _continuar() {
    if (_formKey.currentState!.validate()) {
      final int? edadMeses = int.tryParse(_edadMesesController.text);
      final double? pesoIngresado = double.tryParse(_pesoController.text);

      double? pesoFinalParaCalculo;

      if (pesoIngresado != null && pesoIngresado > 0) {
        pesoFinalParaCalculo = pesoIngresado;
      } else if (_pesoEstimadoKg != null && _pesoEstimadoKg! > 0) {
        pesoFinalParaCalculo = _pesoEstimadoKg;
      }

      if (pesoFinalParaCalculo != null && edadMeses != null) {
        final paciente = Paciente(
          edadMeses: edadMeses,
          pesoKg: pesoFinalParaCalculo,
          edadAnios: 0,
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                MedicamentosListMesesScreen(paciente: paciente),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Por favor, ingresa una edad válida para estimar el peso o un peso directamente.',
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edad en meses del paciente')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Ingrese los datos (1-11 meses)',
                          style: Theme.of(context).textTheme.headlineMedium!
                              .copyWith(
                                color: const Color.fromARGB(255, 14, 113, 194),
                                fontSize: 18,
                              ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 30),
                        TextFormField(
                          controller: _pesoController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Peso actual (kg)',
                            hintText: 'Ej: 7.5',
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
                            prefixIcon: const Icon(Icons.fitness_center),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return null;
                            }
                            final double? peso = double.tryParse(value);
                            if (peso == null || peso <= 0) {
                              return 'Ingresa un peso válido.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 30),
                        TextFormField(
                          controller: _edadMesesController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Edad (Meses - de 1 a 11 meses)',
                            hintText: 'Ej: 6',
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
                            prefixIcon: const Icon(Icons.calendar_month),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, ingresa la edad en meses.';
                            }
                            final int? edad = int.tryParse(value);
                            if (edad == null || edad < 1 || edad > 11) {
                              return 'La edad debe ser entre 1 y 11 meses.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.titleMedium,
                            children: <TextSpan>[
                              const TextSpan(
                                text: 'Peso estimado según edad: ',
                              ),
                              TextSpan(
                                text: _pesoEstimadoSegunEdad,
                                style: Theme.of(context).textTheme.titleMedium!
                                    .copyWith(
                                      color: const Color.fromARGB(
                                        255,
                                        83,
                                        232,
                                        103,
                                      ),
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: _continuar,
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text(
                    'Calcular dosis',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 83, 232, 103),
                    foregroundColor: Color.fromARGB(255, 14, 113, 194),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Color.fromARGB(255, 14, 113, 194),
        unselectedItemColor: Color.fromARGB(255, 14, 113, 194),
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const EdadSelectionScreen(),
              ),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const InstruccionesScreenWithTerms(),
              ),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Paciente'),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Instrucciones',
          ),
        ],
      ),
    );
  }
}
