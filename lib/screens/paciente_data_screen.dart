import 'package:flutter/material.dart';
import 'package:mi_app/models/paciente.dart';
import 'package:mi_app/screens/select_medicamento_screen.dart';
import 'package:mi_app/screens/instrucciones_screen_with_terms.dart';
import 'package:mi_app/screens/edad_selection_screen.dart';
import '../l10n/app_localizations.dart';

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

    // refrescar UI
    _pesoController.addListener(_refrescarUI);
    _edadMesesController.addListener(_refrescarUI);
  }

  @override
  void dispose() {
    _pesoController.removeListener(_refrescarUI);
    _pesoController.dispose();
    _edadAniosController.removeListener(_calcularPesoEstimado);
    _edadAniosController.dispose();
    _edadMesesController.removeListener(_refrescarUI);
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
        _pesoEstimadoText = '${estimado.toStringAsFixed(1)} Kg';
      });
    } else {
      setState(() {
        _pesoEstimadoValue = null;
        _pesoEstimadoText = 'N/A';
      });
    }
  }

  void _refrescarUI() {
    if (mounted) setState(() {});
  }

  bool get _tienePesoValido {
    final p = double.tryParse(_pesoController.text.trim());
    return p != null && p > 0;
  }

  // bool get _tieneEdadAniosValida {
  //   final e = int.tryParse(_edadAniosController.text.trim());
  //   return e != null && e >= 1 && e <= 14;
  // }

  bool get _mostrarPesoEstimadoPrincipal {
    return widget.isEdadAniosMode &&
        !_tienePesoValido &&
        _pesoEstimadoValue != null;
  }

  String _labelBoton(AppLocalizations t) {
    if (_tienePesoValido) return t.patientBtnWithEnteredWeight;
    if (widget.isEdadAniosMode && _pesoEstimadoValue != null) {
      return t.patientBtnWithEstimatedWeight;
    }
    return t.patientBtnCalculateDose;
  }

  void _calcularDosis(AppLocalizations t) {
    if (_formKey.currentState!.validate()) {
      final double? pesoIngresado = double.tryParse(_pesoController.text);
      final int? edadAnios = int.tryParse(_edadAniosController.text);
      final int? edadMeses = int.tryParse(_edadMesesController.text);
      final bool usoPesoEstimado =
          (pesoIngresado == null || pesoIngresado <= 0);

      double? pesoFinalParaCalculo;

      if (pesoIngresado != null && pesoIngresado > 0) {
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
            builder: (context) => SelectMedicamentoScreen(
              paciente: paciente,
              esPesoEstimado: usoPesoEstimado,
            ),
          ),
        );
      } else {
        String errorMessage = t.patientSnackNeedWeightOrAge;
        if (!widget.isEdadAniosMode) {
          errorMessage = t.patientSnackNeedWeightAndAge;
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
    final t = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(t.patientAppBarTitleYears)),
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
                          t.patientHeaderTitle,
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
                                  '${t.patientHowItWorks}\n${t.patientHowItWorksBody}',
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
                            hintText: t.patientWeightHint,
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              if (widget.isEdadAniosMode &&
                                  _pesoEstimadoValue != null &&
                                  _pesoEstimadoValue! > 0) {
                                return null;
                              }
                              return t.patientValWeightOrValidAgeToEstimate;
                            }
                            if (double.tryParse(value) == null) {
                              return t.patientValInvalidNumber;
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 10),

                        TextFormField(
                          controller: _edadAniosController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: t.patientAgeYearsLabel,
                            hintText: t.patientAgeYearsHint,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 14, 113, 194),
                                width: 2.0,
                              ),
                            ),
                            prefixIcon: const Icon(
                              Icons.cake,
                              color: Color.fromARGB(255, 14, 113, 194),
                            ),
                            floatingLabelStyle: const TextStyle(
                              color: Color.fromARGB(255, 14, 113, 194),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              if ((!widget.isEdadAniosMode &&
                                      _edadMesesController.text.isEmpty) ||
                                  (widget.isEdadAniosMode &&
                                      _pesoController.text.isEmpty)) {
                                return t.patientValEnterAgeYears;
                              }
                              return null;
                            }
                            if (int.tryParse(value) == null) {
                              return t.patientValInvalidNumber;
                            }
                            final int? edad = int.tryParse(value);
                            if (edad != null && (edad < 1 || edad > 14)) {
                              return t.patientValAgeRangeYears;
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 1),

                        if (!widget.isEdadAniosMode)
                          TextFormField(
                            controller: _edadMesesController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: t.patientAgeMonthsLabel,
                              hintText: t.patientAgeMonthsHint,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
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
                                color: Theme.of(context).colorScheme.onSurface
                                    .withAlpha((0.7 * 255).round()),
                              ),
                              floatingLabelStyle: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            validator: (value) {
                              if (!widget.isEdadAniosMode &&
                                  _edadAniosController.text.isEmpty) {
                                if (value == null || value.isEmpty) {
                                  return t.patientValEnterAgeYears;
                                }
                                if (int.tryParse(value) == null) {
                                  return t.patientValInvalidNumber;
                                }
                                final int? edad = int.tryParse(value);
                                if (edad != null && (edad < 1 || edad > 11)) {
                                  return t.patientValAgeMonthsRange;
                                }
                              }
                              return null;
                            },
                          ),

                        if (_mostrarPesoEstimadoPrincipal)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              RichText(
                                text: TextSpan(
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleMedium,
                                  children: [
                                    TextSpan(
                                      text: '${t.patientEstimatedWeightLabel} ',
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          '${_pesoEstimadoValue!.toStringAsFixed(1)} Kg',
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

                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: _pesoSourceChip(context, t),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                ElevatedButton.icon(
                  onPressed: () => _calcularDosis(t),
                  icon: const Icon(Icons.arrow_forward),
                  label: Text(
                    _labelBoton(t),
                    style: const TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 233, 247, 239),
                    foregroundColor: const Color.fromARGB(255, 14, 113, 194),

                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: const BorderSide(
                        color: Color(0xFFB7E4C7), // ✅ borde
                        width: 1.5, // opcional (1–2 se ve muy bien)
                      ),
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
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Paciente'),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'Instrucciones',
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

  Widget _pesoSourceChip(BuildContext context, AppLocalizations t) {
    final bool usaPesoReal = _tienePesoValido;
    final bool usaEstimado =
        widget.isEdadAniosMode && !usaPesoReal && _pesoEstimadoValue != null;

    if (!usaPesoReal && !usaEstimado) return const SizedBox.shrink();

    if (usaPesoReal) {
      return Chip(
        label: Text(t.patientChipRealWeight),
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
      label: Text(t.patientChipEstimated),
      visualDensity: VisualDensity.compact,
      backgroundColor: const Color(0xFFFFF7E6),
      side: const BorderSide(color: Color(0xFFFFE0B2)),
      labelStyle: const TextStyle(
        color: Color(0xFF8A6D1D),
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
