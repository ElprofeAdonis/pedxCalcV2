import 'package:flutter/foundation.dart';
import 'dart:math';
import '../models/paciente.dart';
import '../models/medicamento.dart';

class DosisCalculator {
  static double _roundDouble(double value, int places) {
    num mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }

  static Map<String, dynamic> calculateDosis(
    Paciente paciente,
    Medicamento medicamento,
  ) {
    if (medicamento.nombre.trim() == 'Adrenalina IM.') {
      return {'display_string': '0.3 ml - 0.5 ml'};
    } else if (medicamento.nombre.trim() == 'Adrenalina nebulizada') {
      return {'display_string': '0.5 mL + 3 mL SF'};
    } else if (medicamento.nombre.trim() == 'Budesonida nebulizada') {
      return {'display_string': '4 mL'};
    } else if (medicamento.nombre.trim() == 'Salbutamol neb 1-5 años') {
      return {
        'display_string':
            '0,5 ml (2,5 mg) + 2.5 cc SF ó 4puff cada 20 min (#3 neb)  Max: 7.5 mg',
      };
    } else if (medicamento.nombre.trim() == 'Salbutamol neb > 5 años') {
      return {
        'display_string': '1 ml (5mg) + 2cc SF ó 6puff cada 20 min (#3 neb)',
      };
    } else if (medicamento.nombre.trim() == 'Atrovent neb 1-5 años') {
      return {
        'display_string': '1ml (250 ug) + 2ml SF ó 2puff cada 20 min (#3 neb)',
      };
    } else if (medicamento.nombre.trim() == 'Atrovent neb > 5 años') {
      return {
        'display_string': '2ml (500 ug) + 1ml SF ó 4puff cada 20 min (#3 neb)',
      };
    } else if (medicamento.nombre.trim() == 'Catéter femoral:') {
      return {'display_string': '<2a: 4F ------13-30cm'};
    } else if (medicamento.nombre.trim() == 'Catéter yugular:') {
      return {'display_string': '2-6 a: 4F  ---- 5-8 cn'};
    } else if (medicamento.nombre.trim() == 'Catéter para drenaje pleural:') {
      return {'display_string': 'RN 6-12F'};
    } else if (medicamento.nombre.trim() == 'Ipratropium neb 1 - 5 años') {
      return {
        'display_string': '250 ug + 2.5 mg SBT + 1.5 cc sf cada 20 min (3 neb)',
      };
    } else if (medicamento.nombre.trim() == 'Ipratropium neb > 5 años') {
      return {'display_string': '500 ug + 5 mg SBT cada 20 min (3 neb)'};
    } else if (medicamento.nombre == 'HCO3 del paciente') {
      return {'display_string': '7'};
    }
    double dosisMg = 0.0;
    double dosisMl = 0.0;
    double dosisJulios = 0.0;
    String display_string = '';

    if (paciente.pesoKg == null || paciente.pesoKg <= 0) {
      debugPrint('Error: El peso del paciente es nulo o cero.');
      return {'ml': 0.0, 'mg': 0.0, 'julios': 0.0};
    }

    final double peso = paciente.pesoKg;

    if (medicamento.nombre.startsWith('Adrenalina')) {
      dosisJulios = 0.0;

      if (medicamento.nombre == 'Adrenalina IV') {
        if (medicamento.categoria == 'Paro cardiaco') {
          dosisMl = (peso * 0.1).clamp(0.0, 10.0);
          dosisMg = (peso * 0.01).clamp(0.0, 1.0);
        } else if (medicamento.categoria == 'Bradiarritmias') {
          dosisMl = ((peso * 0.1) * 10).clamp(0.0, 10.0);
          dosisMg = (peso * 0.1).clamp(0.0, 1.0);
        } else if (medicamento.categoria == 'Anafilaxia') {
          dosisMl = peso * 0.01;
          dosisMg = 0.0;
        } else {
          dosisMl = 0.0;
          dosisMg = 0.0;
        }
      } else if (medicamento.nombre == 'Adrenalina ET') {
        if (medicamento.categoria == 'Paro cardiaco') {
          dosisMl = peso * 1;
          dosisMg = (peso * 0.1).clamp(0.0, 1.0);
        } else {
          dosisMl = 0.0;
          dosisMg = 0.0;
        }
      } else if (medicamento.nombre == 'Adrenalina / Noradrenalina') {
        if (medicamento.categoria == 'Inotrópicos') {
          dosisMl = 0.0;
          dosisMg = (peso * 0.3);
          dosisJulios = 0.0;
          dosisMg = _roundDouble(dosisMg, 0);
          return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
        } else {
          dosisMl = 0.0;
          dosisMg = 0.0;
        }
      } else if (medicamento.nombre == 'Adrenalina IM') {
        if (medicamento.categoria == 'Anafilaxia') {
          if (peso > 30) {
            return {'display_string': '0.3 ml - 0.5 ml'};
          } else {
            dosisMl = peso * 0.01;
            dosisMg = 0.0;
            dosisMl = _roundDouble(dosisMl, 1);
            dosisMg = _roundDouble(dosisMg, 1);
            return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
          }
        } else {
          dosisMl = 0.0;
          dosisMg = 0.0;
        }
      } else {
        dosisMl = 0.0;
        dosisMg = 0.0;
      }

      dosisMl = _roundDouble(dosisMl, 2);
      dosisMg = _roundDouble(dosisMg, 2);

      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Adenosina primera') {
      dosisMl = (peso * 0.1).clamp(0.0, 2.0);
      dosisMg = (peso * 0.1).clamp(0.0, 6.0);

      dosisMg = _roundDouble(dosisMg, 0);
      dosisMl = _roundDouble(dosisMl, 1);

      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Adenosina segunda') {
      dosisMl = (peso * 0.2).clamp(0.0, 4.0);
      dosisMg = (peso * 0.2).clamp(0.0, 12.0);
      dosisMg = _roundDouble(dosisMg, 0);
      dosisMl = _roundDouble(dosisMl, 1);

      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Adenosina tercera') {
      dosisMl = (peso * 0.3).clamp(0.0, 4.0);
      dosisMg = (peso * 0.3).clamp(0.0, 12.0);

      dosisMg = _roundDouble(dosisMg, 0);
      dosisMl = _roundDouble(dosisMl, 1);

      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Rocuronio IV') {
      dosisMl = (peso * 0.5) / 10.0;
      dosisMg = peso * 0.5;

      dosisMg = _roundDouble(dosisMg, 0);
      dosisMl = _roundDouble(dosisMl, 1);

      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Pancuronio') {
      dosisMl = (peso * 0.1) / 2.0;

      dosisMg = peso * 0.1;

      dosisMg = _roundDouble(dosisMg, 2);
      dosisMl = _roundDouble(dosisMl, 1);

      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Succinilcolina') {
      dosisMl = (peso * 1.0) / 10.0;
      dosisMg = peso * 1.0;

      dosisMg = _roundDouble(dosisMg, 2);
      dosisMl = _roundDouble(dosisMl, 2);

      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Atracurio') {
      dosisMl = (peso * 0.4) / 10.0;
      dosisMg = peso * 0.4;

      dosisMg = _roundDouble(dosisMg, 2);
      dosisMl = _roundDouble(dosisMl, 1);

      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Flumazenilo IV') {
      dosisMl = (peso * 0.01) / 0.1;
      dosisMg = peso * 0.01;
      dosisMg = _roundDouble(dosisMg, 1);
      dosisMl = _roundDouble(dosisMl, 2);

      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Naloxona') {
      dosisMl = (peso * 0.01) / 0.4;
      dosisMg = peso * 0.01;

      dosisMg = _roundDouble(dosisMg, 1);
      dosisMl = _roundDouble(dosisMl, 1);

      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Atropina') {
      dosisMl = (peso * 2.0).clamp(0.0, 10.0);
      dosisMg = (peso * 0.2).clamp(0.0, 1.0);

      dosisMg = _roundDouble(dosisMg, 1);
      dosisMl = _roundDouble(dosisMl, 1);

      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Bicarbonato de sodio 1M') {
      dosisJulios = 0.0;

      if (medicamento.categoria == 'Paro cardiaco') {
        dosisMl = (peso * 1).clamp(0.0, 100.0);
        dosisMg = (peso * 1).clamp(0.0, 100.0);

        dosisMl = _roundDouble(dosisMl, 2);
        dosisMg = _roundDouble(dosisMg, 2);

        return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
      } else if (medicamento.categoria == 'Electrolitos') {
        dosisMl = peso * 1.0;
        dosisMg = 0.0;

        dosisMl = _roundDouble(dosisMl, 2);

        return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
      } else {
        return {'display_string': 'N/A'};
      }
    } else if (medicamento.nombre == 'Sulfato de magnesio') {
      dosisMl = (peso * 50.0) / 200.0;

      dosisMg = (peso * 50.0).clamp(0.0, 2000.0);

      dosisMg = _roundDouble(dosisMg, 2);
      dosisMl = _roundDouble(dosisMl, 0);

      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Amiodarona') {
      dosisMl = (peso * 5.0 / 6.0).clamp(0.0, 50.0);

      dosisMg = (peso * 5.0).clamp(0.0, 300.0);

      dosisMg = _roundDouble(dosisMg, 2);
      dosisMl = _roundDouble(dosisMl, 0);

      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Midazolam IV') {
      dosisMl = ((peso * 0.3).clamp(0.0, 15.0)) / 5.0;

      dosisMg = peso * 0.3;

      dosisMg = _roundDouble(dosisMg, 0);
      dosisMl = _roundDouble(dosisMl, 1);

      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Primera descarga eléctrica') {
      dosisJulios = peso * 2.0;

      dosisJulios = _roundDouble(dosisJulios, 0);

      return {'mg': 0.0, 'ml': 0.0, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Segunda descarga eléctrica') {
      dosisJulios = peso * 4.0;

      dosisJulios = _roundDouble(dosisJulios, 0);

      return {'mg': 0.0, 'ml': 0.0, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Descarga máxima') {
      dosisJulios = peso * 10.0;

      dosisJulios = _roundDouble(dosisJulios, 0);

      return {'mg': 0.0, 'ml': 0.0, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Solución fisiológica') {
      dosisMl = peso * 20.0;
      dosisMg = 0.0;
      dosisJulios = 0.0;
      dosisMl = _roundDouble(dosisMl, 1);
      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Crioprecipitados') {
      dosisMl = peso * 10.0;
      dosisMg = 0.0;
      dosisJulios = 0.0;
      dosisMl = _roundDouble(dosisMl, 1);
      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Plaquetas') {
      dosisMl = peso * 10.0;
      dosisMg = 0.0;
      dosisJulios = 0.0;
      dosisMl = _roundDouble(dosisMl, 1);
      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'GRE/PFC') {
      dosisMl = peso * 5.0;
      dosisMg = 0.0;
      dosisJulios = 0.0;
      dosisMl = _roundDouble(dosisMl, 1);
      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Ácido tranexámico') {
      dosisMl = peso * 15.0 / 100.0;
      dosisMg = 0.0;
      dosisJulios = 0.0;
      dosisMl = _roundDouble(dosisMl, 1);
      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Solución hipertónica') {
      dosisMl = peso * 5.0;
      dosisMg = 0.0;
      dosisJulios = 0.0;
      dosisMl = _roundDouble(dosisMl, 1);
      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Manitol') {
      dosisMl = peso / 0.2;
      dosisMg = 0.0;
      dosisJulios = 0.0;
      dosisMl = _roundDouble(dosisMl, 1);
      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Solución hipertónica.') {
      dosisMl = peso * 4.0;
      dosisMg = 0.0;
      dosisJulios = 0.0;
      dosisMl = _roundDouble(dosisMl, 1);
      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Diazepam IV') {
      dosisMl = (peso * 0.3) / 5;
      dosisMg = 0.0;
      dosisJulios = 0.0;
      dosisMl = _roundDouble(dosisMl, 1);
      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Diazepam VR') {
      dosisMl = (peso * 0.5) / 5;
      dosisMg = 0.0;
      dosisJulios = 0.0;
      dosisMl = _roundDouble(dosisMl, 0);
      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Midazolam IV o IM') {
      dosisMl = (peso * 0.3) / 5;
      dosisMg = 0.0;
      dosisJulios = 0.0;
      dosisMl = _roundDouble(dosisMl, 1);
      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Solución mixta mantenimiento') {
      // Componente 1: para <10 kg (C5*100)
      double componente1 = 0.0;
      if (peso <= 10) {
        componente1 = peso * 100;
      } else {
        componente1 = 1000.0;
      }
      // Componente 2: para 10-20 kg ((C5-10)*50)
      double componente2 = 0.0;
      if (peso >= 10 && peso < 21) {
        componente2 = (peso - 10) * 50;
      } else if (peso >= 21) {
        componente2 = 10 * 50;
      }
      double componente3 = 0.0;
      if (peso > 20) {
        componente3 = (peso - 20) * 20;
      }
      dosisMl = componente1 + componente2 + componente3;
    } else if (medicamento.nombre == 'SG 25%') {
      dosisMl = (peso * 2);
      dosisMg = 0.0;
      dosisJulios = 0.0;
      dosisMl = _roundDouble(dosisMl, 1);
      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Sol glucosada mayor 1 mes edad') {
      final double dosisEnMg = peso * 0.5;
      final double dosisRedondeada = _roundDouble(dosisEnMg, 1);

      display_string = '${dosisRedondeada.toStringAsFixed(0)} g';

      return {
        'ml': 0.0,
        'mg': dosisEnMg,
        'julios': 0.0,
        'display_string': display_string,
      };
    } else if (medicamento.nombre == 'Midazolam IN') {
      dosisMl = (peso * 0.4) / 5;
      dosisMg = 0.0;
      dosisJulios = 0.0;
      dosisMl = _roundDouble(dosisMl, 1);
      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Fenitoína IV') {
      dosisMl = (peso * 20) / 50;
      dosisMg = 0.0;
      dosisJulios = 0.0;
      dosisMl = _roundDouble(dosisMl, 0);
      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Fenobarbital') {
      dosisMl = (peso * 20) / 50;
      dosisMg = 0.0;
      dosisJulios = 0.0;
      dosisMl = _roundDouble(dosisMl, 0);
      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Paracetamol oral IV') {
      dosisMg = (peso * 15.0).clamp(0.0, 1000.0);
      dosisMl = 0.0;
      dosisJulios = 0.0;
      dosisMg = _roundDouble(dosisMg, 2);
      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Metamizol IV') {
      dosisMg = (peso * 15.0).clamp(0.0, 1000.0);
      dosisMl = 0.0;
      dosisJulios = 0.0;
      dosisMg = _roundDouble(dosisMg, 2);
      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Ibuprofeno VO') {
      dosisMg = (peso * 10.0).clamp(0.0, 400.0);
      dosisMl = 0.0;
      dosisJulios = 0.0;
      dosisMg = _roundDouble(dosisMg, 2);
      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Dexametasona IV') {
      dosisMl = (peso * 0.6) / 4;
      dosisMg = 0.0;
      dosisJulios = 0.0;
      dosisMl = _roundDouble(dosisMl, 0);
      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Dexametazona') {
      dosisMl = 0.0;
      dosisMg = (peso * 0.1);
      dosisJulios = 0.0;
      dosisMg = _roundDouble(dosisMg, 0);
      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Hidrocortisona IV') {
      dosisMl = 0.0;
      dosisMg = (peso * 4).clamp(0.0, 100.0);
      dosisJulios = 0.0;
      dosisMg = _roundDouble(dosisMg, 0);
      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Metilprednisolona') {
      dosisMl = 0.0;
      dosisMg = (peso * 2).clamp(0.0, 60.0);
      dosisJulios = 0.0;
      dosisMg = _roundDouble(dosisMg, 1);
      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Sulf magnesio IV bolus') {
      dosisMl = 0.0;
      dosisMg = (peso * 50).clamp(0.0, 2000.0);
      dosisJulios = 0.0;
      dosisMg = _roundDouble(dosisMg, 1);
      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Diazepam IV.') {
      dosisMg = (peso * 0.1).clamp(0.0, 10.0);
      dosisMl = (peso * 0.1).clamp(0.0, 10.0);
      dosisJulios = 0.0;

      dosisMg = _roundDouble(dosisMg, 0);
      dosisMl = _roundDouble(dosisMl, 0);

      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Valproato IV') {
      dosisMg = (peso * 20).clamp(0.0, 1000.0);
      dosisMl = (peso * 20).clamp(0.0, 1000.0);
      dosisJulios = 0.0;

      dosisMg = _roundDouble(dosisMg, 0);
      dosisMl = _roundDouble(dosisMl, 0);

      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Fenitoína IV.') {
      dosisMg = (peso * 20).clamp(0.0, 1000.0);
      dosisMl = (peso * 20).clamp(0.0, 1000.0);
      dosisJulios = 0.0;

      dosisMg = _roundDouble(dosisMg, 0);
      dosisMl = _roundDouble(dosisMl, 0);

      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Clonazepam VO') {
      dosisMg = peso * 0.01;
      dosisMl = peso * 0.01;
      dosisJulios = 0.0;

      dosisMg = _roundDouble(dosisMg, 1);
      dosisMl = _roundDouble(dosisMl, 1);

      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Tiopental') {
      dosisMg = (peso * 3).clamp(0.0, 500.0);
      dosisMl = (peso * 3).clamp(0.0, 500.0);
      dosisJulios = 0.0;

      dosisMg = _roundDouble(dosisMg, 0);
      dosisMl = _roundDouble(dosisMl, 0);

      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Levetirazetam') {
      dosisMg = (peso * 30).clamp(0.0, 4500.0);
      dosisMl = (peso * 30).clamp(0.0, 4500.0);
      dosisJulios = 0.0;

      dosisMg = _roundDouble(dosisMg, 0);
      dosisMl = _roundDouble(dosisMl, 0);

      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Sol hipertónica 3%') {
      dosisMg = (peso * 3);
      dosisMl = (peso * 3);
      dosisJulios = 0.0;

      dosisMg = _roundDouble(dosisMg, 0);
      dosisMl = _roundDouble(dosisMl, 0);

      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Fenobarbital.') {
      dosisMg = (peso * 20);
      dosisMl = (peso * 20);
      dosisJulios = 0.0;

      dosisMg = _roundDouble(dosisMg, 0);
      dosisMl = _roundDouble(dosisMl, 0);

      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Paracetamol') {
      dosisMg = (peso * 15);
      dosisMl = (peso * 15);
      dosisJulios = 0.0;

      dosisMg = _roundDouble(dosisMg, 0);
      dosisMl = _roundDouble(dosisMl, 0);

      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Midazolam IV.') {
      dosisMg = (peso * 0.15);
      dosisMl = (peso * 0.15);
      dosisJulios = 0.0;

      dosisMg = _roundDouble(dosisMg, 0);
      dosisMl = _roundDouble(dosisMl, 0);

      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Metamizol IV.') {
      dosisMg = (peso * 6).clamp(0.0, 1000.0);
      dosisMl = (peso * 6).clamp(0.0, 1000.0);
      dosisJulios = 0.0;

      dosisMg = _roundDouble(dosisMg, 0);
      dosisMl = _roundDouble(dosisMl, 0);

      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Ampicilina') {
      dosisMl = 0.0;
      dosisMg = (peso * 50).clamp(0.0, 3000.0);
      dosisJulios = 0.0;
      dosisMg = _roundDouble(dosisMg, 0);
      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Cefotaxima') {
      dosisMl = 0.0;
      dosisMg = ((peso * 200) / 4).clamp(0.0, 4000.0);
      dosisJulios = 0.0;
      dosisMg = _roundDouble(dosisMg, 0);
      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Ceftazidime') {
      dosisMl = 0.0;
      dosisMg = (peso * 50);
      dosisJulios = 0.0;
      dosisMg = _roundDouble(dosisMg, 0);
      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Meropenem') {
      dosisMl = 0.0;
      dosisMg = ((peso * 60) / 3).clamp(0.0, 2000.0);
      dosisJulios = 0.0;
      dosisMg = _roundDouble(dosisMg, 0);
      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Vancomicina') {
      dosisMl = 0.0;
      dosisMg = (peso * 15).clamp(0.0, 500.0);
      dosisJulios = 0.0;
      dosisMg = _roundDouble(dosisMg, 0);
      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Aciclovir') {
      dosisMl = 0.0;
      dosisMg = ((peso * 60) / 3).clamp(0.0, 1000.0);
      dosisJulios = 0.0;
      dosisMg = _roundDouble(dosisMg, 0);
      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Ceftriaxona') {
      dosisMl = 0.0;
      dosisMg = (peso * 100).clamp(0.0, 4000.0);
      dosisJulios = 0.0;
      dosisMg = _roundDouble(dosisMg, 0);
      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Pipe-tazo') {
      dosisMl = 0.0;
      dosisMg = ((peso * 300) / 4).clamp(0.0, 3500.0);
      dosisJulios = 0.0;
      dosisMg = _roundDouble(dosisMg, 0);
      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Amoxi-clav') {
      dosisMl = 0.0;
      dosisMg = ((peso * 90) / 2).clamp(0.0, 1000.0);
      dosisJulios = 0.0;
      dosisMg = _roundDouble(dosisMg, 0);
      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Amikacina') {
      dosisMl = 0.0;
      dosisMg = ((peso * 22.5) / 3).clamp(0.0, 1500.0);
      dosisJulios = 0.0;
      dosisMg = _roundDouble(dosisMg, 0);
      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Clindamicina') {
      dosisMl = 0.0;
      dosisMg = ((peso * 40) / 3).clamp(0.0, 1000.0);
      dosisJulios = 0.0;
      dosisMg = _roundDouble(dosisMg, 0);
      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Morfina') {
      dosisMl = 0.0;
      dosisMg = (peso * 1.5);
      dosisJulios = 0.0;
      dosisMg = _roundDouble(dosisMg, 0);
      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Midazolam') {
      dosisMl = 0.0;
      dosisMg = (peso * 6);
      dosisJulios = 0.0;
      dosisMg = _roundDouble(dosisMg, 0);
      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Dopamina / Dobutamina') {
      dosisMl = 0.0;
      dosisMg = (peso * 15);
      dosisJulios = 0.0;
      dosisMg = _roundDouble(dosisMg, 0);
      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Gluconato de calcio 10%') {
      dosisMg = 0.0;
      dosisJulios = 0.0;

      if (medicamento.categoria == 'Calcio de mantenimiento') {
        dosisMl = (peso * 2).clamp(0.0, 2000.0);
      } else if (medicamento.categoria == 'Electrolitos' ||
          medicamento.categoria ==
              'HIPOCALCEMIA SEVERA, HIPERMAGNESEMIA Ó INTOXICACION CON BLOQUEADORES DE LOS CANALES DE CALCIO') {
        dosisMl = ((peso * 50) / 100).clamp(0.0, 2000.0);
      } else {
        dosisMl = 0.0;
      }
      dosisMl = _roundDouble(dosisMl, 2);

      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Cloruro de calcio 10%') {
      dosisMl = ((peso * 10) / 100).clamp(0.0, 1000.0);
      dosisMg = 0.0;
      dosisJulios = 0.0;
      dosisMl = _roundDouble(dosisMl, 0);
      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Déficit de HCO3') {
      const double sodioDelPaciente = 7;
      const double constante = 0.5;

      dosisMl = (15 - sodioDelPaciente) * peso * constante;
      dosisMg = 0.0;
      dosisJulios = 0.0;
      dosisMl = _roundDouble(dosisMl, 1);

      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre ==
        'Volumen de SG5% a diluir déficit de HCO3') {
      const double sodioDelPaciente = 7;
      const double constante = 0.5;
      final double volumenHco3 = (15 - sodioDelPaciente) * peso * constante;

      dosisMl = volumenHco3 * 7;
      dosisMg = 0.0;
      dosisJulios = 0.0;
      dosisMl = _roundDouble(dosisMl, 1);

      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Velocidad de Infusión.') {
      const double sodioDelPaciente = 7;
      const double constante = 0.5;
      final double volumenHco3 = (15 - sodioDelPaciente) * peso * constante;
      final double dosisCloruroCalcio = volumenHco3 * 7;
      dosisMl = dosisCloruroCalcio / 3;
      dosisMg = 0.0;
      dosisJulios = 0.0;
      dosisMl = _roundDouble(dosisMl, 1);

      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Fentanilo') {
      final double dosisUg = 250 * peso;
      dosisMg = 0.0;
      dosisMl = 0.0;
      dosisJulios = 0.0;

      return {'display_string': '${_roundDouble(dosisUg, 0)} µg'};
    } else if (medicamento.nombre == 'Volumen de SF') {
      final double dosisMl = _roundDouble((peso * 0.5 * 1000) / 40, 0);
      final double dosisMeq = peso * 1;

      return {
        'display_string': '${dosisMl.round()} ml, ${dosisMeq.round()} mEq',
      };
    } else if (medicamento.nombre == 'Insulina simple') {
      final double resultadoFormula = peso * 0.1;

      if (medicamento.categoria == 'Endocrino / Renal') {
        dosisMg = 0.0;
        dosisMl = 0.0;
        dosisJulios = 0.0;
        return {'display_string': '${_roundDouble(resultadoFormula, 0)} UI'};
      } else if (medicamento.categoria == 'Electrolitos') {
        dosisMg = 0.0;
        dosisMl = _roundDouble(resultadoFormula, 0);
        dosisJulios = 0.0;
        return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
      } else {
        return {'display_string': 'N/A'};
      }
    } else if (medicamento.nombre == 'Furosemida') {
      dosisMl = 0.0;
      dosisMg = (peso * 0.5);
      dosisJulios = 0.0;
      dosisMg = _roundDouble(dosisMg, 0);
      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Solución glucosada al 10%') {
      dosisMg = 0.0;
      dosisMl = (peso * 5);
      dosisJulios = 0.0;
      dosisMl = _roundDouble(dosisMl, 0);
      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Morfina.') {
      dosisMl = (peso * 0.1).clamp(0.0, 10.0);
      dosisMg = (peso * 0.1);
      dosisJulios = 0.0;

      dosisMg = _roundDouble(dosisMg, 0);
      dosisMl = _roundDouble(dosisMl, 0);

      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Fentanilo.') {
      final double dosisUg = peso * 2;
      final double dosisMl = (dosisUg / 50).clamp(0.0, 50.0);

      return {
        'display_string':
            '${_roundDouble(dosisMl, 1)} ml, ${_roundDouble(dosisUg, 0)} µg',
      };
    } else if (medicamento.nombre == 'Ketamina') {
      dosisMl = (peso * 1) / 10;
      dosisMg = (peso * 1);
      dosisJulios = 0.0;

      dosisMg = _roundDouble(dosisMg, 0);
      dosisMl = _roundDouble(dosisMl, 0);

      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    } else if (medicamento.nombre == 'Salbutamol nebulizado') {
      double dosisMl;
      double dosisMg;

      if (peso <= 25) {
        dosisMl = 0.5;
        dosisMg = 2.5;
      } else {
        dosisMl = 1;
        dosisMg = 5;
      }
      return {'ml': dosisMl, 'mg': dosisMg, 'julios': 0.0};
    }

    if (medicamento.dosisBaseMgKg != null) {
      dosisMg = medicamento.dosisBaseMgKg! * peso;
      double concentracionParaMl = 1.0;
      if (medicamento.factorDilucion != null &&
          medicamento.factorDilucion! > 0) {
        concentracionParaMl = 1000 / medicamento.factorDilucion!;
      }
      dosisMl = dosisMg / concentracionParaMl;
    } else if (medicamento.dosisBaseMlKg != null) {
      dosisMl = medicamento.dosisBaseMlKg! * peso;
      dosisMg = 0.0;
    } else if (medicamento.dosisFijaMl != null) {
      dosisMl = medicamento.dosisFijaMl!;
      dosisMg = 0.0;
    } else if (medicamento.dosisFijaMg != null) {
      dosisMg = medicamento.dosisFijaMg!;
      dosisMl = 0.0;
    } else {
      debugPrint(
        'Advertencia: No se ha definido un cálculo de dosis específico para ${medicamento.nombre}',
      );
    }

    dosisMg = _roundDouble(dosisMg, 2);
    dosisMl = _roundDouble(dosisMl, 2);

    return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
  }
}
