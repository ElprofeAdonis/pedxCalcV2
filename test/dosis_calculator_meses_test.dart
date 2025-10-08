// test/dosis_calculator_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:mi_app/models/paciente.dart'; // Asegúrate de que esta ruta sea la correcta
import 'package:mi_app/models/medicamento.dart'; // Asegúrate de que esta ruta sea la correcta
import 'package:mi_app/utils/dosis_calculator_meses.dart'; // Asegúrate de que esta ruta sea la correcta

void main() {
  group('Pruebas de Cálculo de Dosis', () {
    test('Adrenalina IV: Dosis para un paciente de 10 kg', () {
      final paciente = Paciente(pesoKg: 10.0, edadAnios: 0, edadMeses: 10);
      final medicamento = Medicamento(
        nombre: 'Adrenalina IV',
        categoria: 'Urgencias',
        observaciones: '',
        rangoDosisOriginal: '',
        dosisActualMG:
            '0.1', // Valor como String para que coincida con tu clase
      );

      final resultado = DosisCalculatorMeses.calculateDosis(
        paciente,
        medicamento,
      );

      // Fórmula: dosisMl = peso * 0.1;
      // Esperamos: 10 kg * 0.1 = 1.0 ml
      expect(resultado['ml'], 1.0);
    });
    test('Adrenalina ET: Dosis para un paciente de 15 kg', () {
      final paciente = Paciente(pesoKg: 15.0, edadAnios: 0, edadMeses: 15);
      final medicamento = Medicamento(
        nombre: 'Adrenalina ET',
        categoria: 'Urgencias',
        observaciones: '',
        rangoDosisOriginal: '',
        dosisActualMG: '1', // Valor como String
      );

      final resultado = DosisCalculatorMeses.calculateDosis(
        paciente,
        medicamento,
      );

      // Fórmula: dosisMl = peso * 1;
      // Esperamos: 15 kg * 1 = 15.0 ml
      expect(resultado['ml'], 15.0);
    });
  });
}
