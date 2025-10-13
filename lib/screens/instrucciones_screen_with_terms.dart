import 'package:flutter/material.dart';
import 'package:mi_app/screens/edad_selection_screen.dart';

class InstruccionesScreenWithTerms extends StatefulWidget {
  const InstruccionesScreenWithTerms({super.key});

  @override
  State<InstruccionesScreenWithTerms> createState() =>
      _InstruccionesScreenWithTermsState();
}

class _InstruccionesScreenWithTermsState
    extends State<InstruccionesScreenWithTerms> {
  bool _termsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Instrucciones y Términos')),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: const [
                      InstructionAccordion(
                        title: '1. Contenido de la tabla',
                        content:
                            'La siguiente tabla contiene información sobre medicación de más frecuente uso en emergencias.',
                      ),
                      InstructionAccordion(
                        title: '2. Aplicabilidad a niños',
                        content:
                            'Es aplicable a niños mayores a un mes de edad.',
                      ),
                      InstructionAccordion(
                        title: '3. Determinación de Peso/Edad',
                        content:
                            'Se debe ingresar: EDAD en AÑOS y PESO en KILOGRAMOS... En caso de peso desconocido, se pone solo la edad, y en la columna de la derecha se calcula automáticamente el peso según la edad, una vez realizado es cálculo se DEBE poner MANUALMENTE este peso calculado en la casilla de peso del paciente, para que se puedan realizar los cálculos de los medicamentos.',
                      ),
                      InstructionAccordion(
                        title: '4. Volumen de las soluciones de mantenimiento',
                        content:
                            'En el cálculo del volumen de las soluciones de mantenimiento se puede variar el PORCENTAJE de requerimientos al cual se desea la solución.',
                      ),
                      InstructionAccordion(
                        title: '5. Cálculos automáticos',
                        content:
                            'Todas las dosis están calculadas de forma automática con el peso o la edad de paciente (tamaño de TET).',
                      ),
                      InstructionAccordion(
                        title: '6. Verificación de rangos',
                        content:
                            'Aquellas dosis que tienen rangos han sido calculadas a un solo número preferido que puede ser verificado en la fórmula de medicamento.',
                      ),
                      InstructionAccordion(
                        title:
                            '7. Requerimientos de cálculo de dosis diferentes',
                        content:
                            'En caso de requerir cálculos a dosis diferentes a la propuesta se debe de hacer manual la propuesta ya que esta tabla NO es modificable.',
                      ),
                      InstructionAccordion(
                        title: '8. Cálculo del tamaño del CAF (XS, S, etc.)',
                        content:
                            'El cálculo del tamaño del CAF (XS, S, etc.) se realiza mediante el peso del paciente y a la derecha de las tablas aparecerá un Check en aquellas sugeridas para ese paciente, en caso de que el tamaño del CAF NO sea apropiado para el paciente, el espacio queda en blanco.',
                      ),
                      InstructionAccordion(
                        title: '9. Responsabilidad del Usuario',
                        content:
                            'EL USO DE ESTA TABLA ES RESPONSABILIDAD COMPLETA E INDIVIDUAL DE QUIEN LA UTILICE. NO EXIME EL DEBER TÉCNICO DE CORROBORAR LOS DATOS CON UN LIBRO DE TEXTO ACTUALIZADO Y CORRECTO PREVIA LA ADMINISTRACIÓN DE MEDICAMENTOS.',
                        isImportant: true,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: _termsAccepted,
                          onChanged: (bool? newValue) {
                            setState(() {
                              _termsAccepted = newValue!;
                            });
                          },
                          activeColor: const Color.fromARGB(255, 14, 113, 194),
                        ),
                        Expanded(
                          child: Text(
                            'He leído y acepto los términos y condiciones.',
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(
                                  color: const Color.fromARGB(
                                    255,
                                    14,
                                    113,
                                    194,
                                  ),
                                ),

                            overflow: TextOverflow.clip,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _termsAccepted
                      ? () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EdadSelectionScreen(),
                            ),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    'Continuar',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InstructionAccordion extends StatefulWidget {
  final String title;
  final String content;
  final bool isImportant;

  const InstructionAccordion({
    super.key,
    required this.title,
    required this.content,
    this.isImportant = false,
  });

  @override
  State<InstructionAccordion> createState() => _InstructionAccordionState();
}

class _InstructionAccordionState extends State<InstructionAccordion> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10.0),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          ListTile(
            title: Text(
              widget.title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: widget.isImportant
                    ? Colors.red.shade700
                    : const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            trailing: Icon(
              _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: widget.isImportant
                  ? Colors.red.shade700
                  : const Color.fromARGB(255, 83, 232, 103),
              size: 32,
            ),
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
          ),
          if (_isExpanded)
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
              child: Text(
                widget.content,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 13,
                  color: widget.isImportant
                      ? Colors.red.shade900
                      : const Color.fromARGB(255, 31, 120, 43),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
