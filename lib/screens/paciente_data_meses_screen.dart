import 'package:flutter/material.dart';
import 'package:mi_app/models/paciente.dart';
import 'package:mi_app/screens/medicamentos_list_meses_screen.dart';
import 'package:mi_app/screens/instrucciones_screen_with_terms.dart';
import 'package:mi_app/screens/edad_selection_screen.dart';
import '../l10n/app_localizations.dart';

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

    // ✅ refrescar chip/botón al escribir
    _pesoController.addListener(_refrescarUI);
    _edadMesesController.addListener(_refrescarUI);
  }

  @override
  void dispose() {
    _edadMesesController.removeListener(_calcularPesoEstimado);

    _pesoController.removeListener(_refrescarUI);
    _edadMesesController.removeListener(_refrescarUI);

    _edadMesesController.dispose();
    _pesoController.dispose();
    super.dispose();
  }

  void _refrescarUI() {
    if (mounted) setState(() {});
  }

  bool get _tienePesoValido {
    final p = double.tryParse(_pesoController.text.trim());
    return p != null && p > 0;
  }

  // bool get _tieneMesesValidos {
  //   final m = int.tryParse(_edadMesesController.text.trim());
  //   return m != null && m >= 1 && m <= 11;
  // }

  bool get _mostrarPesoEstimadoPrincipal {
    // Mostrar estimado SOLO cuando no hay peso real y hay estimado válido
    return !_tienePesoValido && _pesoEstimadoKg != null;
  }

  String _labelBoton(AppLocalizations t) {
    if (_tienePesoValido) return t.btnCalcWithEnteredWeight;
    if (_pesoEstimadoKg != null) return t.btnCalcWithEstimatedWeight;
    return t.btnCalcDose;
  }

  void _calcularPesoEstimado() {
    // ✅ opcional pro: si ya hay peso real, no necesitamos recalcular estimado
    if (_tienePesoValido) {
      setState(() {
        _pesoEstimadoSegunEdad = 'N/A';
        _pesoEstimadoKg = null;
      });
      return;
    }

    final int? edadMeses = int.tryParse(_edadMesesController.text.trim());
    if (edadMeses != null && edadMeses >= 1 && edadMeses <= 11) {
      double estimado;

      // ⚠️ Mantengo tu fórmula EXACTA (igual que la tenías)
      if (edadMeses <= 4) {
        estimado = (edadMeses * 2) + 8;
      } else {
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

  void _continuar(AppLocalizations t) {
    if (_formKey.currentState!.validate()) {
      final int? edadMeses = int.tryParse(_edadMesesController.text.trim());
      final double? pesoIngresado = double.tryParse(
        _pesoController.text.trim(),
      );
      final bool usoPesoEstimado =
          (pesoIngresado == null || pesoIngresado <= 0);

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
            builder: (context) => MedicamentosListMesesScreen(
              paciente: paciente,
              esPesoEstimado: usoPesoEstimado,
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(t.snackNeedWeightOrValidAgeMonths),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  Widget _pesoSourceChip(BuildContext context, AppLocalizations t) {
    final bool usaPesoReal = _tienePesoValido;
    final bool usaEstimado = !usaPesoReal && _pesoEstimadoKg != null;

    if (!usaPesoReal && !usaEstimado) return const SizedBox.shrink();

    if (usaPesoReal) {
      return Chip(
        label: Text(t.chipRealWeight),
        visualDensity: VisualDensity.compact,
        backgroundColor: const Color(0xFFE9F7EF),
        side: const BorderSide(color: Color(0xFFB7E4C7)),
        labelStyle: const TextStyle(
          color: Color(0xFF1B5E20),
          fontWeight: FontWeight.w600,
        ),
      );
    }

    return Chip(
      label: Text(t.chipEstimated),
      visualDensity: VisualDensity.compact,
      backgroundColor: const Color(0xFFFFF7E6),
      side: const BorderSide(color: Color(0xFFFFE0B2)),
      labelStyle: const TextStyle(
        color: Color(0xFF8A6D1D),
        fontWeight: FontWeight.w600,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(t.patientMonthsAppBarTitle)),
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
                          t.patientMonthsCardTitle,
                          style: Theme.of(context).textTheme.headlineMedium!
                              .copyWith(
                                color: const Color.fromARGB(255, 14, 113, 194),
                                fontSize: 20,
                              ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),

                        // ✅ Bloque "Cómo funciona"
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEAF3FF),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color.fromARGB(
                                255,
                                14,
                                113,
                                194,
                              ).withAlpha((0.25 * 255).round()),
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.info_outline,
                                color: Color.fromARGB(255, 14, 113, 194),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  '${t.howItWorksTitle}\n${t.howItWorksMonthsBody}',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 18),

                        TextFormField(
                          controller: _pesoController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: t.patientWeightLabel,
                            hintText: t.patientWeightHintMonths,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 14, 113, 194),
                                width: 2.0,
                              ),
                            ),
                            prefixIcon: const Icon(
                              Icons.scale,
                              color: Color.fromARGB(255, 14, 113, 194),
                            ),
                            floatingLabelStyle: const TextStyle(
                              color: Color.fromARGB(255, 14, 113, 194),
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),

                        TextFormField(
                          controller: _edadMesesController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: t.patientAgeMonthsLabel,
                            hintText: t.patientAgeMonthsHint,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 14, 113, 194),
                                width: 2.0,
                              ),
                            ),
                            prefixIcon: const Icon(
                              Icons.calendar_month,
                              color: Color.fromARGB(255, 14, 113, 194),
                            ),
                            floatingLabelStyle: const TextStyle(
                              color: Color.fromARGB(255, 14, 113, 194),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return t.patientMonthsValidatorEmpty;
                            }
                            final int? edad = int.tryParse(value);
                            if (edad == null || edad < 1 || edad > 11) {
                              return t.patientMonthsValidatorRange;
                            }
                            return null;
                          },
                        ),

                        // ✅ Peso estimado SOLO si no hay peso real
                        if (_mostrarPesoEstimadoPrincipal)
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: RichText(
                              text: TextSpan(
                                style: Theme.of(context).textTheme.titleMedium,
                                children: <TextSpan>[
                                  TextSpan(text: t.estimatedWeightByAge),
                                  TextSpan(
                                    text: _pesoEstimadoSegunEdad,
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
                          ),

                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: _pesoSourceChip(context, t),
                        ),

                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                ElevatedButton.icon(
                  onPressed: () => _continuar(t),
                  icon: const Icon(Icons.arrow_forward),
                  label: Text(
                    _labelBoton(t),
                    style: const TextStyle(fontSize: 18),
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
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const EdadSelectionScreen(),
              ),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const InstruccionesScreenWithTerms(),
              ),
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: t.navPatient,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.info_outline),
            label: t.navInstructions,
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.surface,
        selectedItemColor: const Color.fromARGB(255, 14, 113, 194),
        unselectedItemColor: const Color.fromARGB(255, 14, 113, 194),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }
}
