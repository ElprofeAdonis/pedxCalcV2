// lib/models/medicamento_calculado.dart
import 'package:mi_app/models/medicamento.dart'; // Importa tu clase Medicamento base

class MedicamentoCalculado {
  final Medicamento medicamentoOriginal;
  final String dosisMlDisplay;
  final String dosisMgDisplay;
  final String dosisJuliosDisplay;
  final String dosisDisplayString;

  MedicamentoCalculado({
    required this.medicamentoOriginal,
    this.dosisMlDisplay = 'N/A',
    this.dosisMgDisplay = 'N/A',
    this.dosisJuliosDisplay = 'N/A',
    this.dosisDisplayString = 'N/A',
  });
}
