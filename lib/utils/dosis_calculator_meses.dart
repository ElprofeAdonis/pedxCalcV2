import 'package:flutter/material.dart';
import 'package:mi_app/models/medicamento.dart';
import 'package:mi_app/models/paciente.dart';
import 'dart:math';

class DosisCalculatorMeses {
  static Map<String, dynamic> calculateSodioDosis(
    Paciente paciente,
    double sodioValor,
  ) {
    if (sodioValor <= 0) {
      return {
        'calculosodio': 0.0,
        'deficit_display': 'Ingrese valor de Sodio',
        'volumen_display': 'N/A',
        'velocidad_display': 'N/A',
        'con_sf_display': 'N/A',
      };
    }

    final double peso = paciente.pesoKg;
    final double sodioAjustado = sodioValor > 130 ? 130 : sodioValor;

    final double deficitSodio = ((125 - sodioAjustado) * peso * 0.6) / 4;
    final double deficitSodioRedondeado = _roundDouble(deficitSodio, 2);

    final double volumenSG5 = deficitSodio * 7;
    final double volumenSG5Redondeado = _roundDouble(volumenSG5, 2);

    final double velocidad = volumenSG5 / 3;
    final double velocidadRedondeada = _roundDouble(velocidad, 0);

    final double conSF = ((130 - sodioAjustado) * peso * 0.6) / 154 * 1000;
    final double conSFRedondeado = _roundDouble(conSF, 0);

    return {
      'deficit_display': 'Déficit: ${formatDosis(deficitSodioRedondeado)} mL',
      'volumen_display': 'Volumen: ${formatDosis(volumenSG5Redondeado)} mL',
      'velocidad_display':
          'Velocidad: ${formatDosis(velocidadRedondeada)} mL/h',
      'con_sf_display': 'Con SF: ${formatDosis(conSFRedondeado)} mL',
    };
  }

  static Map<String, dynamic> calculateHco3Dosis(
    Paciente paciente,
    double hco3Valor,
  ) {
    if (hco3Valor <= 0) {
      return {
        'calculohco3': 0.0,
        'deficit_display': 'Ingrese valor de HCO3',
        'volumen_display': 'N/A',
        'velocidad_display': 'N/A',
      };
    }

    final double hco3Ajustado = hco3Valor > 15 ? 15 : hco3Valor;

    final double deficit = (15 - hco3Ajustado) * paciente.pesoKg * 0.5;

    final double volumen = deficit * 7;

    final double velocidad = volumen / 3;
    final int velocidadRedondeada = velocidad.round();

    return {
      'calculohco3': deficit,
      'deficit_display': 'Déficit: ${formatDosis(deficit)} mL',
      'volumen_display': 'Volumen: ${formatDosis(volumen)} mL',
      'velocidad_display': 'Velocidad: ${velocidadRedondeada} mL/h',
    };
  }

  static String formatDosis(double dosis) {
    final roundedDosis = double.parse(dosis.toStringAsFixed(2));
    if (roundedDosis == roundedDosis.toInt()) {
      return roundedDosis.toInt().toString();
    }
    return roundedDosis.toString();
  }

  static double _roundDouble(double value, int places) {
    if (value.isNaN || value.isInfinite) {
      return 0.0;
    }
    final num mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }

  static double _calculateSolucionMixta(Paciente paciente) {
    final double peso = paciente.pesoKg;
    double dosisMl = 0.0;

    if (peso < 10) {
      dosisMl = peso * 100;
    } else if (peso >= 10 && peso <= 20) {
      dosisMl = 10 * 100 + (peso - 10) * 50;
    } else if (peso > 20) {
      dosisMl = (peso - 20) * 20 + 1500;
    }

    return dosisMl;
  }

  static String _calculateTalla(double peso) {
    if (peso >= 7 && peso <= 25) {
      return 'XL ✅';
    } else if (peso >= 3.5 && peso <= 18) {
      return 'L ✅';
    } else if (peso >= 1.5 && peso <= 8) {
      return 'M ✅';
    } else if (peso >= 1 && peso <= 3.5) {
      return 'S ✅';
    } else if (peso >= 1 && peso <= 2) {
      return 'XS ✅';
    }
    return '🚫';
  }

  static String _calculateCatheterSize(int edadMeses) {
    if (edadMeses >= 1 && edadMeses <= 12) {
      return '4F';
    }
    return 'N/A';
  }

  static Map<String, dynamic> calculateDosis(
    Paciente paciente,
    Medicamento medicamento, {
    double? porcentaje,
  }) {
    double dosisMl = 0.0;
    double dosisMg = 0.0;
    double dosisJulios = 0.0;
    String display_string = '';

    final double peso = paciente.pesoKg!;
    final int edadMeses = paciente.edadMeses ?? 0;
    int mlDecimalPlaces = 1;
    int mgDecimalPlaces = 1;

    if (medicamento.nombre == 'Catéter femoral:' ||
        medicamento.nombre.trim() == 'Catéter yugular:') {
      final String catheterSize = _calculateCatheterSize(edadMeses);
      return {'display_string': catheterSize};
    }

    // -- Lógica específica para Adrenalina IV --
    //===========================================================
    //============== test =======================================
    if (medicamento.nombre == 'Adrenalina IV') {
      dosisMl = peso * 0.1;
    } else if (medicamento.nombre == 'Adrenalina ET') {
      dosisMl = peso * 1;
    }
    //============== test =======================================
    else if (medicamento.nombre == 'Primera descarga eléctrica') {
      dosisJulios = peso * 2;
    } else if (medicamento.nombre == 'Segunda descarga eléctrica') {
      dosisJulios = peso * 4;
    } else if (medicamento.nombre == 'Amiodarona') {
      dosisMl = (peso * 5) / 6;
    } else if (medicamento.nombre == 'Sulfato de magnesio') {
      dosisMl = (peso * 50) / 200;
    } else if (medicamento.nombre == 'Bicarbonato de sodio 1M') {
      dosisMl = (peso * 1);
    } else if (medicamento.nombre == 'Prednisona') {
      dosisMg = (peso * 1);
    } else if (medicamento.nombre == 'Adenosina primera') {
      dosisMl = (peso * 0.1);
    } else if (medicamento.nombre == 'Adenosina segunda') {
      dosisMl = (peso * 0.2);
    } else if (medicamento.nombre == 'Adenosina tercera') {
      dosisMl = (peso * 0.3);
    } else if (medicamento.nombre == 'Atropina') {
      dosisMl = (peso * 0.2);
    } else if (medicamento.nombre == 'Ácido tranexámico') {
      dosisMl = (peso * 15) / 100;
    } else if (medicamento.nombre == 'GRE/PFC') {
      dosisMl = (peso * 5);
    } else if (medicamento.nombre == 'Plaquetas' ||
        medicamento.nombre == 'Crioprecipitados' ||
        medicamento.nombre == 'Solución Fisiológica') {
      dosisMl = (peso * 10);
    } else if (medicamento.nombre == 'Manitol') {
      dosisMl = (peso / 0.2);
    } else if (medicamento.nombre == 'Diazepam IV' ||
        medicamento.nombre == 'Midazolam IV o IM') {
      dosisMl = (peso * 0.3) / 5;
    } else if (medicamento.nombre == 'Midazolam') {
      if (medicamento.categoria == 'Infusiones sedación') {
        dosisMg = peso * 6;
      } else if (medicamento.categoria == 'Secuencia rápida de intubación') {
        dosisMl = (peso * 0.3) / 5;
      }
    } else if (medicamento.nombre == 'Diazepam VR') {
      dosisMl = (peso * 0.5) / 5;
    } else if (medicamento.nombre == 'Midazolam IN') {
      dosisMl = (peso * 0.4) / 5;
    } else if (medicamento.nombre == 'Fenitoína IV' ||
        medicamento.nombre == 'Fenobarbital IV') {
      dosisMl = (peso * 20) / 50;
    } else if (medicamento.nombre == 'Solución hipertónica 3%') {
      if (medicamento.categoria == 'Hipertensión intracraneal') {
        dosisMl = peso * 5;
      } else if (medicamento.categoria ==
          'Hiponatremia aguda sintomática (convulsiones)') {
        dosisMl = peso * 4;
      }
    } else if (medicamento.nombre == 'Dexametasona IV') {
      if (medicamento.categoria == 'ASMA') {
        dosisMg = peso * 0.1;
      } else if (medicamento.categoria ==
          'Medicación específica según patología respiratoria') {
        dosisMl = (peso * 0.6) / 4;
      }
    } else if (medicamento.nombre == 'Paracetamol oral IV' ||
        medicamento.nombre == 'Metamizol IV') {
      dosisMg = (peso * 15);
    }
    // ----------------------- CONVIERTE PARA STRING ---------------------------
    else if (medicamento.nombre == 'Insulina simple') {
      if (medicamento.categoria == 'Electrolitos') {
        dosisMl = (peso * 0.1);
      } else if (medicamento.categoria == 'Endocrino / Renal') {
        final double dosisMcG = (peso / 5) * 12;
        display_string = '${dosisMcG.toStringAsFixed(1)} UI';
      }
    } else if (medicamento.nombre == 'Furosemida') {
      dosisMg = (peso * 0.5);
    }
    // es especial otro simbolo
    else if (medicamento.nombre == 'Fentanilo') {
      if (medicamento.categoria == 'Infusiones sedación') {
        final double dosisMcG = peso * 250;
        display_string = '${dosisMcG.toStringAsFixed(1)} mcg';
      } else if (medicamento.categoria == 'Analgesia') {
        dosisMl = (peso * 2) / 50;
      }
    } else if (medicamento.nombre == 'Morfina') {
      if (medicamento.categoria == 'Analgesia') {
        dosisMl = peso * 0.1;
      } else if (medicamento.categoria == 'Infusiones sedación') {
        dosisMg = peso;
      }
    }
    // FORMULA PARA cON SR
    else if (medicamento.nombre == 'Con SF') {
      final double X = ((130 - 110) * peso * 0.6) / 154 * 1000;
      dosisMl = X * 1;
      mlDecimalPlaces = 0;
    } else if (medicamento.nombre == 'Déficit de sodio') {
      final double Y = ((125 - 110) * peso * 0.6) / 4;
      dosisMl = Y * 1;
    } else if (medicamento.nombre == 'Volumen de SG5%') {
      if (medicamento.categoria == 'Reposición de sodio') {
        final double c151 = ((125 - 110) * peso * 0.6) / 4;
        dosisMl = c151 * 7;
      }
    } else if (medicamento.nombre == 'Velocidad de infusión a pasar en 3h') {
      if (medicamento.categoria == 'Reposición de sodio') {
        final double c151 = ((125 - 110) * peso * 0.6) / 4;

        final double c152 = c151 * 7;

        final double dosisMlPorHora = c152 / 3;
        final double dosisRedondeada = _roundDouble(dosisMlPorHora, 0);
        display_string =
            '${DosisCalculatorMeses.formatDosis(dosisRedondeada)} ml/h';
      }
    } else if (medicamento.nombre == 'Ketamina' ||
        medicamento.nombre == 'Succinilcolina') {
      dosisMl = (peso * 1) / 10;
    } else if (medicamento.nombre == 'Pancuronio') {
      dosisMl = (peso * 0.1) / 2;
    } else if (medicamento.nombre == 'Rocuronio') {
      dosisMl = (peso / 10);
    } else if (medicamento.nombre == 'Atracurio') {
      dosisMl = (peso * 0.4) / 10;
    } else if (medicamento.nombre.trim() == 'Salbutamol 1-5 años') {
      return {'display_string': '0,5ml SBT + 2.5ml SF (4puff) cada 20 min #3'};
    } else if (medicamento.nombre.trim() == 'Salbutamol > 5 años') {
      return {'display_string': '1ml SBT + 2ml SF (6puff) cada 20 min #3'};
    } else if (medicamento.nombre.trim() == 'Atrovent 2-5 años') {
      return {'display_string': '1ml ATV + 2ml SF (2puff) cada 20 min #3'};
    } else if (medicamento.nombre.trim() == 'Atrovent > 5 años') {
      return {'display_string': '2ml ATV + 1ml SF (4puff) cada 20 min #3'};
    } else if (medicamento.nombre.trim() == 'Catéter para drenaje pleural:') {
      return {'display_string': 'RN 6-12F'};
    } else if (medicamento.nombre == 'Hidrocortisona IV') {
      dosisMg = (peso * 4);
    } else if (medicamento.nombre == 'Volumen de SF') {
      dosisMl = (peso * 0.5 * 1000) / 40;
    } else if (medicamento.nombre == 'Metilprednisolona') {
      dosisMg = (peso * 2);
    } else if (medicamento.nombre == 'Naloxona') {
      dosisMl = (peso * 0.01) / 0.4;
      mlDecimalPlaces = 2;
    } else if (medicamento.nombre == 'Flumazenil') {
      dosisMl = (peso * 0.01) / 0.1;
    } else if (medicamento.nombre == 'Adrenalina Nebulizada') {
      dosisMl = (peso * 0.5);
    } else if (medicamento.nombre == 'Budesonida nebulizada') {
      dosisMl = 4;
    } else if (medicamento.nombre == 'Adrenalina IM') {
      dosisMl = peso * 0.01;
      mlDecimalPlaces = 2;
    } else if (medicamento.nombre == 'Flujo') {
      if (peso <= 10) {
        final double dosisLPorMin = peso * 2;
        display_string = '${dosisLPorMin.toStringAsFixed(2)} L/min';
      } else {
        final double dosisLPorMin = ((peso - 10) * 0.5) + 20;
        display_string = '${dosisLPorMin.toStringAsFixed(2)} L/min';
      }
    } else if (medicamento.nombre == 'Adrenalina IM.') {
      if (peso <= 30) {
        dosisMl = 0.15;
        mlDecimalPlaces = 2;
      } else {
        dosisMl = 0.3;
      }
    } else if (medicamento.nombre == 'Ampicilina' ||
        medicamento.nombre == 'Cefotaxima' ||
        medicamento.nombre == 'Ceftazidime') {
      dosisMg = peso * 50;
    } else if (medicamento.nombre == 'Meropenem' ||
        medicamento.nombre == 'Aciclovir') {
      dosisMg = (peso * 60) / 3;
    } else if (medicamento.nombre == 'Vancomicina') {
      dosisMg = (peso * 15);
    } else if (medicamento.nombre == 'Pipe-tazo') {
      dosisMg = (peso * 100);
    } else if (medicamento.nombre == 'Amoxacilina-clavulonato') {
      dosisMg = (peso * 90) / 2;
    } else if (medicamento.nombre == 'Amikacina') {
      dosisMg = (peso * 22.5);
    } else if (medicamento.nombre == 'Adrenalina/ Norepinefrina') {
      dosisMg = (peso * 0.3);
    } else if (medicamento.nombre == 'Dopamina/ Dobutamina') {
      dosisMg = (peso * 15);
    } else if (medicamento.nombre == 'Solución glucosada al 10%') {
      dosisMl = (peso * 5);
    } else if (medicamento.nombre == 'Cloruro de calcio 10%') {
      dosisMl = (peso * 10) / 100;
    } else if (medicamento.nombre == 'Solución glucosada al 10% +') {
      dosisMl = (peso * 5);
    } else if (medicamento.nombre == 'Solución mixta') {
      dosisMl = _calculateSolucionMixta(paciente);
    } else if (medicamento.nombre == 'Goteo') {
      final double dosisMlPorDia = _calculateSolucionMixta(paciente);
      final double dosisMlPorHora = dosisMlPorDia / 24;
      display_string =
          '${DosisCalculatorMeses.formatDosis(dosisMlPorHora)} ml/h';
    } else if (medicamento.nombre == 'Resultado') {
      final double dosisBase = _calculateSolucionMixta(paciente);
      final double porcentajeValor = porcentaje ?? 100.0;
      final double resultado = dosisBase * (porcentajeValor / 100);

      return {
        'ml': resultado,
        'display_string': '${_roundDouble(resultado, 0)} ml',
      };
    } else if (medicamento.nombre == 'Goteo.') {
      final double dosisBase = _calculateSolucionMixta(paciente);
      final double porcentajeValor = porcentaje ?? 100.0;
      final double resultadoFinal = dosisBase * (porcentajeValor / 100);
      final double goteo = resultadoFinal / 24;

      return {'ml': goteo, 'display_string': '${_roundDouble(goteo, 0)} ml/h'};
    } else if (medicamento.nombre == 'Gluconato de calcio 10%') {
      if (medicamento.categoria == 'Electrolitos' ||
          medicamento.categoria ==
              'Hipocalcemia severa, hipermagnesemia ó intoxicación con bloqueadores canales de calcio') {
        dosisMl = (peso * 50) / 100;
      } else if (medicamento.categoria == 'Calcio de mantenimiento') {
        dosisMl = (peso * 2);
      }
    } else if (medicamento.nombre == 'Bicarbonato de sodio 1M') {
      dosisMl = peso;
    } else if (medicamento.nombre == 'Salbutamol nebulizado') {
      if (peso <= 25) {
        dosisMl = 0.5;
      } else {
        dosisMl = 1.0;
      }
    } else if (medicamento.nombre == 'Clindamicina') {
      dosisMg = (peso * 40) / 3;
      mgDecimalPlaces = 0;
    } else if (medicamento.nombre == 'TET sin balón') {
      final int edadMeses = paciente.edadMeses ?? 0;
      final double edadMesesDouble = edadMeses.toDouble();

      final double valorNumerico = (edadMesesDouble / 4) + 4;
      final double tetSize = ((valorNumerico * 2).round()) / 2;

      display_string = '${tetSize.toStringAsFixed(1)} mm';
    } else if (medicamento.nombre == 'TET con balón') {
      final int edadMeses = paciente.edadMeses ?? 0;
      final double edadMesesDouble = edadMeses.toDouble();

      final double valorNumerico = (edadMesesDouble / 4) + 3.5;

      final double tetSize = ((valorNumerico * 2).round()) / 2;

      display_string = '${tetSize.toStringAsFixed(1)} mm';
    } else if (medicamento.nombre == 'Longitud inserción a comisura labial') {
      final int edadMeses = paciente.edadMeses ?? 0;
      final double edadMesesDouble = edadMeses.toDouble();

      final double longitudCm = (edadMesesDouble / 2) + 12;

      display_string = '${longitudCm.toStringAsFixed(1)} cm';
    } else if (medicamento.nombre == 'Talla de cánula según peso') {
      final String talla = _calculateTalla(peso);
      return {'display_string': talla};
    } else {
      debugPrint(
        'Advertencia: El cálculo de la dosis no esta definido para el medicamento: ${medicamento.nombre}',
      );
    }

    if (display_string.isNotEmpty) {
      return {'display_string': display_string};
    } else {
      dosisMg = _roundDouble(dosisMg, mgDecimalPlaces);
      dosisMl = _roundDouble(dosisMl, mlDecimalPlaces);
      dosisJulios = _roundDouble(dosisJulios, 2);

      return {'mg': dosisMg, 'ml': dosisMl, 'julios': dosisJulios};
    }
  }
}
