// lib/data/medicamento_data_meses.dart
import 'package:mi_app/models/medicamento.dart';

final List<Medicamento> medicamentosMeses = [
  //------ Anafilaxia ----------
  Medicamento(
    nombre: 'Adrenalina IM',
    categoria: 'Anafilaxia',
    rangoDosisOriginal: '1mg/ml (1:1000)',
    dosisActualMG: '0,01mg/kg',
    observaciones: 'Máximo 0.5ml',
  ),
  Medicamento(
    nombre: 'Adrenalina IM.',
    categoria: 'Anafilaxia',
    rangoDosisOriginal: '1mg/ml (1:1000) <= 30kg',
    observaciones: '1mg/ml (1:1000) >30kg',
  ),

  //------ Analgesia ----------
  Medicamento(
    nombre: 'Fentanilo',
    categoria: 'Analgesia',
    rangoDosisOriginal: '(50mcg/ml; 2ml)',
    dosisActualMG: '1-5 mcg/kg',
    observaciones: 'Puede duplicar la dosis.',
  ),
  Medicamento(
    nombre: 'Morfina',
    categoria: 'Analgesia',
    rangoDosisOriginal: '(15mg/ml; 1ml) (1ml + 14cc SF)',
    dosisActualMG: '0,1 mg/kg',
    observaciones: 'Puede duplicar la dosis.',
  ),
  Medicamento(
    nombre: 'Ketamina',
    categoria: 'Analgesia',
    rangoDosisOriginal: '(10mg/ml; 20ml)',
    dosisActualMG: '1-2 mg/kg',
    observaciones: 'Puede duplicar la dosis.',
  ),
  //------ Antibioticos ----------
  Medicamento(
    nombre: 'Ampicilina',
    categoria: 'Antibioticos',
    rangoDosisOriginal: '25-50mg/Kg/dosis',
    dosisActualMG: 'cada 6 h',
    observaciones: 'Máximo: 3g/dosis',
  ),
  Medicamento(
    nombre: 'Cefotaxima',
    categoria: 'Antibioticos',
    rangoDosisOriginal: '50mg/kg/dosis',
    dosisActualMG: 'cada 8 h ó cada 6 h',
    observaciones: 'Máximo: 2-4g/dosis',
  ),
  Medicamento(
    nombre: 'Ceftazidime',
    categoria: 'Antibioticos',
    rangoDosisOriginal: '50mg/kg/dosis',
    dosisActualMG: 'cada 8 h',
    observaciones: 'Máximo: 6g/d',
  ),
  Medicamento(
    nombre: 'Meropenem',
    categoria: 'Antibioticos',
    rangoDosisOriginal: '60mg/kg/día',
    dosisActualMG: 'cada 8 h',
    observaciones: 'Máximo: 1g/dosis',
  ),
  Medicamento(
    nombre: 'Vancomicina',
    categoria: 'Antibioticos',
    rangoDosisOriginal: '15mg/kg/dosis',
    dosisActualMG: 'cada 6 h',
    observaciones: 'Máximo: 500mg/dosis',
  ),
  Medicamento(
    nombre: 'Aciclovir',
    categoria: 'Antibioticos',
    rangoDosisOriginal: '60mg/kg/día',
    dosisActualMG: 'cada 8 h',
    observaciones: 'Máximo: 1 g',
  ),
  Medicamento(
    nombre: 'Pipe-tazo',
    categoria: 'Antibioticos',
    rangoDosisOriginal: '300mg/kg/día',
    dosisActualMG: 'cada 8 h',
  ),
  Medicamento(
    nombre: 'Amoxacilina-clavulonato',
    categoria: 'Antibioticos',
    rangoDosisOriginal: '90mg/kg/día',
    dosisActualMG: 'cada 12 h',
  ),
  Medicamento(
    nombre: 'Amikacina',
    categoria: 'Antibioticos',
    rangoDosisOriginal: '22,5 mg/kg/día',
    dosisActualMG: 'cada día',
  ),
  Medicamento(
    nombre: 'Clindamicina',
    categoria: 'Antibioticos',
    rangoDosisOriginal: '40mg/kg/día',
    dosisActualMG: 'cada 8 h',
  ),
  //------ ANTÍDOTOS ----------
  Medicamento(
    nombre: 'Naloxona',
    categoria: 'Antídotos',
    rangoDosisOriginal: '0,4mg/ml',
    dosisActualMG: '0,01 mg/kg',
    observaciones: 'Antídoto de opioides',
  ),
  Medicamento(
    nombre: 'Flumazenil',
    categoria: 'Antídotos',
    rangoDosisOriginal: '0,1mg/ml',
    dosisActualMG: '0,01 mg/kg',
    observaciones: 'Antídoto de benzodiacepinas',
  ),
  //------ ASMA ----------
  Medicamento(
    nombre: 'Salbutamol 1-5 años',
    categoria: 'Asma',
    observaciones: 'Máximo #6 nebulizaciones',
  ),
  Medicamento(
    nombre: 'Salbutamol > 5 años',
    categoria: 'Asma',
    observaciones: 'Máximo #6 nebulizaciones',
  ),
  Medicamento(
    nombre: 'Atrovent 2-5 años',
    categoria: 'Asma',
    observaciones: 'Máximo #3 nebulizaciones',
  ),
  Medicamento(
    nombre: 'Atrovent > 5 años',
    categoria: 'Asma',
    observaciones: 'Máximo #3 nebulizaciones',
  ),
  Medicamento(
    nombre: 'Prednisona',
    categoria: 'Asma',
    dosisActualMG: '1-2 mg/kg por 3-5 días',
    observaciones: 'Máximo 50mg',
  ),
  Medicamento(
    nombre: 'Dexametasona IV',
    categoria: 'Asma',
    rangoDosisOriginal: '(4mg/ml)',
    dosisActualMG: 'cada 6h IV por 3-5 días',
  ),
  Medicamento(
    nombre: 'Hidrocortisona IV',
    categoria: 'Asma',
    rangoDosisOriginal: '(50mg/ml; 2ml)',
    dosisActualMG:
        'Max: 100mg; (cada 6h 1er día) (cada 12h 2do día) (cada 24h 3er día)',
  ),
  Medicamento(
    nombre: 'Metilprednisolona',
    categoria: 'Asma',
    rangoDosisOriginal: '(Dosis de carga: 2mg/kg)',
    dosisActualMG:
        'Max: 60mg; Mantenimiento: 1mg/kg/dosis (c/6h 1er día); (c/12h 2do día) y (c/24h 3er día)',
  ),
  Medicamento(
    nombre: 'Sulfato de magnesio',
    categoria: 'Asma',
    rangoDosisOriginal: '(200mg/ml; 10ml)',
    dosisActualMG: 'En 100cc SF a pasar en 20min IV (Máximo 2 dosis)',
    observaciones: 'Máximo: 2g.',
  ),

  //------ Bradiarritmias ----------
  Medicamento(
    nombre: 'Adrenalina IV',
    categoria: 'Bradiarritmias',
    rangoDosisOriginal: '1mg/ml (1 ml + 9 ml SF)',
    dosisActualMG: '(1ml=0,1mg) (0,01mg/kg)',
    observaciones: 'Máximo 10 ml',
  ),
  Medicamento(
    nombre: 'Atropina',
    categoria: 'Bradiarritmias',
    rangoDosisOriginal: '0.5mg/ml (Diluir 2ml + 8cc SF)',
    dosisActualMG: '(1ml=0.1mg) (0,02mg/kg)',
  ),
  //------ Cánulas de Alto Flujo ----------
  //---------------------------------------
  Medicamento(
    nombre: 'Flujo',
    categoria: 'Cánulas de alto flujo',
    dosisActualMG: 'Modificar FiO2 para saturación mayor a 94%',
    observaciones: 'FiO2 inicia 50%',
  ),
  Medicamento(
    nombre: 'Talla de cánula según peso',
    categoria: 'Cánulas de alto flujo',
    observaciones:
        'La "X" son las tallas posibles a utilizar según el peso del paciente',
  ),
  //------ Calcio de mantenimiento ----------
  Medicamento(
    nombre: 'Gluconato de calcio 10%',
    categoria: 'Calcio de mantenimiento',
    rangoDosisOriginal: '(100mg/ml; 10ml)',
    dosisActualMG: '2-4cc/kg/d a pasar en solución de mantenimiento en 24h',
    observaciones: 'Máximo: 2g/dosis (20ml)',
  ),

  //------  Endocrino / Renal ----------
  Medicamento(
    nombre: 'Insulina simple',
    categoria: 'Endocrino / Renal',
    rangoDosisOriginal: '(100 UI/ml; 10ml) (0,5cc insulina en 50cc SF)',
    dosisActualMG: '0,05 - 0,1 UI/kg/h',
  ),
  Medicamento(
    nombre: 'Furosemida',
    categoria: 'Endocrino / Renal',
    dosisActualMG: '0,5-1 mg/kg/dosis',
  ),
  //------  ELECTROLITOS (mantener monitoreo EKG durante correcciones agudas) ----------
  Medicamento(
    nombre: 'Gluconato de calcio 10%',
    categoria: 'Electrolitos',
    subcategoria:
        '(Mantener monitoreo EKG durante correcciones agudas), hiperkalemia aguda sintomática o severa (HCO3 y calcio en vías aparte)',
    rangoDosisOriginal: '(100mg/ml; 10ml)',
    dosisActualMG: '0,5cc/kg IV STAT pasar lento vía periférica',
    observaciones: 'Máximo: 2g/dosis (20ml)',
  ),
  Medicamento(
    nombre: 'Cloruro de calcio 10%',
    categoria: 'Electrolitos',
    subcategoria:
        '(Mantener monitoreo EKG durante correcciones agudas), hiperkalemia aguda sintomática o severa (HCO3 y calcio en vías aparte)',
    rangoDosisOriginal: '(100mg/ml; 10ml)',
    dosisActualMG: '0,1 - 0,2cc/kg IV STAT pasar lento vía central',
    observaciones: 'Máximo: 1g/dosis (10ml)',
  ),
  Medicamento(
    nombre: 'Salbutamol nebulizado',
    categoria: 'Electrolitos',
    subcategoria:
        '(Mantener monitoreo EKG durante correcciones agudas), hiperkalemia aguda sintomática o severa (HCO3 y calcio en vías aparte)',
    dosisActualMG: '<25kg= 0,5ml; >25kg= 1cc',
  ),
  Medicamento(
    nombre: 'Solución glucosada al 10% +',
    categoria: 'Electrolitos',
    subcategoria:
        '(Mantener monitoreo EKG durante correcciones agudas), hiperkalemia aguda sintomática o severa (HCO3 y calcio en vías aparte)',
    dosisActualMG: '5cc/kg +',
  ),
  Medicamento(
    nombre: 'Insulina simple',
    categoria: 'Electrolitos',
    subcategoria:
        '(Mantener monitoreo EKG durante correcciones agudas), hiperkalemia aguda sintomática o severa (HCO3 y calcio en vías aparte)',
    dosisActualMG: '0,1U/kg pasar IV en 1h junto con glucosado al 10%',
    rangoDosisOriginal: '(100 UI/ml; 10ml) (0,5cc insulina en 50cc SF)',
  ),
  Medicamento(
    nombre: 'Bicarbonato de sodio 1M',
    categoria: 'Electrolitos',
    subcategoria:
        '(Mantener monitoreo EKG durante correcciones agudas), hiperkalemia aguda sintomática o severa (HCO3 y calcio en vías aparte)',
    dosisActualMG:
        'Diluir con SF: vía central (1 HCO3 : 1 SF); vía periférica: (1 HCO3 : 6 SF)',
    rangoDosisOriginal: '(1meq/ml)',
  ),
  //------ Fiebre/Dolor ----------
  Medicamento(
    nombre: 'Paracetamol oral IV',
    categoria: 'Fiebre/Dolor',
    dosisActualMG: '15mg / kg / dosis cada 6h',
  ),
  Medicamento(
    nombre: 'Metamizol IV',
    categoria: 'Fiebre/Dolor',
    dosisActualMG: '15mg / kg / dosis cada 8h',
    observaciones: 'Max: 1g por dosis / 4 g por día',
  ),
  //------ Hemorragia severa incontrolable ----------
  Medicamento(
    nombre: 'Ácido tranexámico',
    categoria: 'Hemorragia severa incontrolable',
    rangoDosisOriginal: '100mg/ml',
    dosisActualMG: '15mg/kg',
    observaciones: 'Fluidos tibios',
  ),
  Medicamento(
    nombre: 'GRE/PFC',
    categoria: 'Hemorragia severa incontrolable',
    rangoDosisOriginal: '(dilución 1:1)',
    dosisActualMG: '5ml/kg',
    observaciones: 'Fluidos tibios',
  ),
  Medicamento(
    nombre: 'Plaquetas',
    categoria: 'Hemorragia severa incontrolable',
    dosisActualMG: '10-15ml/kg',
    observaciones: 'Fluidos tibios',
  ),
  Medicamento(
    nombre: 'Crioprecipitados',
    categoria: 'Hemorragia severa incontrolable',
    dosisActualMG: '10ml/kg',
    observaciones: 'Fluidos tibios',
  ),
  //------ Hipertensión intracraneal ----------
  Medicamento(
    nombre: 'Solución hipertónica 3%',
    categoria: 'Hipertensión intracraneal',
    rangoDosisOriginal: '(30ml NaCl4M + 70ml SF)',
    dosisActualMG: '2-5ml/kg a pasar en 10min',
    observaciones: 'Vigilar aumento de FC',
  ),
  Medicamento(
    nombre: 'Manitol',
    categoria: 'Hipertensión intracraneal',
    rangoDosisOriginal: '20g/100ml',
    dosisActualMG: '0,5-1g/kg a pasar en 10min',
    observaciones: 'Vigilar aumento de FC',
  ),
  //------ Hipocalcemia severa, hipermagnesemia ó intoxicación con bloqueadores canales de calcio ----------
  Medicamento(
    nombre: 'Gluconato de calcio 10%',
    categoria:
        'Hipocalcemia severa, hipermagnesemia ó intoxicación con bloqueadores canales de calcio',
    rangoDosisOriginal: '(100mg/ml; 10ml)',
    dosisActualMG: '0,5cc/kg IV STAT pasar lento vía periférica',
    observaciones: 'Máximo: 2g/dosis (20ml)',
  ),
  Medicamento(
    nombre: 'Cloruro de calcio 10%',
    categoria:
        'Hipocalcemia severa, hipermagnesemia ó intoxicación con bloqueadores canales de calcio',
    rangoDosisOriginal: '(100mg/ml; 10ml)',
    dosisActualMG: '0,1 - 0,2cc/kg IV STAT pasar lento vía central',
    observaciones: 'Máximo: 1g/dosis (10ml)',
  ),

  //------ Hiponatremia aguda sintomática (convulsiones) ----------
  Medicamento(
    nombre: 'Solución hipertónica 3%',
    categoria: 'Hiponatremia aguda sintomática (convulsiones)',
    subcategoria: '(convulsiones)',
    rangoDosisOriginal: '(30ml NaCl4M + 70ml SF)',
    dosisActualMG: '4ml/kg a pasar en 20min',
    observaciones: 'Vigilar cese de convulsión',
  ),

  //------ Hipoglicemia (Glicemia < 60mg/dl) ----------
  Medicamento(
    nombre: 'Solución glucosada al 10%',
    categoria: 'Hipoglicemia',
    subcategoria: '(Glicemia < 60mg/dl)',
    dosisActualMG: '0.5-1g/kg/dosis = 5-10cc/kg/dosis IV STAT',
    observaciones: 'Control de GMM en 1min',
  ),
  //------ INFUSIONES ----------
  Medicamento(
    nombre: 'Morfina',
    categoria: 'Infusiones sedación',
    subcategoria:
        'Toda infusión de diluye en 50cc SG5% y se pasa inicialmente a 1cc/h',
    rangoDosisOriginal: '(15mg/ml; 1ml)',
    Infusion: '1mg/kg en 50cc SG5% a 1cc/h (máximo 2cc/h)',
    dosisActualMG: '20mcg/kg/h',
  ),
  Medicamento(
    nombre: 'Midazolam',
    categoria: 'Infusiones sedación',
    subcategoria:
        'Toda infusión de diluye en 50cc SG5% y se pasa inicialmente a 1cc/h',
    rangoDosisOriginal: '(5mg/ml; 3ml)',
    Infusion: '6mg/kg en 50cc SG5% a 1cc/h (máximo 2cc/h)',
    dosisActualMG: '2mcg/kg/min',
  ),
  Medicamento(
    nombre: 'Fentanilo',
    categoria: 'Infusiones sedación',
    subcategoria:
        'Toda infusión de diluye en 50cc SG5% y se pasa inicialmente a 1cc/h',
    rangoDosisOriginal: '(50mcg/ml; 2ml)',
    Infusion: '250µg/kg en 50cc SG5% a 1cc/h (máximo 2cc/h)',
    dosisActualMG: '5mcg/kg/h',
  ),
  //------  Inotrópicos ----------
  Medicamento(
    nombre: 'Adrenalina/ Norepinefrina',
    categoria: 'Inotrópicos',
    subcategoria:
        '(Se prefieren por vía central pero pueden pasarse por vía periférica o intraósea)',
    dosisActualMG: '0.3mg/kg en 50cc SG5% iniciar a 1cc/h hasta 5cc/h',
    observaciones: '0,1mcg/kg/min',
  ),
  Medicamento(
    nombre: 'Dopamina/ Dobutamina',
    categoria: 'Inotrópicos',
    subcategoria:
        '(Se prefieren por vía central pero pueden pasarse por vía periférica o intraósea)',
    dosisActualMG: '15mg/kg en 50cc SG5% iniciar a 1cc/h hasta 4cc/h',
    observaciones: '5mcg/kg/min',
  ),

  //------ Líquids IV ----------
  Medicamento(
    nombre: 'Solución mixta',
    categoria: 'Líquids IV',
    rangoDosisOriginal: '(Requerimientos al 100%)',
    dosisActualMG: 'pasar en Bomba de Infusión continua en 24h IV',
  ),
  Medicamento(
    nombre: 'Goteo',
    categoria: 'Líquids IV',
    observaciones: 'Requerimientos diarios',
  ),

  Medicamento(
    nombre: 'Resultado',
    categoria: 'Líquids IV',
    dosisActualMG: 'Restar medicamentos',
  ),
  Medicamento(
    nombre: 'Goteo.',
    categoria: 'Líquids IV',
    dosisActualMG: 'Restar infusiones',
    observaciones: 'Cálculo de líquidos por porcentaje',
  ),

  //------ Medicación específica según patología respiratoria ----------
  Medicamento(
    nombre: 'Dexametasona IV',
    categoria: 'Medicación específica según patología respiratoria',
    subcategoria: 'CROUP',
    rangoDosisOriginal: '(4mg/ml)',
    dosisActualMG: '0,6 mg/kg dosis única',
  ),
  Medicamento(
    nombre: 'Adrenalina Nebulizada',
    categoria: 'Medicación específica según patología respiratoria',
    subcategoria: 'CROUP',
    rangoDosisOriginal: '(L-adrenalina 1:1000)',
    dosisActualMG: '0,5 mg/kg (Diluir 1:1 con Solución Fisológica)',
    observaciones: 'Máximo 5ml',
  ),
  Medicamento(
    nombre: 'Budesonida nebulizada',
    categoria: 'Medicación específica según patología respiratoria',
    subcategoria: 'CROUP',
    rangoDosisOriginal: '(0,5mg/ml; 2ml)',
  ),

  //------ Parálisis muscular ----------
  Medicamento(
    nombre: 'Succinilcolina',
    categoria: 'Parálisis muscular',
    rangoDosisOriginal: '(50mg/ml; 10ml) (1ml + 5cc SF)',
    dosisActualMG: '1-2 mg/kg',
    observaciones: 'Efecto de minutos.',
  ),
  Medicamento(
    nombre: 'Pancuronio',
    categoria: 'Parálisis muscular',
    rangoDosisOriginal: '(2mg/ml)',
    dosisActualMG: '0,1 mg/kg',
    observaciones: 'Efecto por 40min.',
  ),
  Medicamento(
    nombre: 'Rocuronio',
    categoria: 'Parálisis muscular',
    rangoDosisOriginal: '(10mg/ml)',
    dosisActualMG: '1 mg/kg',
    observaciones: 'Efecto por 30min.',
  ),
  Medicamento(
    nombre: 'Atracurio',
    categoria: 'Parálisis muscular',
    rangoDosisOriginal: '(10mg/ml)',
    dosisActualMG: '0,4 mg/kg',
    observaciones: 'Efecto por 20min.',
  ),
  Medicamento(
    nombre: 'TET sin balón',
    categoria: 'Parálisis muscular',
    dosisActualMG: 'Tener disponible el TET 0.5mm menor y mayor',
  ),
  Medicamento(
    nombre: 'TET con balón',
    categoria: 'Parálisis muscular',
    dosisActualMG: 'Tener disponible el TET 0.5mm menor y mayor',
  ),
  Medicamento(
    nombre: 'Longitud inserción a comisura labial',
    categoria: 'Parálisis muscular',
    dosisActualMG: 'También usar TET x 3',
  ),
  //----- Paro cardiaco --------
  Medicamento(
    nombre: 'Adrenalina IV',
    categoria: 'Paro cardíaco',
    dosisActualMG: '(1ml=0,1mg) (0,01mg/kg)',
    rangoDosisOriginal: '1mg/ml (1 ml + 9 ml SF)',
    observaciones: 'Máximo 10ml',
  ),
  Medicamento(
    nombre: 'Adrenalina ET',
    categoria: 'Paro cardíaco',
    dosisActualMG: '(1ml=0,1mg) (0,1mg/kg)',
    rangoDosisOriginal: '1mg/ml (1 ml + 9 ml SF)',
    observaciones: 'Máximo 10ml',
  ),
  Medicamento(
    nombre: 'Primera descarga eléctrica',
    categoria: 'Paro cardíaco',
    dosisActualMG: '2J/kg',
    observaciones: 'Aumentar el doble cada descarga',
  ),
  Medicamento(
    nombre: 'Segunda descarga eléctrica',
    categoria: 'Paro cardíaco',
    dosisActualMG: '2J/kg',
    observaciones: 'Máximo 10J/kg',
  ),
  Medicamento(
    nombre: 'Amiodarona',
    categoria: 'Paro cardíaco',
    rangoDosisOriginal: '(50mg/ml; 3ml) (3ml + 22ml SG5%)',
    dosisActualMG: '5mg/kg',
    observaciones: 'Máximo 300mg',
  ),
  Medicamento(
    nombre: 'Sulfato de magnesio',
    categoria: 'Paro cardíaco',
    rangoDosisOriginal: '(200mg/ml; 10ml)',
    dosisActualMG: '50mg/kg; Llevar a 5ml con SF y pasar en 3-5 min',
    observaciones: 'Máximo 2 gramos',
  ),
  Medicamento(
    nombre: 'Bicarbonato de sodio 1M',
    categoria: 'Paro cardíaco',
    rangoDosisOriginal: '(Diluir 1:1 con SF)',
    dosisActualMG: '(1mEq/kg)',
  ),
  //------ Taquicardia Supraventricular ----------
  Medicamento(
    nombre: 'Adenosina primera',
    categoria: 'Taquicardia supraventricular',
    rangoDosisOriginal: '3mg/ml Primera Dosis',
    dosisActualMG: '0,1 mg/kg',
    observaciones: 'Máximo 2 ml',
  ),
  Medicamento(
    nombre: 'Adenosina segunda',
    categoria: 'Taquicardia supraventricular',
    rangoDosisOriginal: '3mg/ml Segunda Dosis',
    dosisActualMG: '0,2 mg/kg',
    observaciones: 'Máximo 4 ml',
  ),
  Medicamento(
    nombre: 'Adenosina tercera',
    categoria: 'Taquicardia supraventricular',
    rangoDosisOriginal: '3mg/ml Tercera Dosis',
    dosisActualMG: '0,3 mg/kg',
    observaciones: 'Máximo 4 ml',
  ),
  Medicamento(
    nombre: 'Amiodarona',
    categoria: 'Taquicardia supraventricular',
    rangoDosisOriginal: '(50mg/ml; 3ml) (3ml + 22ml SG5%)',
    dosisActualMG: '5mg/kg pasar en 30min-1h',
    observaciones: 'Máximo 300 mg',
  ),

  //------ Reposición de HCO3 (pH < 7,2; HCO3 < 8); Nunca mezclar con Calcio ----------
  Medicamento(
    nombre: 'HCO3 del paciente',
    categoria: 'Reposición de HCO3',
    subcategoria: '(pH < 7,2; HCO3 < 8); Nunca mezclar con aalcio',
    observaciones: 'Control de Na y gases al finalizar',
  ),
  Medicamento(
    nombre: 'Déficit de HCO3',
    categoria: 'Reposición de HCO3',
    subcategoria: '(pH < 7,2; HCO3 < 8); Nunca mezclar con aalcio',
    dosisActualMG: 'de Bicarbonato de Sodio al 1M (1mEq/mL)',
  ),
  Medicamento(
    nombre: 'Volumen de SG5%',
    categoria: 'Reposición de HCO3',
    subcategoria: '(pH < 7,2; HCO3 < 8); Nunca mezclar con aalcio',
    rangoDosisOriginal: 'a diluir déficit de HCO3',
    dosisActualMG: 'Pasar en 3h',
  ),
  Medicamento(
    nombre: 'Velocidad de infusión a pasar en 3h',
    categoria: 'Reposición de HCO3',
    subcategoria: '(pH < 7,2; HCO3 < 8); Nunca mezclar con calcio',
    rangoDosisOriginal: 'a diluir déficit de HCO3',
    dosisActualMG: 'Pasar en 3h',
  ),

  //------ Reposición de K (K < 2,5mEq/L) ----------
  Medicamento(
    nombre: 'Volumen de SF',
    categoria: 'Reposición de K',
    subcategoria: '(K < 2,5mEq/L)',
    rangoDosisOriginal: '500cc + 10cc KCL2M',
    dosisActualMG: 'Pasar en 2h por vía periférica',
    observaciones: 'Control de K al finalizar',
  ),
  //------ Reposición de Sodio (Na < 130mEq/L) ----------
  // Medicamento(
  //   nombre: 'Sodio del paciente',
  //   categoria: 'Reposición de sodio',
  //   subcategoria: '(Na < 130mEq/L)',
  //   observaciones: 'Control de Na y Osm al finalizar',
  // ),
  // Medicamento(
  //   nombre: 'Déficit de sodio',
  //   categoria: 'Reposición de sodio',
  //   subcategoria: '(Na < 130mEq/L)',
  //   dosisActualMG: 'de NaCl4M (4mEq/mL)',
  // ),
  // Medicamento(
  //   nombre: 'Volumen de SG5%',
  //   categoria: 'Reposición de sodio',
  //   subcategoria: '(Na < 130mEq/L)',
  //   dosisActualMG: 'Pasar en 3h',
  // ),
  // Medicamento(
  //   nombre: 'Velocidad de infusión a pasar en 3h',
  //   categoria: 'Reposición de sodio',
  //   subcategoria: '(Na < 130mEq/L)',
  //   dosisActualMG: 'Pasar en 3h',
  // ),
  // Medicamento(
  //   nombre: 'Con SF',
  //   categoria: 'Reposición de sodio',
  //   subcategoria: '(Na < 130mEq/L)',
  //   dosisActualMG: 'Pasar en 3h',
  // ),
  //------ Secuencia Rápida de Intubación ----------
  Medicamento(
    nombre: 'Midazolam',
    categoria: 'Secuencia rápida de intubación',
    subcategoria: 'Sedación y amnesia',
    rangoDosisOriginal: '(5mg/ml; 3ml)',
    dosisActualMG: '0,3mg/kg',
  ),
  //------ Shock ----------
  Medicamento(
    nombre: 'Solución Fisiológica',
    categoria: 'Shock',
    rangoDosisOriginal: '0.9% (Bolo a 10cc/kg)',
    dosisActualMG: '10-20cc/kg cada 5min. Máximo 60cc/kg.',
    observaciones: 'Considerar inotrópicos',
  ),
  //------ Status convulsivo ----------
  Medicamento(
    nombre: 'Diazepam IV',
    categoria: 'Status convulsivo',
    rangoDosisOriginal: '(5mg/ml; 2ml)',
    dosisActualMG: '0,3mg/kg cada 5min #3 dosis',
    observaciones: 'Máximo 2ml',
  ),
  Medicamento(
    nombre: 'Diazepam VR',
    categoria: 'Status convulsivo',
    rangoDosisOriginal: '(5mg/ml; 2ml)',
    dosisActualMG: '0,5mg/kg; Introducir Angiocath rectal 5cm',
    observaciones: 'Máximo 2ml',
  ),
  Medicamento(
    nombre: 'Midazolam IV o IM',
    categoria: 'Status convulsivo',
    rangoDosisOriginal: '(5mg/ml; 3ml)',
    dosisActualMG: '0,3mg/kg cada 5min #3 dosis',
    observaciones: 'Máximo 2ml',
  ),
  Medicamento(
    nombre: 'Midazolam IN',
    categoria: 'Status convulsivo',
    rangoDosisOriginal: '(5mg/ml; 3ml)',
    dosisActualMG: '0,4mg/kg cada 5min #3 dosis. Utilizar atomizador nasal',
    observaciones: 'Máximo 2ml',
  ),
  Medicamento(
    nombre: 'Fenitoína IV',
    categoria: 'Status convulsivo',
    rangoDosisOriginal: '(50mg/ml; 5ml)',
    dosisActualMG: '20mg/kg; Diluir en 10x el volumen de SF y pasar en 30min',
    observaciones: 'Diluir en SF, nunca en glucosado',
  ),
  Medicamento(
    nombre: 'Fenobarbital IV',
    categoria: 'Status convulsivo',
    rangoDosisOriginal: '(50mg/ml; 1ml)',
    dosisActualMG:
        '20mg/kg; Diluir en 10x el volumen de Agua Estéril y pasar en 15min',
    observaciones: 'Diluir en agua, nunca en glucosado',
  ),

  //------ Vías centrales y drenajes pleurales ----------
  Medicamento(
    nombre: 'Catéter femoral:',
    categoria: 'Vías centrales y drenajes pleurales',
    dosisActualMG: 'Profundidad de colocación',
    observaciones: '13 a 30 cm',
  ),
  Medicamento(
    nombre: 'Catéter yugular:',
    categoria: 'Vías centrales y drenajes pleurales',
    dosisActualMG: 'Profundidad de colocación',
    observaciones: '5 a 8 cm',
  ),
  Medicamento(
    nombre: 'Catéter para drenaje pleural:',
    categoria: 'Vías centrales y drenajes pleurales',
    dosisActualMG: 'Pre-escolar 8-20F',
    observaciones: 'Adolescente 14-36F',
  ),
];
