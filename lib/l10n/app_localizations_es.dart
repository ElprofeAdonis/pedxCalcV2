// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get termsTitle => 'Instrucciones y Términos';

  @override
  String get menuAbout => 'Acerca de';

  @override
  String get menuLanguage => 'Idiomas';

  @override
  String get languageTitle => 'Seleccionar idioma';

  @override
  String get languageSpanish => 'Español';

  @override
  String get languageEnglish => 'English';

  @override
  String get quickSummaryTitle => 'Resumen rápido:';

  @override
  String get quickSummaryBody =>
      '• Se recomienda poner el peso si está disponible.\n• Si se desconoce el peso Pedx estima el peso según la edad de forma automática.\n• Verifica siempre las dosis con protocolo/guía local antes de administrar.\n• Estos cálculos son aplicables para la población de 1 mes a 18 años.';

  @override
  String get termsAccept => 'He leído y acepto los términos y condiciones.';

  @override
  String get btnContinue => 'Continuar';

  @override
  String get accordion1Title => '1. Contenido de la aplicación';

  @override
  String get accordion1Body =>
      'La siguiente tabla contiene información sobre medicación de más frecuente uso en emergencias.';

  @override
  String get accordion3Title => '2. Determinación de Peso/Edad';

  @override
  String get accordion3Body =>
      'Ingresa el peso en kilogramos cuando esté disponible (recomendado). Si no conoces el peso, ingresa la edad (años o meses según corresponda) y la app calculará un peso estimado automáticamente para realizar los cálculos. La pantalla mostrará si se usará “Peso real ✅” o “Estimado ⚠️”.';

  @override
  String get accordion4Title => '8. Volumen de las soluciones de mantenimiento';

  @override
  String get accordion4Body =>
      'En el cálculo del volumen de las soluciones de mantenimiento se puede variar el porcentaje de requerimientos al cual se desea la solución.';

  @override
  String get accordion5Title => '3. Cálculos automáticos';

  @override
  String get accordion5Body =>
      '• Todas las dosis se calculan automáticamente con el peso real o el peso estimado (si aplica), además de otras variables clínicas según el medicamento.\n• Cuando una dosis tiene rango, la app muestra un valor sugerido. Verifica el rango y la fórmula del medicamento según el protocolo local.';

  @override
  String get accordion7Title =>
      '4. Requerimientos de cálculo de dosis diferentes';

  @override
  String get accordion7Body =>
      'Cualquier ajuste de dosis necesario debe realizarse manualmente, ya que esta aplicación no admite la modificación de dosis.';

  @override
  String get accordion8Title => '5. Cálculo del tamaño del CAF (XS, S, etc.)';

  @override
  String get accordion8Body =>
      'El tamaño sugerido del CAF se calcula según el peso del paciente. Si no hay una recomendación adecuada para ese paciente.';

  @override
  String get accordion9Title => '6. Responsabilidad del Usuario';

  @override
  String get accordion9Body =>
      'EL USO DE ESTA APLICACIÓN ES RESPONSABILIDAD COMPLETA E INDIVIDUAL DE QUIEN LA UTILICE. NO EXIME EL DEBER TÉCNICO DE CORROBORAR LOS DATOS CON UN LIBRO DE TEXTO/PROTOCOLO ACTUALIZADO ANTES DE LA ADMINISTRACIÓN DE MEDICAMENTOS.';

  @override
  String get aboutTitle => 'Acerca de';

  @override
  String get aboutDevelopedBy => 'Desarrollado por';

  @override
  String get aboutPurpose => 'Propósito';

  @override
  String get aboutSupport => 'Soporte';

  @override
  String get aboutPurposeBody =>
      'Herramienta clínica para cálculos pediátricos y acceso rápido a rangos de signos vitales.';

  @override
  String get aboutSupportBody =>
      'Si necesitas soporte o deseas nuevas funciones, contacta al desarrollador.';

  @override
  String get aboutBack => 'Volver';

  @override
  String aboutCopyright(Object company, Object year) {
    return '© $year $company. Todos los derechos reservados.';
  }

  @override
  String get developedBy => 'Desarrollado por';

  @override
  String get purpose => 'Propósito';

  @override
  String get support => 'Soporte';

  @override
  String get aboutPurposeText =>
      'Herramienta clínica para cálculos pediátricos y acceso rápido a rangos de signos vitales.';

  @override
  String get aboutSupportText =>
      'Si necesitas soporte o deseas nuevas funciones, contacta al desarrollador.';

  @override
  String get back => 'Volver';

  @override
  String get rightsReserved => 'Todos los derechos reservados.';

  @override
  String get proTag => 'PRO';

  @override
  String get ageSelectTitle => 'Seleccionar tipo de edad';

  @override
  String get ageSelectQuestion => '¿Cual es el rango de edad del paciente?';

  @override
  String get ageYearsTitle => 'Mayor a 1 año';

  @override
  String get ageYearsSubtitle =>
      'Edad en años para pacientes de 1 hasta 14 años';

  @override
  String get ageSelectNote =>
      'Sino tienes el peso se puede estimar usando solo la edad.';

  @override
  String get commonBadge => 'Más común';

  @override
  String get ageMonthsTitle => 'Menor a 1 año';

  @override
  String get ageMonthsSubtitle =>
      'Edad en meses para lactantes de 1 a 11 meses';

  @override
  String get ageSelectSubtitle =>
      'Selecciona la opción según la forma en que tengas el dato del paciente.';

  @override
  String get patientAppBarTitleYears => 'Datos del Paciente (Años)';

  @override
  String get patientHeaderTitle => 'Ingrese los datos del paciente';

  @override
  String get patientHowItWorks => 'Cómo funciona:';

  @override
  String get patientHowItWorksBody =>
      '• Si ingresas Peso, calculamos con ese peso.\n• Si no tienes peso, ingresa Edad (1–14) y usamos un peso estimado.\n• Confirma TAN PRONTO sea posible el peso real del paciente.';

  @override
  String get patientWeightLabel => 'Peso actual/ medido (kg)';

  @override
  String get patientWeightHint => 'Ej: 22.6';

  @override
  String get patientAgeYearsLabel => 'Edad (Años - 1 a 14 años)';

  @override
  String get patientAgeYearsHint => 'Ej: 4';

  @override
  String get patientAgeMonthsLabel => 'Edad (Meses - de 1 a 11 meses)';

  @override
  String get patientAgeMonthsHint => 'Ej: 6';

  @override
  String get patientEstimatedWeightLabel => 'Peso estimado según edad:';

  @override
  String get patientChipRealWeight => 'Peso real ✅';

  @override
  String get patientChipEstimated => 'Estimado ⚠️';

  @override
  String get patientBtnWithEnteredWeight => 'Calcular con peso ingresado';

  @override
  String get patientBtnWithEstimatedWeight => 'Calcular con peso estimado';

  @override
  String get patientBtnCalculateDose => 'Calcular Dosis';

  @override
  String get patientValWeightOrValidAgeToEstimate =>
      'Ingrese el peso o una edad válida en años para estimarlo.';

  @override
  String get patientValInvalidNumber => 'Entrada inválida. Ingrese un número.';

  @override
  String get patientValEnterAgeYears => 'Por favor, ingrese edad en años.';

  @override
  String get patientValAgeRangeYears => 'La edad debe ser entre 1 y 14 años.';

  @override
  String get patientValAgeMonthsRange =>
      'La edad en meses debe ser entre 1 y 11.';

  @override
  String get patientSnackNeedWeightOrAge =>
      'Por favor, ingresa el peso del paciente O la edad en años (para cálculo estimado).';

  @override
  String get patientSnackNeedWeightAndAge =>
      'Por favor, ingresa un peso y al menos la edad en años o meses.';

  @override
  String get medsTitleYears => 'Medicamentos (1 - 14 años)';

  @override
  String get medsSubtitleViewDetails => 'Ver detalles';

  @override
  String get medsChipEstimated => 'Estimado ⚠️';

  @override
  String get medsChipRealWeight => 'Peso real ✅';

  @override
  String get medsBtnChange => 'Cambiar';

  @override
  String get medsSearchHint => 'Buscar medicamento...';

  @override
  String get medsAlphaAll => 'TODAS';

  @override
  String get medsAlphaFavs => 'Favoritos';

  @override
  String get medsSpecialCalculations => 'Cálculos especiales';

  @override
  String get medsModalClose => 'Cerrar';

  @override
  String get medsVitalsTitle => 'Signos Vitales (SING V)';

  @override
  String get medsPamTitle => 'Presión Arterial Media (PAM)';

  @override
  String get medsOptionHeartRate => 'Frecuencia Cardíaca';

  @override
  String get medsOptionRespRate => 'Frecuencia Respiratoria';

  @override
  String get medsOptionBloodPressure => 'Presión Arterial';

  @override
  String get medsOptionTemperature => 'Temperatura';

  @override
  String get medsOptionOxygenSat => 'Saturación de Oxígeno';

  @override
  String get medsOptionBloodPressureWomen => 'Presión Arterial Mujeres';

  @override
  String get medsOptionBloodPressureMen => 'Presión Arterial Hombres';

  @override
  String get medsPrintTooltip => 'Imprimir todos los medicamentos calculados';

  @override
  String get medsBottomSINGV => 'SING V';

  @override
  String get medsBottomPAM => 'PAM';

  @override
  String patientHeaderSummaryYears(Object age, Object weight) {
    return '$weight kg · $age años';
  }

  @override
  String get medDetailPrintTooltip => 'Imprimir Reporte';

  @override
  String get medDetailInfoTitle => 'Información del Medicamento';

  @override
  String get medDetailDoseTitle => 'Dosis calculada para el paciente';

  @override
  String get medDetailCategory => 'Categoría:';

  @override
  String get medDetailSubcategory => 'Subcategoría:';

  @override
  String get medDetailOriginalDoseRange => 'Rango dosis original:';

  @override
  String get medDetailPediatricDose => 'Dosis pediátrica:';

  @override
  String get medDetailNotes => 'Observaciones:';

  @override
  String get medDetailCopy => 'Copiar';

  @override
  String medDetailCopied(Object text) {
    return '\"$text\" copiado';
  }

  @override
  String get commonNA => 'N/A';

  @override
  String get commonDash => '—';

  @override
  String get printPatientReportTitle => 'Reporte de Paciente';

  @override
  String get printAppSubtitle => 'Pedx Calc · Cálculos';

  @override
  String get printGeneratedBy => 'Generado por Pedx Calc';

  @override
  String get printDateLabel => 'Fecha';

  @override
  String get printPageLabel => 'Página';

  @override
  String get printPatientDataTitle => 'Datos del Paciente';

  @override
  String get printWeightLabel => 'Peso';

  @override
  String get printAgeLabel => 'Edad';

  @override
  String get printYearsUnit => 'años';

  @override
  String get printMonthsUnit => 'meses';

  @override
  String get printMedsCalculatedTitle => 'Medicamentos calculados';

  @override
  String get printTableHeaderMedication => 'Medicamento';

  @override
  String get printTableHeaderDose => 'Dosis calculada';

  @override
  String get printTableHeaderNotes => 'Observaciones';

  @override
  String printPreviewError(Object error) {
    return 'Error al generar PDF: $error';
  }

  @override
  String get specialCalcTitle => 'Cálculos especiales jóvenes';

  @override
  String get specialCalcResetTooltip => 'Restaurar valores';

  @override
  String get specialCalcPrintTooltip => 'Imprimir reporte completo';

  @override
  String specialCalcPatientHeader(Object weight, Object age, Object ageUnit) {
    return 'Paciente: $weight kg · $age $ageUnit';
  }

  @override
  String get specialCalcYearsUnit => 'años';

  @override
  String get specialCalcMonthsUnit => 'meses';

  @override
  String get specialCalcInputPercentTitle => 'Cálculo por porcentaje';

  @override
  String get specialCalcInputPercentHint => '100';

  @override
  String get specialCalcInputPercentHelper =>
      'Ajusta el % de líquidos (ej: 80, 60, 45…).';

  @override
  String get specialCalcInputSodiumTitle => 'Sodio del paciente (Na)';

  @override
  String get specialCalcInputSodiumHint => '120';

  @override
  String get specialCalcInputSodiumHelper => 'Ingresa Na actual (mEq/L).';

  @override
  String get specialCalcInputHco3Title => 'Reposición HCO3';

  @override
  String get specialCalcInputHco3Hint => '7';

  @override
  String get specialCalcInputHco3Helper => 'Ingresa HCO3 actual (mEq/L).';

  @override
  String get specialCalcSectionLiquids => 'Líquidos endovenosos';

  @override
  String get specialCalcSectionSodium => 'Reposición de sodio';

  @override
  String get specialCalcSectionHco3 => 'Reposición HCO3';

  @override
  String get specialCalcTotalLabel => 'Resultado (total final)';

  @override
  String get specialCalcPercentInfoFallback =>
      'Puedes ajustar el porcentaje según la condición del paciente.';

  @override
  String get patientMonthsAppBarTitle => 'Datos del Paciente (Meses)';

  @override
  String get patientMonthsCardTitle => 'Ingrese los datos (1–11 meses)';

  @override
  String get howItWorksTitle => 'Cómo funciona:';

  @override
  String get howItWorksMonthsBody =>
      '• Si ingresas Peso, calculamos con ese peso.\n• Si no tienes peso, ingresa Edad (1–11 meses) y usamos un peso estimado.\n• Confirma TAN PRONTO sea posible el peso real del paciente.';

  @override
  String get patientWeightHintMonths => 'Ej: 7.5';

  @override
  String get patientMonthsValidatorEmpty =>
      'Por favor, ingresa la edad en meses.';

  @override
  String get patientMonthsValidatorRange =>
      'La edad debe ser entre 1 y 11 meses.';

  @override
  String get estimatedWeightByAge => 'Peso estimado según edad: ';

  @override
  String get snackNeedWeightOrValidAgeMonths =>
      'Por favor, ingresa un peso válido o una edad válida (1–11 meses) para estimarlo.';

  @override
  String get btnCalcWithEnteredWeight => 'Calcular con peso ingresado';

  @override
  String get btnCalcWithEstimatedWeight => 'Calcular con peso estimado';

  @override
  String get btnCalcDose => 'Calcular dosis';

  @override
  String get chipRealWeight => 'Peso real ✅';

  @override
  String get chipEstimated => 'Estimado ⚠️';

  @override
  String get navPatient => 'Paciente';

  @override
  String get navInstructions => 'Instrucciones';

  @override
  String get medsMonthsAppBarTitle => 'Medicamentos (1 - 11 meses)';

  @override
  String get searchMedicationHint => 'Buscar medicamento...';

  @override
  String get viewDetails => 'Ver detalles';

  @override
  String get btnChange => 'Cambiar';

  @override
  String get filterAll => 'TODAS';

  @override
  String get filterFavorites => 'Favoritos';

  @override
  String get specialCalculations => 'Cálculos especiales';

  @override
  String get modalClose => 'Cerrar';

  @override
  String get modalVitalsTitle => 'Signos Vitales (SING V)';

  @override
  String get modalPamTitle => 'Presión Arterial Media (PAM)';

  @override
  String get vitalHeartRate => 'Frecuencia Cardíaca';

  @override
  String get vitalRespRate => 'Frecuencia Respiratoria';

  @override
  String get vitalBloodPressure => 'Presión Arterial';

  @override
  String get vitalTemperature => 'Temperatura';

  @override
  String get vitalOxygenSat => 'Saturación de Oxígeno';

  @override
  String get vitalBloodPressureWomen => 'Presión Arterial Mujeres';

  @override
  String get vitalBloodPressureMen => 'Presión Arterial Hombres';

  @override
  String get printFullReport => 'Imprimir reporte completo';

  @override
  String get patientHeaderMonthsUnit => 'meses';

  @override
  String get specialCalcMonthsTitle => 'Cálculos especiales (1 - 11 meses)';

  @override
  String get restoreValues => 'Restaurar valores';

  @override
  String get patientHeaderPrefix => 'Paciente';

  @override
  String get inputLiquidsPercentTitle =>
      'Cálculo por porcentaje de líquidos IV';

  @override
  String get inputLiquidsPercentHelper =>
      'Ajusta el % según condición (ej: 80, 60, 45…).';

  @override
  String get inputHco3Title => 'Reposición HCO3';

  @override
  String get inputHco3Helper => 'Ingresa HCO3 actual.';

  @override
  String get inputSodiumTitle => 'Reposición de sodio (Na)';

  @override
  String get inputSodiumHelper => 'Ingresa Na actual.';

  @override
  String get sectionLiquidsIV => 'Líquids IV';

  @override
  String get sectionHco3 => 'Reposición de HCO3';

  @override
  String get sectionSodium => 'Reposición de sodio';

  @override
  String get resultTotalFinal => 'Resultado (total final)';

  @override
  String get printReportTooltip => 'Imprimir reporte';

  @override
  String get medInfoTitle => 'Información del medicamento';

  @override
  String get medInfoCategoryLabel => 'Categoría:';

  @override
  String get medInfoSubcategoryLabel => 'Subcategoría:';

  @override
  String get medInfoOriginalDoseRangeLabel => 'Rango dosis original:';

  @override
  String get medInfoPediatricDoseLabel => 'Dosis pediátrica:';

  @override
  String get medInfoObservationsLabel => 'Observaciones:';

  @override
  String get patientCalculatedDoseTitle => 'Dosis calculada para el paciente';

  @override
  String get copyTooltip => 'Copiar';

  @override
  String snackbarCopied(Object text) {
    return '\"$text\" copiado al portapapeles';
  }

  @override
  String get calcInfoTitle => 'Información del Cálculo';

  @override
  String get calcTypeLabel => 'Tipo:';

  @override
  String get calcMedicationLabel => 'Medicamento:';

  @override
  String get calcObservationsLabel => 'Observaciones:';

  @override
  String get notAvailable => 'N/A';

  @override
  String get bpAppBarTitle => 'Presión Arterial';

  @override
  String get bpColAge => 'Edad';

  @override
  String get bpColSystolic => 'Sistólica';

  @override
  String get bpColDiastolic => 'Diastólica';

  @override
  String get bpColHypotensionSystolic => 'Hipotensión\nsistólica';

  @override
  String get bpRowAge1to2 => '1-2 años (Niñ@ pequeñ@)';

  @override
  String get bpRowAge3to5 => '3-5 años (Preescolar)';

  @override
  String get bpRowAge6to9 => '6-9 años (Edad escolar)';

  @override
  String get bpRowAge10to11 => '10-11 años (Preadolescente)';

  @override
  String get bpRowAge12to15 => '12-15 años (Adolescente)';

  @override
  String get bpRowHypotensionFormula => '<70 + (edad × 2)';

  @override
  String get bpNoteFormula =>
      'Nota: El umbral de hipotensión sistólica para las edades preescolar se calcula: 70 + (edad en años × 2).';

  @override
  String get bpNeoAppBarTitle => 'Presión Arterial';

  @override
  String get bpNeoColAge => 'Edad';

  @override
  String get bpNeoColSystolic => 'Sistólico';

  @override
  String get bpNeoColDiastolic => 'Diastólico';

  @override
  String get bpNeoColHypotensionSystolic => 'Hipotensión\nsistólica';

  @override
  String get bpNeoRowBirth12hLt1kg => 'Nacimiento (12 h) <1 kg';

  @override
  String get bpNeoRowBirth12h3kg => 'Nacimiento (12 h) 3 kg';

  @override
  String get bpNeoRowNeonate96h => 'Neonato (96 h)';

  @override
  String get bpNeoRowInfant1to12mo => 'Infante (1–12 meses)';

  @override
  String get bpNeoNote =>
      'Nota: Rangos normales y de hipotensión por edad (mmHg).';

  @override
  String get hrAppBarTitle => 'Frecuencia Cardíaca (latidos/min)';

  @override
  String get hrColAge => 'Edad';

  @override
  String get hrColAwake => 'Despierto';

  @override
  String get hrColAsleep => 'Dormido';

  @override
  String get hrRowToddler => '1–2 años (Niñ@ pequeñ@)';

  @override
  String get hrRowPreschool => '3–5 años (Preescolar)';

  @override
  String get hrRowSchoolAge => '6–11 años (Edad escolar)';

  @override
  String get hrRowAdolescent => '12–15 años (Adolescente)';

  @override
  String get hrNote =>
      'Nota: Los rangos varían si el paciente está despierto o dormido.';

  @override
  String get hrInfantAppBarTitle => 'Frecuencia Cardíaca (latidos/min)';

  @override
  String get hrInfantRowNeonate => '(<28 días) (RN)';

  @override
  String get hrInfantRowInfant => '(1–12 meses) (Infante)';

  @override
  String get calculatedDoseTitle => 'Dosis calculada para el paciente';

  @override
  String get medCategory => 'Categoría:';

  @override
  String get medSubcategory => 'Subcategoría:';

  @override
  String get medOriginalDoseRange => 'Rango dosis original:';

  @override
  String get medPediatricDose => 'Dosis pediátrica:';

  @override
  String get medObservations => 'Observaciones:';

  @override
  String get copy => 'Copiar';

  @override
  String get printReport => 'Imprimir reporte';

  @override
  String copiedText(Object text) {
    return '\"$text\" copiado';
  }

  @override
  String get o2AppBarTitle => 'Saturación de oxígeno (SpO₂)';

  @override
  String get o2CardTitle => 'Saturación de oxígeno (SpO₂)';

  @override
  String get o2Paragraph1 => 'SpO₂ es menor en el período neonatal inmediato.';

  @override
  String get o2Paragraph2Part1 => 'Más allá de este período, una SpO₂ de ';

  @override
  String get o2ThresholdBold => '<90–92%';

  @override
  String get o2Paragraph2Part2 => ' puede sugerir una ';

  @override
  String get o2RespConditionBold => 'condición respiratoria';

  @override
  String get o2Or => ' o ';

  @override
  String get o2CyanoticHeartBold => 'cardiopatía cianótica.';

  @override
  String get o2Note =>
      'La saturación de oxígeno se considera un signo vital clave para evaluar la oxigenación.';

  @override
  String get rrAppBarTitle => 'Frecuencia Respiratoria';

  @override
  String get rrCardTitle => 'Rangos normales por edad';

  @override
  String get rrTableHeaderAge => 'Edad';

  @override
  String get rrTableHeaderNormal => 'Normal';

  @override
  String get rrAgeRow1 => '1-2 años (Niñ@ pequeñ@)';

  @override
  String get rrAgeRow2 => '3-5 años (Preescolar)';

  @override
  String get rrAgeRow3 => '6-11 años (Edad escolar)';

  @override
  String get rrAgeRow4 => '12-15 años (Adolescente)';

  @override
  String get rrSourceNote => 'Fuente: Guías de Referencia Pediátrica.';

  @override
  String get rrAppBarTitleWithUnit =>
      'Frecuencia Respiratoria (respiraciones/min)';

  @override
  String get rrAgeInfant => '(<1 año) (RN)';

  @override
  String get rrAgeToddler => '(1–2 años) (niños)';

  @override
  String get tempAppBarTitleByMethod => 'Temperatura (por método)';

  @override
  String get tempCardTitleNormalRangesByMethod => 'Rangos normales por método';

  @override
  String get tempTableHeaderMethod => 'Método';

  @override
  String get tempTableHeaderNormal => 'Normal';

  @override
  String get tempMethodRectal => 'Rectal';

  @override
  String get tempMethodTympanic => 'Timpánica';

  @override
  String get tempMethodOral => 'Oral';

  @override
  String get tempMethodAxillary => 'Axilar';

  @override
  String get tempNoteRangesDoNotVary => 'Rangos no varían con la edad.';

  @override
  String get tempGuideScreeningLabel => 'Tamizaje:';

  @override
  String get tempGuideScreeningText =>
      'axilar, temporal, timpánica (↓ precisión)';

  @override
  String get tempGuideDefinitiveLabel => 'Definitiva:';

  @override
  String get tempGuideDefinitiveText =>
      'rectal & oral (↑ reflejo de la temperatura central)';

  @override
  String get tempReferenceCps2015 =>
      'Referencia: Declaración de posición de la CPS sobre la medición de la temperatura en pediatría (2015)';

  @override
  String get tempAppBarTitleCelsiusByMethod => 'Temperatura (°C) (Por método)';

  @override
  String get tempGuideScreeningTextAlt =>
      'axilar, temporal, tímpano (↓ precisión)';

  @override
  String get tempReferenceCps2015Alt =>
      'Referencia: CPS Declaración de posición sobre la medición de la temperatura en pediatría (2015)';

  @override
  String get bpWomenTitle => 'Presión Arterial Mujeres';

  @override
  String get bpColMin => 'Mínima';

  @override
  String get bpColMean => 'Media';

  @override
  String get bpColMax => 'Máxima';

  @override
  String get bpGroupSystolicDiastolic =>
      'Presión arterial\nsistólica/diastólica';

  @override
  String get bpGroupMeanArterialPressure => 'Presión arterial\nmedia';

  @override
  String get bpAgeLt7Days => '<7 días';

  @override
  String get bpAge8to30Days => '8-30 días';

  @override
  String get bpAge1to5Months => '1-5 meses';

  @override
  String get bpAge6to11Months => '6-11 meses';

  @override
  String get bpFormulasTitle => 'Fórmulas de Presión Arterial';

  @override
  String get bpFormulaLine1 =>
      'Presión arterial media = (presión diastólica) + (presión sistólica - presión diastólica) / 3';

  @override
  String get bpFormulaLine2 => 'o PAM = PD + (PS-PD)/3';

  @override
  String get bpFormulaLine3 => 'o PAM = (PS + (2xPD)) / 3';

  @override
  String get bpAge1y => '1 año';

  @override
  String get bpAge2y => '2 años';

  @override
  String get bpAge3y => '3 años';

  @override
  String get bpAge4y => '4 años';

  @override
  String get bpAge5y => '5 años';

  @override
  String get bpAge6y => '6 años';

  @override
  String get bpAge7y => '7 años';

  @override
  String get bpAge8y => '8 años';

  @override
  String get bpAge9y => '9 años';

  @override
  String get bpAge10y => '10 años';

  @override
  String get bpAge11y => '11 años';

  @override
  String get bpAge12y => '12 años';

  @override
  String get bpAge13y => '13 años';

  @override
  String get bpAge14y => '14 años';

  @override
  String get bpAge15y => '15 años';

  @override
  String get bpAge16y => '16 años';

  @override
  String get bpAge17y => '17 años';

  @override
  String get bpAge18y => '18 años';

  @override
  String get bpAge19y => '19 años';

  @override
  String get bpMenTitle => 'Presión Arterial Hombres';

  @override
  String get bpAge8To30Days => '8-30 días';

  @override
  String get bpAge1To5Months => '1-5 meses';

  @override
  String get bpAge6To11Months => '6-11 meses';

  @override
  String get bpMenNote =>
      'Nota: no se programa el intervalo de tiempo en que se toma la presión arterial media de acuerdo con las condiciones del paciente, de 15 minutos para los casos graves a 24 horas para los estables. Cuando la presión arterial media baje por debajo del nivel mínimo, se debe iniciar la infusión de cristaloides, según el protocolo. Cuando la presión arterial media tiende a elevarse por encima de la máxima normal, hay que suspender la infusión de líquidos para evitar la sobrecarga de volumen.';

  @override
  String get bpAge1Year => '1 año';

  @override
  String get bpAge2Years => '2 años';

  @override
  String get bpAge3Years => '3 años';

  @override
  String get bpAge4Years => '4 años';

  @override
  String get bpAge5Years => '5 años';

  @override
  String get bpAge6Years => '6 años';

  @override
  String get bpAge7Years => '7 años';

  @override
  String get bpAge8Years => '8 años';

  @override
  String get bpAge9Years => '9 años';

  @override
  String get bpAge10Years => '10 años';

  @override
  String get bpAge11Years => '11 años';

  @override
  String get bpAge12Years => '12 años';

  @override
  String get bpAge13Years => '13 años';

  @override
  String get bpAge14Years => '14 años';

  @override
  String get bpAge15Years => '15 años';

  @override
  String get bpAge16Years => '16 años';

  @override
  String get bpAge17Years => '17 años';

  @override
  String get bpAge18Years => '18 años';

  @override
  String get bpAge19Years => '19 años';

  @override
  String get catAnaphylaxis => 'Anafilaxia';

  @override
  String get catAnalgesia => 'Analgesia';

  @override
  String get catAntibiotics => 'Antibióticos';

  @override
  String get medAnaEpiImStandard => 'Adrenalina IM';

  @override
  String get medAnaEpiImWeightBased => 'Adrenalina IM.';

  @override
  String get medAnalgesiaFentanyl => 'Fentanilo';

  @override
  String get medAnalgesiaMorphine => 'Morfina';

  @override
  String get medAnalgesiaKetamine => 'Ketamina';

  @override
  String get medAbxAmpicillin => 'Ampicilina';

  @override
  String get medAbxCefotaxime => 'Cefotaxima';

  @override
  String get medAbxCeftazidime => 'Ceftazidime';

  @override
  String get medAbxMeropenem => 'Meropenem';

  @override
  String get medAbxVancomycin => 'Vancomicina';

  @override
  String get medAbxAcyclovir => 'Aciclovir';

  @override
  String get medAbxPipTazo => 'Pipe-tazo';

  @override
  String get medAbxAmoxClav => 'Amoxicilina-clavulanato';

  @override
  String get medAbxAmikacin => 'Amikacina';

  @override
  String get medAbxClindamycin => 'Clindamicina';

  @override
  String get medAnaEpiImStandardRange => '1mg/ml (1:1000)';

  @override
  String get medAnaEpiImStandardDose => '0,01 mg/kg';

  @override
  String get medAnaEpiImStandardNotes => 'Máximo 0.5 ml';

  @override
  String get medAnaEpiImWeightBasedRange => '1mg/ml (1:1000) <= 30kg';

  @override
  String get medAnaEpiImWeightBasedDose => '';

  @override
  String get medAnaEpiImWeightBasedNotes => '1mg/ml (1:1000) >30kg';

  @override
  String get medAnalgesiaFentanylRange => '(50mcg/ml; 2ml)';

  @override
  String get medAnalgesiaFentanylDose => '1-5 mcg/kg';

  @override
  String get medAnalgesiaFentanylNotes => 'Puede duplicar la dosis.';

  @override
  String get medAnalgesiaMorphineRange => '(15mg/ml; 1ml) (1ml + 14cc SF)';

  @override
  String get medAnalgesiaMorphineDose => '0,1 mg/kg';

  @override
  String get medAnalgesiaMorphineNotes => 'Puede duplicar la dosis.';

  @override
  String get medAnalgesiaKetamineRange => '(10mg/ml; 20ml)';

  @override
  String get medAnalgesiaKetamineDose => '1-2 mg/kg';

  @override
  String get medAnalgesiaKetamineNotes => 'Puede duplicar la dosis.';

  @override
  String get medAbxAmpicillinRange => '25-50mg/Kg/dosis';

  @override
  String get medAbxAmpicillinDose => 'cada 6 h';

  @override
  String get medAbxAmpicillinNotes => 'Máximo: 3g/dosis';

  @override
  String get medAbxCefotaximeRange => '50mg/kg/dosis';

  @override
  String get medAbxCefotaximeDose => 'cada 8 h ó cada 6 h';

  @override
  String get medAbxCefotaximeNotes => 'Máximo: 2-4g/dosis';

  @override
  String get medAbxCeftazidimeRange => '50mg/kg/dosis';

  @override
  String get medAbxCeftazidimeDose => 'cada 8 h';

  @override
  String get medAbxCeftazidimeNotes => 'Máximo: 6g/d';

  @override
  String get medAbxMeropenemRange => '60mg/kg/día';

  @override
  String get medAbxMeropenemDose => 'cada 8 h';

  @override
  String get medAbxMeropenemNotes => 'Máximo: 1g/dosis';

  @override
  String get medAbxVancomycinRange => '15mg/kg/dosis';

  @override
  String get medAbxVancomycinDose => 'cada 6 h';

  @override
  String get medAbxVancomycinNotes => 'Máximo: 500mg/dosis';

  @override
  String get medAbxAcyclovirRange => '60mg/kg/día';

  @override
  String get medAbxAcyclovirDose => 'cada 8 h';

  @override
  String get medAbxAcyclovirNotes => 'Máximo: 1 g';

  @override
  String get medAbxPipTazoRange => '300mg/kg/día';

  @override
  String get medAbxPipTazoDose => 'cada 8 h';

  @override
  String get medAbxPipTazoNotes => '';

  @override
  String get medAbxAmoxClavRange => '90mg/kg/día';

  @override
  String get medAbxAmoxClavDose => 'cada 12 h';

  @override
  String get medAbxAmoxClavNotes => '';

  @override
  String get medAbxAmikacinRange => '22,5 mg/kg/día';

  @override
  String get medAbxAmikacinDose => 'cada día';

  @override
  String get medAbxAmikacinNotes => '';

  @override
  String get medAbxClindamycinRange => '40mg/kg/día';

  @override
  String get medAbxClindamycinDose => 'cada 8 h';

  @override
  String get medAbxClindamycinNotes => '';

  @override
  String get calcTypeSodium => 'Sodio';

  @override
  String get calcTypeHco3 => 'HCO3';

  @override
  String get calcTypeIvFluids => 'Líquidos IV';

  @override
  String get specNaPatient => 'Sodio del paciente';

  @override
  String get specNaDeficit => 'Déficit de sodio';

  @override
  String get specNaSg5Volume => 'Volumen de SG 5%';

  @override
  String get specNaWithNs => 'Con SF';

  @override
  String get specNaInfusionRate => 'Velocidad de infusión';

  @override
  String get specHco3Patient => 'HCO₃ del paciente';

  @override
  String get specHco3Deficit => 'Déficit de HCO₃';

  @override
  String get specHco3Sg5Volume =>
      'Volumen de SG 5% para diluir déficit de HCO₃';

  @override
  String get specHco3InfusionRate => 'Velocidad de infusión';

  @override
  String get specIvMixedSolution => 'Solución mixta de mantenimiento';

  @override
  String get specIvPercentInfoTitle => 'Cálculo de porcentaje';

  @override
  String get specIvResult => 'Resultado';

  @override
  String get specIvDrip => 'Goteo';

  @override
  String get specIvDripAdjusted => 'Goteo (ajustado)';

  @override
  String get bottomVitals => 'SING V';

  @override
  String get bottomPam => 'PAM';

  @override
  String get catAntidotes => 'Antídotos';

  @override
  String get catAsthma => 'Asma';

  @override
  String get catBradyarrhythmias => 'Bradiarritmias';

  @override
  String get catHighFlowNasalCannula => 'Cánulas de alto flujo';

  @override
  String get medAntidoteNaloxone => 'Naloxona';

  @override
  String get medAntidoteNaloxoneRange => '0,4 mg/ml';

  @override
  String get medAntidoteNaloxoneDose => '0,01 mg/kg';

  @override
  String get medAntidoteNaloxoneNotes => 'Antídoto de opioides';

  @override
  String get medAntidoteFlumazenil => 'Flumazenil';

  @override
  String get medAntidoteFlumazenilRange => '0,1 mg/ml';

  @override
  String get medAntidoteFlumazenilDose => '0,01 mg/kg';

  @override
  String get medAntidoteFlumazenilNotes => 'Antídoto de benzodiacepinas';

  @override
  String get medAsthmaSalbutamol1to5 => 'Salbutamol 1–5 años';

  @override
  String get medAsthmaSalbutamol1to5Notes => 'Máximo #6 nebulizaciones';

  @override
  String get medAsthmaSalbutamolOver5 => 'Salbutamol > 5 años';

  @override
  String get medAsthmaSalbutamolOver5Notes => 'Máximo #6 nebulizaciones';

  @override
  String get medAsthmaAtrovent2to5 => 'Atrovent 2–5 años';

  @override
  String get medAsthmaAtrovent2to5Notes => 'Máximo #3 nebulizaciones';

  @override
  String get medAsthmaAtroventOver5 => 'Atrovent > 5 años';

  @override
  String get medAsthmaAtroventOver5Notes => 'Máximo #3 nebulizaciones';

  @override
  String get medAsthmaPrednisone => 'Prednisona';

  @override
  String get medAsthmaPrednisoneDose => '1–2 mg/kg por 3–5 días';

  @override
  String get medAsthmaPrednisoneNotes => 'Máximo 50 mg';

  @override
  String get medAsthmaDexamethasoneIV => 'Dexametasona IV';

  @override
  String get medAsthmaDexamethasoneIVRange => '(4 mg/ml)';

  @override
  String get medAsthmaDexamethasoneIVDose => 'cada 6 h IV por 3–5 días';

  @override
  String get medAsthmaHydrocortisoneIV => 'Hidrocortisona IV';

  @override
  String get medAsthmaHydrocortisoneIVRange => '(50 mg/ml; 2 ml)';

  @override
  String get medAsthmaHydrocortisoneIVDose =>
      'Max: 100 mg; (cada 6 h 1er día) (cada 12 h 2do día) (cada 24 h 3er día)';

  @override
  String get medAsthmaMethylprednisolone => 'Metilprednisolona';

  @override
  String get medAsthmaMethylprednisoloneRange => '(Dosis de carga: 2 mg/kg)';

  @override
  String get medAsthmaMethylprednisoloneDose =>
      'Max: 60 mg; Mantenimiento: 1 mg/kg/dosis (c/6 h 1er día); (c/12 h 2do día) y (c/24 h 3er día)';

  @override
  String get medAsthmaMagnesiumSulfate => 'Sulfato de magnesio';

  @override
  String get medAsthmaMagnesiumSulfateRange => '(200 mg/ml; 10 ml)';

  @override
  String get medAsthmaMagnesiumSulfateDose =>
      'En 100 cc SF a pasar en 20 min IV (Máximo 2 dosis)';

  @override
  String get medAsthmaMagnesiumSulfateNotes => 'Máximo: 2 g.';

  @override
  String get medBradyEpinephrineIV => 'Adrenalina IV';

  @override
  String get medBradyEpinephrineIVRange => '1 mg/ml (1 ml + 9 ml SF)';

  @override
  String get medBradyEpinephrineIVDose => '(1 ml = 0,1 mg) (0,01 mg/kg)';

  @override
  String get medBradyEpinephrineIVNotes => 'Máximo 10 ml';

  @override
  String get medBradyAtropine => 'Atropina';

  @override
  String get medBradyAtropineRange => '0,5 mg/ml (Diluir 2 ml + 8 cc SF)';

  @override
  String get medBradyAtropineDose => '(1 ml = 0,1 mg) (0,02 mg/kg)';

  @override
  String get medHfncFlow => 'Flujo';

  @override
  String get medHfncFlowDose => 'Modificar FiO2 para saturación mayor a 94%';

  @override
  String get medHfncFlowNotes => 'FiO2 inicia 50%';

  @override
  String get medHfncCannulaSizeByWeight => 'Talla de cánula según peso';

  @override
  String get medHfncCannulaSizeByWeightNotes =>
      'La \"X\" son las tallas posibles a utilizar según el peso del paciente';

  @override
  String get printPageOfLabel => 'de';

  @override
  String get catCalciumMaintenance => 'Calcio de mantenimiento';

  @override
  String get catEndocrineRenal => 'Endocrino / Renal';

  @override
  String get catElectrolytes => 'Electrolitos';

  @override
  String get catFeverPain => 'Fiebre/Dolor';

  @override
  String get catUncontrolledSevereBleeding => 'Hemorragia severa incontrolable';

  @override
  String get catIntracranialHypertension => 'Hipertensión intracraneal';

  @override
  String get medCaMaintCalciumGluconate10 => 'Gluconato de calcio 10%';

  @override
  String get medCaMaintCalciumGluconate10Range => '(100mg/ml; 10ml)';

  @override
  String get medCaMaintCalciumGluconate10Dose =>
      '2-4cc/kg/d a pasar en solución de mantenimiento en 24h';

  @override
  String get medCaMaintCalciumGluconate10Notes => 'Máximo: 2g/dosis (20ml)';

  @override
  String get medEndoRenalRegularInsulinInfusion => 'Insulina simple';

  @override
  String get medEndoRenalRegularInsulinInfusionRange =>
      '(100 UI/ml; 10ml) (0,5cc insulina en 50cc SF)';

  @override
  String get medEndoRenalRegularInsulinInfusionDose => '0,05 - 0,1 UI/kg/h';

  @override
  String get medEndoRenalFurosemide => 'Furosemida';

  @override
  String get medEndoRenalFurosemideDose => '0,5-1 mg/kg/dosis';

  @override
  String get medElectrolytesCalciumGluconate10HyperK =>
      'Gluconato de calcio 10%';

  @override
  String get medElectrolytesCalciumGluconate10HyperKRange => '(100mg/ml; 10ml)';

  @override
  String get medElectrolytesCalciumGluconate10HyperKDose =>
      '0,5cc/kg IV STAT pasar lento vía periférica';

  @override
  String get medElectrolytesCalciumGluconate10HyperKNotes =>
      'Máximo: 2g/dosis (20ml)';

  @override
  String get medElectrolytesCalciumChloride10HyperK => 'Cloruro de calcio 10%';

  @override
  String get medElectrolytesCalciumChloride10HyperKRange => '(100mg/ml; 10ml)';

  @override
  String get medElectrolytesCalciumChloride10HyperKDose =>
      '0,1 - 0,2cc/kg IV STAT pasar lento vía central';

  @override
  String get medElectrolytesCalciumChloride10HyperKNotes =>
      'Máximo: 1g/dosis (10ml)';

  @override
  String get medElectrolytesNebSalbutamolHyperK => 'Salbutamol nebulizado';

  @override
  String get medElectrolytesNebSalbutamolHyperKDose =>
      '<25kg= 0,5ml; >25kg= 1cc';

  @override
  String get medElectrolytesD10WPlusHyperK => 'Solución glucosada al 10% +';

  @override
  String get medElectrolytesD10WPlusHyperKDose => '5cc/kg +';

  @override
  String get medElectrolytesRegularInsulinBolusHyperK => 'Insulina simple';

  @override
  String get medElectrolytesRegularInsulinBolusHyperKRange =>
      '(100 UI/ml; 10ml) (0,5cc insulina en 50cc SF)';

  @override
  String get medElectrolytesRegularInsulinBolusHyperKDose =>
      '0,1U/kg pasar IV en 1h junto con glucosado al 10%';

  @override
  String get medElectrolytesSodiumBicarb1MHyperK => 'Bicarbonato de sodio 1M';

  @override
  String get medElectrolytesSodiumBicarb1MHyperKRange => '(1meq/ml)';

  @override
  String get medElectrolytesSodiumBicarb1MHyperKDose =>
      'Diluir con SF: vía central (1 HCO3 : 1 SF); vía periférica: (1 HCO3 : 6 SF)';

  @override
  String get medFeverPainParacetamolPoIv => 'Paracetamol oral IV';

  @override
  String get medFeverPainParacetamolPoIvDose => '15mg / kg / dosis cada 6h';

  @override
  String get medFeverPainMetamizoleIv => 'Metamizol IV';

  @override
  String get medFeverPainMetamizoleIvDose => '15mg / kg / dosis cada 8h';

  @override
  String get medFeverPainMetamizoleIvNotes => 'Max: 1g por dosis / 4 g por día';

  @override
  String get medMassiveBleedingTranexamicAcid => 'Ácido tranexámico';

  @override
  String get medMassiveBleedingTranexamicAcidRange => '100mg/ml';

  @override
  String get medMassiveBleedingTranexamicAcidDose => '15mg/kg';

  @override
  String get medMassiveBleedingTranexamicAcidNotes => 'Fluidos tibios';

  @override
  String get medMassiveBleedingRbcFfp => 'GRE/PFC';

  @override
  String get medMassiveBleedingRbcFfpRange => '(dilución 1:1)';

  @override
  String get medMassiveBleedingRbcFfpDose => '5ml/kg';

  @override
  String get medMassiveBleedingRbcFfpNotes => 'Fluidos tibios';

  @override
  String get medMassiveBleedingPlatelets => 'Plaquetas';

  @override
  String get medMassiveBleedingPlateletsDose => '10-15ml/kg';

  @override
  String get medMassiveBleedingPlateletsNotes => 'Fluidos tibios';

  @override
  String get medMassiveBleedingCryo => 'Crioprecipitados';

  @override
  String get medMassiveBleedingCryoDose => '10ml/kg';

  @override
  String get medMassiveBleedingCryoNotes => 'Fluidos tibios';

  @override
  String get medIchHypertonicSaline3 => 'Solución hipertónica 3%';

  @override
  String get medIchHypertonicSaline3Range => '(30ml NaCl4M + 70ml SF)';

  @override
  String get medIchHypertonicSaline3Dose => '2-5ml/kg a pasar en 10min';

  @override
  String get medIchHypertonicSaline3Notes => 'Vigilar aumento de FC';

  @override
  String get medIchMannitol => 'Manitol';

  @override
  String get medIchMannitolRange => '20g/100ml';

  @override
  String get medIchMannitolDose => '0,5-1g/kg a pasar en 10min';

  @override
  String get medIchMannitolNotes => 'Vigilar aumento de FC';

  @override
  String get catSevereHypocalcemiaHypermagCCB =>
      'Hipocalcemia severa, hipermagnesemia o intoxicación por bloqueadores de canales de calcio';

  @override
  String get catAcuteSymptomaticHyponatremia =>
      'Hiponatremia aguda sintomática (convulsiones)';

  @override
  String get catHypoglycemia => 'Hipoglicemia';

  @override
  String get catSedationInfusions => 'Infusiones sedación';

  @override
  String get catInotropes => 'Inotrópicos';

  @override
  String get catIVFluids => 'Líquidos IV';

  @override
  String get catRespiratorySpecificMeds =>
      'Medicación específica según patología respiratoria';

  @override
  String get catNeuromuscularParalysis => 'Parálisis muscular';

  @override
  String get catCardiacArrest => 'Paro cardíaco';

  @override
  String get medHypocalcemiaCalciumGluconate10 => 'Gluconato de calcio 10%';

  @override
  String get medHypocalcemiaCalciumGluconate10Range => '(100mg/ml; 10ml)';

  @override
  String get medHypocalcemiaCalciumGluconate10Dose =>
      '0,5cc/kg IV STAT pasar lento vía periférica';

  @override
  String get medHypocalcemiaCalciumGluconate10Notes =>
      'Máximo: 2g/dosis (20ml)';

  @override
  String get medHypocalcemiaCalciumChloride10 => 'Cloruro de calcio 10%';

  @override
  String get medHypocalcemiaCalciumChloride10Range => '(100mg/ml; 10ml)';

  @override
  String get medHypocalcemiaCalciumChloride10Dose =>
      '0,1 - 0,2cc/kg IV STAT pasar lento vía central';

  @override
  String get medHypocalcemiaCalciumChloride10Notes => 'Máximo: 1g/dosis (10ml)';

  @override
  String get medHyponatremiaHypertonicSaline3 => 'Solución hipertónica 3%';

  @override
  String get medHyponatremiaHypertonicSaline3Range => '(30ml NaCl4M + 70ml SF)';

  @override
  String get medHyponatremiaHypertonicSaline3Dose => '4ml/kg a pasar en 20min';

  @override
  String get medHyponatremiaHypertonicSaline3Notes =>
      'Vigilar cese de convulsión';

  @override
  String get medHypoglycemiaDextrose10 => 'Solución glucosada al 10%';

  @override
  String get medHypoglycemiaDextrose10Dose =>
      '0.5-1g/kg/dosis = 5-10cc/kg/dosis IV STAT';

  @override
  String get medHypoglycemiaDextrose10Notes => 'Control de GMM en 1min';

  @override
  String get medSedationInfusionMorphine => 'Morfina';

  @override
  String get medSedationInfusionMorphineRange => '(15mg/ml; 1ml)';

  @override
  String get medSedationInfusionMorphineDose => '20mcg/kg/h';

  @override
  String get medSedationInfusionMidazolam => 'Midazolam';

  @override
  String get medSedationInfusionMidazolamRange => '(5mg/ml; 3ml)';

  @override
  String get medSedationInfusionMidazolamDose => '2mcg/kg/min';

  @override
  String get medSedationInfusionFentanyl => 'Fentanilo';

  @override
  String get medSedationInfusionFentanylRange => '(50mcg/ml; 2ml)';

  @override
  String get medSedationInfusionFentanylDose => '5mcg/kg/h';

  @override
  String get medInotropesEpiNorepiInfusion => 'Adrenalina / Norepinefrina';

  @override
  String get medInotropesEpiNorepiInfusionDose =>
      '0.3mg/kg en 50cc SG5% iniciar a 1cc/h hasta 5cc/h';

  @override
  String get medInotropesEpiNorepiInfusionNotes => '0,1mcg/kg/min';

  @override
  String get medInotropesDopamineDobutamineInfusion => 'Dopamina / Dobutamina';

  @override
  String get medInotropesDopamineDobutamineInfusionDose =>
      '15mg/kg en 50cc SG5% iniciar a 1cc/h hasta 4cc/h';

  @override
  String get medInotropesDopamineDobutamineInfusionNotes => '5mcg/kg/min';

  @override
  String get medIvFluidsMixedSolution => 'Solución mixta';

  @override
  String get medIvFluidsMixedSolutionRange => '(Requerimientos al 100%)';

  @override
  String get medIvFluidsMixedSolutionDose =>
      'pasar en Bomba de Infusión continua en 24h IV';

  @override
  String get medIvFluidsDrip => 'Goteo';

  @override
  String get medIvFluidsDripNotes => 'Requerimientos diarios';

  @override
  String get medIvFluidsResult => 'Resultado';

  @override
  String get medIvFluidsResultDose => 'Restar medicamentos';

  @override
  String get medIvFluidsDripAdjusted => 'Goteo.';

  @override
  String get medIvFluidsDripAdjustedDose => 'Restar infusiones';

  @override
  String get medIvFluidsDripAdjustedNotes =>
      'Cálculo de líquidos por porcentaje';

  @override
  String get medRespCroupDexamethasoneIv => 'Dexametasona IV';

  @override
  String get medRespCroupDexamethasoneIvRange => '(4mg/ml)';

  @override
  String get medRespCroupDexamethasoneIvDose => '0,6 mg/kg dosis única';

  @override
  String get medRespCroupNebEpinephrine => 'Adrenalina nebulizada';

  @override
  String get medRespCroupNebEpinephrineRange => '(L-adrenalina 1:1000)';

  @override
  String get medRespCroupNebEpinephrineDose =>
      '0,5 mg/kg (Diluir 1:1 con Solución Fisológica)';

  @override
  String get medRespCroupNebEpinephrineNotes => 'Máximo 5ml';

  @override
  String get medRespCroupNebBudesonide => 'Budesonida nebulizada';

  @override
  String get medRespCroupNebBudesonideRange => '(0,5mg/ml; 2ml)';

  @override
  String get medParalysisSuccinylcholine => 'Succinilcolina';

  @override
  String get medParalysisSuccinylcholineRange =>
      '(50mg/ml; 10ml) (1ml + 5cc SF)';

  @override
  String get medParalysisSuccinylcholineDose => '1-2 mg/kg';

  @override
  String get medParalysisSuccinylcholineNotes => 'Efecto de minutos.';

  @override
  String get medParalysisPancuronium => 'Pancuronio';

  @override
  String get medParalysisPancuroniumRange => '(2mg/ml)';

  @override
  String get medParalysisPancuroniumDose => '0,1 mg/kg';

  @override
  String get medParalysisPancuroniumNotes => 'Efecto por 40min.';

  @override
  String get medParalysisRocuronium => 'Rocuronio';

  @override
  String get medParalysisRocuroniumRange => '(10mg/ml)';

  @override
  String get medParalysisRocuroniumDose => '1 mg/kg';

  @override
  String get medParalysisRocuroniumNotes => 'Efecto por 30min.';

  @override
  String get medParalysisAtracurium => 'Atracurio';

  @override
  String get medParalysisAtracuriumRange => '(10mg/ml)';

  @override
  String get medParalysisAtracuriumDose => '0,4 mg/kg';

  @override
  String get medParalysisAtracuriumNotes => 'Efecto por 20min.';

  @override
  String get medParalysisEttUncuffed => 'TET sin balón';

  @override
  String get medParalysisEttUncuffedDose =>
      'Tener disponible el TET 0.5mm menor y mayor';

  @override
  String get medParalysisEttCuffed => 'TET con balón';

  @override
  String get medParalysisEttCuffedDose =>
      'Tener disponible el TET 0.5mm menor y mayor';

  @override
  String get medParalysisEttDepthLip => 'Longitud inserción a comisura labial';

  @override
  String get medParalysisEttDepthLipDose => 'También usar TET x 3';

  @override
  String get medCardiacArrestEpinephrineIv => 'Adrenalina IV';

  @override
  String get medCardiacArrestEpinephrineIvRange => '1mg/ml (1 ml + 9 ml SF)';

  @override
  String get medCardiacArrestEpinephrineIvDose => '(1ml=0,1mg) (0,01mg/kg)';

  @override
  String get medCardiacArrestEpinephrineIvNotes => 'Máximo 10ml';

  @override
  String get medCardiacArrestEpinephrineEt => 'Adrenalina ET';

  @override
  String get medCardiacArrestEpinephrineEtRange => '1mg/ml (1 ml + 9 ml SF)';

  @override
  String get medCardiacArrestEpinephrineEtDose => '(1ml=0,1mg) (0,1mg/kg)';

  @override
  String get medCardiacArrestEpinephrineEtNotes => 'Máximo 10ml';

  @override
  String get medCardiacArrestFirstShock => 'Primera descarga eléctrica';

  @override
  String get medCardiacArrestFirstShockDose => '2J/kg';

  @override
  String get medCardiacArrestFirstShockNotes =>
      'Aumentar el doble cada descarga';

  @override
  String get medCardiacArrestSecondShock => 'Segunda descarga eléctrica';

  @override
  String get medCardiacArrestSecondShockDose => '2J/kg';

  @override
  String get medCardiacArrestSecondShockNotes => 'Máximo 10J/kg';

  @override
  String get medCardiacArrestAmiodarone => 'Amiodarona';

  @override
  String get medCardiacArrestAmiodaroneRange =>
      '(50mg/ml; 3ml) (3ml + 22ml SG5%)';

  @override
  String get medCardiacArrestAmiodaroneDose => '5mg/kg';

  @override
  String get medCardiacArrestAmiodaroneNotes => 'Máximo 300mg';

  @override
  String get medCardiacArrestMagnesiumSulfate => 'Sulfato de magnesio';

  @override
  String get medCardiacArrestMagnesiumSulfateRange => '(200mg/ml; 10ml)';

  @override
  String get medCardiacArrestMagnesiumSulfateDose =>
      '50mg/kg; Llevar a 5ml con SF y pasar en 3-5 min';

  @override
  String get medCardiacArrestMagnesiumSulfateNotes => 'Máximo 2 gramos';

  @override
  String get medCardiacArrestSodiumBicarb1M => 'Bicarbonato de sodio 1M';

  @override
  String get medCardiacArrestSodiumBicarb1MRange => '(Diluir 1:1 con SF)';

  @override
  String get medCardiacArrestSodiumBicarb1MDose => '(1mEq/kg)';

  @override
  String get catSVT => 'Taquicardia supraventricular';

  @override
  String get catHco3Replacement => 'Reposición de HCO3';

  @override
  String get catPotassiumReplacement => 'Reposición de K';

  @override
  String get catRSI => 'Secuencia rápida de intubación';

  @override
  String get catShock => 'Shock';

  @override
  String get catStatusEpilepticus => 'Status convulsivo';

  @override
  String get catCentralLinesPleuralDrains =>
      'Vías centrales y drenajes pleurales';

  @override
  String get medSvtAdenosineFirst => 'Adenosina primera';

  @override
  String get medSvtAdenosineFirstRange => '3mg/ml Primera Dosis';

  @override
  String get medSvtAdenosineFirstDose => '0,1 mg/kg';

  @override
  String get medSvtAdenosineFirstNotes => 'Máximo 2 ml';

  @override
  String get medSvtAdenosineSecond => 'Adenosina segunda';

  @override
  String get medSvtAdenosineSecondRange => '3mg/ml Segunda Dosis';

  @override
  String get medSvtAdenosineSecondDose => '0,2 mg/kg';

  @override
  String get medSvtAdenosineSecondNotes => 'Máximo 4 ml';

  @override
  String get medSvtAdenosineThird => 'Adenosina tercera';

  @override
  String get medSvtAdenosineThirdRange => '3mg/ml Tercera Dosis';

  @override
  String get medSvtAdenosineThirdDose => '0,3 mg/kg';

  @override
  String get medSvtAdenosineThirdNotes => 'Máximo 4 ml';

  @override
  String get medSvtAmiodarone => 'Amiodarona';

  @override
  String get medSvtAmiodaroneRange => '(50mg/ml; 3ml) (3ml + 22ml SG5%)';

  @override
  String get medSvtAmiodaroneDose => '5mg/kg pasar en 30min-1h';

  @override
  String get medSvtAmiodaroneNotes => 'Máximo 300 mg';

  @override
  String get medHco3PatientValue => 'HCO3 del paciente';

  @override
  String get medHco3PatientValueNotes => 'Control de Na y gases al finalizar';

  @override
  String get medHco3Deficit => 'Déficit de HCO3';

  @override
  String get medHco3DeficitDose => 'de Bicarbonato de Sodio al 1M (1mEq/mL)';

  @override
  String get medHco3Sg5Volume => 'Volumen de SG5%';

  @override
  String get medHco3Sg5VolumeRange => 'a diluir déficit de HCO3';

  @override
  String get medHco3Sg5VolumeDose => 'Pasar en 3h';

  @override
  String get medHco3InfusionRate3h => 'Velocidad de infusión a pasar en 3h';

  @override
  String get medHco3InfusionRate3hRange => 'a diluir déficit de HCO3';

  @override
  String get medHco3InfusionRate3hDose => 'Pasar en 3h';

  @override
  String get medKReplacementSfVolume => 'Volumen de SF';

  @override
  String get medKReplacementSfVolumeRange => '500cc + 10cc KCL2M';

  @override
  String get medKReplacementSfVolumeDose => 'Pasar en 2h por vía periférica';

  @override
  String get medKReplacementSfVolumeNotes => 'Control de K al finalizar';

  @override
  String get medRsiMidazolam => 'Midazolam';

  @override
  String get medRsiMidazolamRange => '(5mg/ml; 3ml)';

  @override
  String get medRsiMidazolamDose => '0,3mg/kg';

  @override
  String get medShockNormalSaline => 'Solución Fisiológica';

  @override
  String get medShockNormalSalineRange => '0.9% (Bolo a 10cc/kg)';

  @override
  String get medShockNormalSalineDose =>
      '10-20cc/kg cada 5min. Máximo 60cc/kg.';

  @override
  String get medShockNormalSalineNotes => 'Considerar inotrópicos';

  @override
  String get medSeizureDiazepamIv => 'Diazepam IV';

  @override
  String get medSeizureDiazepamIvRange => '(5mg/ml; 2ml)';

  @override
  String get medSeizureDiazepamIvDose => '0,3mg/kg cada 5min #3 dosis';

  @override
  String get medSeizureDiazepamIvNotes => 'Máximo 2ml';

  @override
  String get medSeizureDiazepamPr => 'Diazepam VR';

  @override
  String get medSeizureDiazepamPrRange => '(5mg/ml; 2ml)';

  @override
  String get medSeizureDiazepamPrDose =>
      '0,5mg/kg; Introducir Angiocath rectal 5cm';

  @override
  String get medSeizureDiazepamPrNotes => 'Máximo 2ml';

  @override
  String get medSeizureMidazolamIvIm => 'Midazolam IV o IM';

  @override
  String get medSeizureMidazolamIvImRange => '(5mg/ml; 3ml)';

  @override
  String get medSeizureMidazolamIvImDose => '0,3mg/kg cada 5min #3 dosis';

  @override
  String get medSeizureMidazolamIvImNotes => 'Máximo 2ml';

  @override
  String get medSeizureMidazolamIn => 'Midazolam IN';

  @override
  String get medSeizureMidazolamInRange => '(5mg/ml; 3ml)';

  @override
  String get medSeizureMidazolamInDose =>
      '0,4mg/kg cada 5min #3 dosis. Utilizar atomizador nasal';

  @override
  String get medSeizureMidazolamInNotes => 'Máximo 2ml';

  @override
  String get medSeizurePhenytoinIv => 'Fenitoína IV';

  @override
  String get medSeizurePhenytoinIvRange => '(50mg/ml; 5ml)';

  @override
  String get medSeizurePhenytoinIvDose =>
      '20mg/kg; Diluir en 10x el volumen de SF y pasar en 30min';

  @override
  String get medSeizurePhenytoinIvNotes => 'Diluir en SF, nunca en glucosado';

  @override
  String get medSeizurePhenobarbitalIv => 'Fenobarbital IV';

  @override
  String get medSeizurePhenobarbitalIvRange => '(50mg/ml; 1ml)';

  @override
  String get medSeizurePhenobarbitalIvDose =>
      '20mg/kg; Diluir en 10x el volumen de Agua Estéril y pasar en 15min';

  @override
  String get medSeizurePhenobarbitalIvNotes =>
      'Diluir en agua, nunca en glucosado';

  @override
  String get medCentralLinesFemoralDepth => 'Catéter femoral:';

  @override
  String get medCentralLinesFemoralDepthDose => 'Profundidad de colocación';

  @override
  String get medCentralLinesFemoralDepthNotes => '13 a 30 cm';

  @override
  String get medCentralLinesJugularDepth => 'Catéter yugular:';

  @override
  String get medCentralLinesJugularDepthDose => 'Profundidad de colocación';

  @override
  String get medCentralLinesJugularDepthNotes => '5 a 8 cm';

  @override
  String get medPleuralDrainCatheter => 'Catéter para drenaje pleural:';

  @override
  String get medPleuralDrainCatheterDose => 'Pre-escolar 8-20F';

  @override
  String get medPleuralDrainCatheterNotes => 'Adolescente 14-36F';
}
