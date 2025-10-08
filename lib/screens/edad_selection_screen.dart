import 'package:flutter/material.dart';
import 'package:mi_app/screens/paciente_data_screen.dart';
import 'package:mi_app/screens/paciente_data_meses_screen.dart';

class EdadSelectionScreen extends StatefulWidget {
  const EdadSelectionScreen({super.key});

  @override
  State<EdadSelectionScreen> createState() => _EdadSelectionScreenState();
}

class _EdadSelectionScreenState extends State<EdadSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Seleccionar tipo de edad'),
          automaticallyImplyLeading:
              false, // <-- ESTA LÍNEA QUITA LA FLECHA DE RETROCESO
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Botón para "Anotar la Edad actual del paciente en años (mayores de 1 año)"
              SizedBox(
                width:
                    300, // Ancho fijo para los botones, ajusta según necesites
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PacienteDataScreen(
                          isEdadAniosMode: true,
                        ), // Pasamos un flag para indicar el modo
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 25,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    'Edad en Años (1+ años)',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PacienteDataMesesScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 25,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    'Edad en Meses (1-11 meses)',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
