// test/dosis_calculator_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mi_app/models/paciente.dart';
import 'package:mi_app/models/medicamento.dart';
import 'package:mi_app/utils/dosis_calculator_meses.dart';

void main() {
  group('Pruebas de Cálculo de Dosis (por ID estable)', () {
    test('Adrenalina IV: dosis para un paciente de 10 kg', () {
      final paciente = Paciente(pesoKg: 10.0, edadAnios: 0, edadMeses: 10);

      // ✅ Usa el ID estable (NO el nombre)
      final medicamento = Medicamento(
        id: 'med_brady_epi_iv', // <-- cambia por tu ID real
        nombre: 'Adrenalina IV',
        categoria: 'Bradiarritmias',
        observaciones: '',
        rangoDosisOriginal: '',
        dosisActualMG: '',
      );

      final resultado = DosisCalculatorMeses.calculateDosis(
        paciente,
        medicamento,
      );

      // Si tu calculadora devuelve ml:
      // expect(resultado['ml'], 1.0); // puede fallar por decimales
      expect((resultado['ml'] as double), closeTo(1.0, 0.0001));
    });

    test('Adrenalina ET: dosis para un paciente de 15 kg', () {
      final paciente = Paciente(pesoKg: 15.0, edadAnios: 0, edadMeses: 15);

      final medicamento = Medicamento(
        id: 'med_cardiac_arrest_epi_et', // <-- cambia por tu ID real
        nombre: 'Adrenalina ET',
        categoria: 'Paro cardíaco',
        observaciones: '',
        rangoDosisOriginal: '',
        dosisActualMG: '',
      );

      final resultado = DosisCalculatorMeses.calculateDosis(
        paciente,
        medicamento,
      );

      expect((resultado['ml'] as double), closeTo(15.0, 0.0001));
    });
  });
}
