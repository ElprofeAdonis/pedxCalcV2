import 'package:flutter/material.dart';
import 'package:mi_app/models/paciente.dart';
import 'package:mi_app/screens/select_medicamento_screen.dart';
import 'package:mi_app/screens/instrucciones_screen_with_terms.dart';
import 'package:mi_app/screens/edad_selection_screen.dart';

class PacienteDataScreen extends StatefulWidget {
  final bool isEdadAniosMode;

  const PacienteDataScreen({super.key, this.isEdadAniosMode = false});

  @override
  State<PacienteDataScreen> createState() => _PacienteDataScreenState();
}

class _PacienteDataScreenState extends State<PacienteDataScreen> {
  final _pesoController = TextEditingController();
  final _edadAniosController = TextEditingController();
  final _edadMesesController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  double? _pesoEstimadoValue;
  String _pesoEstimadoText = 'N/A';

  @override
  void initState() {
    super.initState();
    if (widget.isEdadAniosMode) {
      _edadMesesController.clear();
    }

    _edadAniosController.addListener(_calcularPesoEstimado);
  }

  @override
  void dispose() {
    _pesoController.dispose();
    _edadAniosController.removeListener(_calcularPesoEstimado);
    _edadAniosController.dispose();
    _edadMesesController.dispose();
    super.dispose();
  }

  void _calcularPesoEstimado() {
    final int? edadAnios = int.tryParse(_edadAniosController.text);
    if (edadAnios != null && edadAnios >= 1 && edadAnios <= 14) {
      double estimado;
      if (edadAnios >= 1 && edadAnios <= 4) {
        estimado = (edadAnios * 2) + 8.0;
      } else {
        estimado = (edadAnios * 3) + 3.0;
      }
      setState(() {
        _pesoEstimadoValue = estimado;
        _pesoEstimadoText = estimado.toStringAsFixed(1) + ' Kg';
      });
    } else {
      setState(() {
        _pesoEstimadoValue = null;
        _pesoEstimadoText = 'N/A';
      });
    }
  }

  void _calcularDosis() {
    if (_formKey.currentState!.validate()) {
      final double? pesoIngresado = double.tryParse(_pesoController.text);
      final int? edadAnios = int.tryParse(_edadAniosController.text);
      final int? edadMeses = int.tryParse(_edadMesesController.text);

      double? pesoFinalParaCalculo;

      if (pesoIngresado != null) {
        pesoFinalParaCalculo = pesoIngresado;
      } else if (widget.isEdadAniosMode && _pesoEstimadoValue != null) {
        pesoFinalParaCalculo = _pesoEstimadoValue;
      }

      if (pesoFinalParaCalculo != null &&
          (edadAnios != null || edadMeses != null)) {
        final paciente = Paciente(
          pesoKg: pesoFinalParaCalculo,
          edadAnios: edadAnios ?? 0,
          edadMeses: edadMeses ?? 0,
        );

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SelectMedicamentoScreen(paciente: paciente),
          ),
        );
      } else {
        String errorMessage =
            'Por favor, ingresa el peso del paciente O la edad en años (para cálculo estimado).';
        if (!widget.isEdadAniosMode) {
          errorMessage =
              'Por favor, ingresa un peso y al menos la edad en años o meses.';
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Datos del Paciente')),
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
                          'Ingrese los datos del paciente',
                          style: Theme.of(context).textTheme.headlineMedium!
                              .copyWith(
                                color: const Color.fromARGB(255, 14, 113, 194),
                                fontSize: 20,
                              ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 30),
                        TextFormField(
                          controller: _pesoController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Peso actual (Kg)',
                            hintText: 'Ej: 22.6',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: const Color.fromARGB(
                                  255,
                                  14,
                                  113,
                                  194,
                                ), // azul acento
                                width: 2.0,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.scale,
                              color: const Color.fromARGB(255, 14, 113, 194),
                            ),
                            floatingLabelStyle: TextStyle(
                              color: const Color.fromARGB(255, 14, 113, 194),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              if (widget.isEdadAniosMode &&
                                  _pesoEstimadoValue != null &&
                                  _pesoEstimadoValue! > 0) {
                                return null;
                              }
                              return 'Ingrese el peso o una edad válida en años para estimarlo.';
                            }
                            if (double.tryParse(value) == null) {
                              return 'Entrada inválida. Ingrese un número.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _edadAniosController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Edad (Años - 1 a 14 años)',
                            hintText: 'Ej: 4',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: const Color.fromARGB(255, 14, 113, 194),
                                width: 2.0,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.cake,
                              color: const Color.fromARGB(255, 14, 113, 194),
                            ),
                            floatingLabelStyle: TextStyle(
                              color: const Color.fromARGB(255, 14, 113, 194),
                            ),
                          ),

                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              if ((!widget.isEdadAniosMode &&
                                      _edadMesesController.text.isEmpty) ||
                                  (widget.isEdadAniosMode &&
                                      _pesoController.text.isEmpty)) {
                                return 'Ingrese edad en años o meses (o peso si aplica).';
                              }
                              return null;
                            }
                            if (int.tryParse(value) == null) {
                              return 'Entrada inválida. Ingrese un número entero.';
                            }
                            final int? edad = int.tryParse(value);
                            if (edad != null && (edad < 1 || edad > 14)) {
                              return 'La edad debe ser entre 1 y 14 años.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),

                        if (!widget.isEdadAniosMode)
                          TextFormField(
                            controller: _edadMesesController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Edad (Meses - si < 1 año)',
                              hintText: 'Ej: 6',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 14, 113, 194),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.secondary,
                                  width: 2.0,
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.calendar_month,
                                color: Theme.of(
                                  context,
                                  // ignore: deprecated_member_use
                                ).colorScheme.onSurface.withOpacity(0.7),
                              ),
                              floatingLabelStyle: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            validator: (value) {
                              if (!widget.isEdadAniosMode &&
                                  _edadAniosController.text.isEmpty) {
                                if (value == null || value.isEmpty) {
                                  return 'Ingrese edad en años o meses.';
                                }
                                if (int.tryParse(value) == null) {
                                  return 'Entrada inválida. Ingrese un número.';
                                }
                                final int? edad = int.tryParse(value);
                                if (edad != null && (edad < 1 || edad > 11)) {
                                  return 'La edad en meses debe ser entre 1 y 11.';
                                }
                              }
                              return null;
                            },
                          ),

                        if (widget.isEdadAniosMode)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              RichText(
                                text: TextSpan(
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleMedium,
                                  children: <TextSpan>[
                                    const TextSpan(
                                      text: 'Peso estimado según edad: ',
                                    ),
                                    TextSpan(
                                      text: _pesoEstimadoText,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
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
                            ],
                          ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: _calcularDosis,
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text(
                    'Calcular Dosis',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 83, 232, 103),
                    foregroundColor: const Color.fromARGB(255, 14, 113, 194),
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
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
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
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Edad - Paciente',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Instrucciones',
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.surface,
        selectedItemColor: const Color.fromARGB(255, 14, 113, 194),
        unselectedItemColor: const Color.fromARGB(255, 14, 113, 194),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
