import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
  ];

  /// No description provided for @termsTitle.
  ///
  /// In es, this message translates to:
  /// **'Instrucciones y Términos'**
  String get termsTitle;

  /// No description provided for @menuAbout.
  ///
  /// In es, this message translates to:
  /// **'Acerca de'**
  String get menuAbout;

  /// No description provided for @menuLanguage.
  ///
  /// In es, this message translates to:
  /// **'Idiomas'**
  String get menuLanguage;

  /// No description provided for @languageTitle.
  ///
  /// In es, this message translates to:
  /// **'Seleccionar idioma'**
  String get languageTitle;

  /// No description provided for @languageSpanish.
  ///
  /// In es, this message translates to:
  /// **'Español'**
  String get languageSpanish;

  /// No description provided for @languageEnglish.
  ///
  /// In es, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @quickSummaryTitle.
  ///
  /// In es, this message translates to:
  /// **'Resumen rápido:'**
  String get quickSummaryTitle;

  /// No description provided for @quickSummaryBody.
  ///
  /// In es, this message translates to:
  /// **'• Peso real es recomendado si está disponible.\n• Si no hay peso, la app estima el peso por edad automáticamente.\n• Verifica siempre las dosis con protocolo/guía local antes de administrar.'**
  String get quickSummaryBody;

  /// No description provided for @termsAccept.
  ///
  /// In es, this message translates to:
  /// **'He leído y acepto los términos y condiciones.'**
  String get termsAccept;

  /// No description provided for @btnContinue.
  ///
  /// In es, this message translates to:
  /// **'Continuar'**
  String get btnContinue;

  /// No description provided for @accordion1Title.
  ///
  /// In es, this message translates to:
  /// **'1. Contenido de la tabla'**
  String get accordion1Title;

  /// No description provided for @accordion1Body.
  ///
  /// In es, this message translates to:
  /// **'La siguiente tabla contiene información sobre medicación de más frecuente uso en emergencias.'**
  String get accordion1Body;

  /// No description provided for @accordion2Title.
  ///
  /// In es, this message translates to:
  /// **'2. Aplicabilidad a niños'**
  String get accordion2Title;

  /// No description provided for @accordion2Body.
  ///
  /// In es, this message translates to:
  /// **'Es aplicable a niños mayores a un mes de edad.'**
  String get accordion2Body;

  /// No description provided for @accordion3Title.
  ///
  /// In es, this message translates to:
  /// **'3. Determinación de Peso/Edad'**
  String get accordion3Title;

  /// No description provided for @accordion3Body.
  ///
  /// In es, this message translates to:
  /// **'Ingresa el peso en kilogramos cuando esté disponible (recomendado). Si no conoces el peso, ingresa la edad (años o meses según corresponda) y la app calculará un peso estimado automáticamente para realizar los cálculos. La pantalla mostrará si se usará “Peso real ✅” o “Estimado ⚠️”.'**
  String get accordion3Body;

  /// No description provided for @accordion4Title.
  ///
  /// In es, this message translates to:
  /// **'4. Volumen de las soluciones de mantenimiento'**
  String get accordion4Title;

  /// No description provided for @accordion4Body.
  ///
  /// In es, this message translates to:
  /// **'En el cálculo del volumen de las soluciones de mantenimiento se puede variar el porcentaje de requerimientos al cual se desea la solución.'**
  String get accordion4Body;

  /// No description provided for @accordion5Title.
  ///
  /// In es, this message translates to:
  /// **'5. Cálculos automáticos'**
  String get accordion5Title;

  /// No description provided for @accordion5Body.
  ///
  /// In es, this message translates to:
  /// **'Todas las dosis se calculan automáticamente con el peso real o el peso estimado (si aplica), además de otras variables clínicas según el medicamento.'**
  String get accordion5Body;

  /// No description provided for @accordion6Title.
  ///
  /// In es, this message translates to:
  /// **'6. Verificación de rangos'**
  String get accordion6Title;

  /// No description provided for @accordion6Body.
  ///
  /// In es, this message translates to:
  /// **'Cuando una dosis tiene rango, la app muestra un valor sugerido. Verifica el rango y la fórmula del medicamento según el protocolo local.'**
  String get accordion6Body;

  /// No description provided for @accordion7Title.
  ///
  /// In es, this message translates to:
  /// **'7. Requerimientos de cálculo de dosis diferentes'**
  String get accordion7Title;

  /// No description provided for @accordion7Body.
  ///
  /// In es, this message translates to:
  /// **'Si necesitas calcular una dosis distinta a la propuesta, debe realizarse manualmente, ya que esta tabla/app no es modificable.'**
  String get accordion7Body;

  /// No description provided for @accordion8Title.
  ///
  /// In es, this message translates to:
  /// **'8. Cálculo del tamaño del CAF (XS, S, etc.)'**
  String get accordion8Title;

  /// No description provided for @accordion8Body.
  ///
  /// In es, this message translates to:
  /// **'El tamaño sugerido del CAF se calcula según el peso del paciente. Si no hay una recomendación adecuada para ese paciente, el espacio puede quedar en blanco.'**
  String get accordion8Body;

  /// No description provided for @accordion9Title.
  ///
  /// In es, this message translates to:
  /// **'9. Responsabilidad del Usuario'**
  String get accordion9Title;

  /// No description provided for @accordion9Body.
  ///
  /// In es, this message translates to:
  /// **'EL USO DE ESTA APLICACIÓN ES RESPONSABILIDAD COMPLETA E INDIVIDUAL DE QUIEN LA UTILICE. NO EXIME EL DEBER TÉCNICO DE CORROBORAR LOS DATOS CON UN LIBRO DE TEXTO/PROTOCOLO ACTUALIZADO ANTES DE LA ADMINISTRACIÓN DE MEDICAMENTOS.'**
  String get accordion9Body;

  /// No description provided for @aboutTitle.
  ///
  /// In es, this message translates to:
  /// **'Acerca de'**
  String get aboutTitle;

  /// No description provided for @aboutDevelopedBy.
  ///
  /// In es, this message translates to:
  /// **'Desarrollado por'**
  String get aboutDevelopedBy;

  /// No description provided for @aboutPurpose.
  ///
  /// In es, this message translates to:
  /// **'Propósito'**
  String get aboutPurpose;

  /// No description provided for @aboutSupport.
  ///
  /// In es, this message translates to:
  /// **'Soporte'**
  String get aboutSupport;

  /// No description provided for @aboutPurposeBody.
  ///
  /// In es, this message translates to:
  /// **'Herramienta clínica para cálculos pediátricos y acceso rápido a rangos de signos vitales.'**
  String get aboutPurposeBody;

  /// No description provided for @aboutSupportBody.
  ///
  /// In es, this message translates to:
  /// **'Si necesitas soporte o deseas nuevas funciones, contacta al desarrollador.'**
  String get aboutSupportBody;

  /// No description provided for @aboutBack.
  ///
  /// In es, this message translates to:
  /// **'Volver'**
  String get aboutBack;

  /// No description provided for @aboutCopyright.
  ///
  /// In es, this message translates to:
  /// **'© {year} {company}. Todos los derechos reservados.'**
  String aboutCopyright(Object company, Object year);

  /// No description provided for @developedBy.
  ///
  /// In es, this message translates to:
  /// **'Desarrollado por'**
  String get developedBy;

  /// No description provided for @purpose.
  ///
  /// In es, this message translates to:
  /// **'Propósito'**
  String get purpose;

  /// No description provided for @support.
  ///
  /// In es, this message translates to:
  /// **'Soporte'**
  String get support;

  /// No description provided for @aboutPurposeText.
  ///
  /// In es, this message translates to:
  /// **'Herramienta clínica para cálculos pediátricos y acceso rápido a rangos de signos vitales.'**
  String get aboutPurposeText;

  /// No description provided for @aboutSupportText.
  ///
  /// In es, this message translates to:
  /// **'Si necesitas soporte o deseas nuevas funciones, contacta al desarrollador.'**
  String get aboutSupportText;

  /// No description provided for @back.
  ///
  /// In es, this message translates to:
  /// **'Volver'**
  String get back;

  /// No description provided for @rightsReserved.
  ///
  /// In es, this message translates to:
  /// **'Todos los derechos reservados.'**
  String get rightsReserved;

  /// No description provided for @proTag.
  ///
  /// In es, this message translates to:
  /// **'PRO'**
  String get proTag;

  /// No description provided for @ageSelectTitle.
  ///
  /// In es, this message translates to:
  /// **'Seleccionar tipo de edad'**
  String get ageSelectTitle;

  /// No description provided for @ageSelectQuestion.
  ///
  /// In es, this message translates to:
  /// **'¿Cómo deseas ingresar la edad?'**
  String get ageSelectQuestion;

  /// No description provided for @ageYearsTitle.
  ///
  /// In es, this message translates to:
  /// **'Edad en Años'**
  String get ageYearsTitle;

  /// No description provided for @ageYearsSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Para pacientes de 1 hasta 14 años'**
  String get ageYearsSubtitle;

  /// No description provided for @ageSelectNote.
  ///
  /// In es, this message translates to:
  /// **'Si no tienes el peso, en las siguientes pantallas podrás estimarlo usando la edad.'**
  String get ageSelectNote;

  /// No description provided for @commonBadge.
  ///
  /// In es, this message translates to:
  /// **'Más común'**
  String get commonBadge;

  /// No description provided for @ageMonthsTitle.
  ///
  /// In es, this message translates to:
  /// **'Edad en Meses'**
  String get ageMonthsTitle;

  /// No description provided for @ageMonthsSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Para lactantes de 1 a 11 meses'**
  String get ageMonthsSubtitle;

  /// No description provided for @ageSelectSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Selecciona la opción según la forma en que tengas el dato del paciente.'**
  String get ageSelectSubtitle;

  /// No description provided for @patientAppBarTitleYears.
  ///
  /// In es, this message translates to:
  /// **'Datos del Paciente (Años)'**
  String get patientAppBarTitleYears;

  /// No description provided for @patientHeaderTitle.
  ///
  /// In es, this message translates to:
  /// **'Ingrese los datos del paciente'**
  String get patientHeaderTitle;

  /// No description provided for @patientHowItWorks.
  ///
  /// In es, this message translates to:
  /// **'Cómo funciona:'**
  String get patientHowItWorks;

  /// No description provided for @patientHowItWorksBody.
  ///
  /// In es, this message translates to:
  /// **'• Si ingresas Peso, calculamos con ese peso.\n• Si no tienes peso, ingresa Edad (1–14) y usamos un peso estimado.\n• El peso estimado es guía; confirma con peso real si es posible.'**
  String get patientHowItWorksBody;

  /// No description provided for @patientWeightLabel.
  ///
  /// In es, this message translates to:
  /// **'Peso actual (kg)'**
  String get patientWeightLabel;

  /// No description provided for @patientWeightHint.
  ///
  /// In es, this message translates to:
  /// **'Ej: 22.6'**
  String get patientWeightHint;

  /// No description provided for @patientAgeYearsLabel.
  ///
  /// In es, this message translates to:
  /// **'Edad (Años - 1 a 14 años)'**
  String get patientAgeYearsLabel;

  /// No description provided for @patientAgeYearsHint.
  ///
  /// In es, this message translates to:
  /// **'Ej: 4'**
  String get patientAgeYearsHint;

  /// No description provided for @patientAgeMonthsLabel.
  ///
  /// In es, this message translates to:
  /// **'Edad (Meses - de 1 a 11 meses)'**
  String get patientAgeMonthsLabel;

  /// No description provided for @patientAgeMonthsHint.
  ///
  /// In es, this message translates to:
  /// **'Ej: 6'**
  String get patientAgeMonthsHint;

  /// No description provided for @patientEstimatedWeightLabel.
  ///
  /// In es, this message translates to:
  /// **'Peso estimado según edad:'**
  String get patientEstimatedWeightLabel;

  /// No description provided for @patientChipRealWeight.
  ///
  /// In es, this message translates to:
  /// **'Peso real ✅'**
  String get patientChipRealWeight;

  /// No description provided for @patientChipEstimated.
  ///
  /// In es, this message translates to:
  /// **'Estimado ⚠️'**
  String get patientChipEstimated;

  /// No description provided for @patientBtnWithEnteredWeight.
  ///
  /// In es, this message translates to:
  /// **'Calcular con peso ingresado'**
  String get patientBtnWithEnteredWeight;

  /// No description provided for @patientBtnWithEstimatedWeight.
  ///
  /// In es, this message translates to:
  /// **'Calcular con peso estimado'**
  String get patientBtnWithEstimatedWeight;

  /// No description provided for @patientBtnCalculateDose.
  ///
  /// In es, this message translates to:
  /// **'Calcular Dosis'**
  String get patientBtnCalculateDose;

  /// No description provided for @patientValWeightOrValidAgeToEstimate.
  ///
  /// In es, this message translates to:
  /// **'Ingrese el peso o una edad válida en años para estimarlo.'**
  String get patientValWeightOrValidAgeToEstimate;

  /// No description provided for @patientValInvalidNumber.
  ///
  /// In es, this message translates to:
  /// **'Entrada inválida. Ingrese un número.'**
  String get patientValInvalidNumber;

  /// No description provided for @patientValEnterAgeYears.
  ///
  /// In es, this message translates to:
  /// **'Por favor, ingrese edad en años.'**
  String get patientValEnterAgeYears;

  /// No description provided for @patientValAgeRangeYears.
  ///
  /// In es, this message translates to:
  /// **'La edad debe ser entre 1 y 14 años.'**
  String get patientValAgeRangeYears;

  /// No description provided for @patientValAgeMonthsRange.
  ///
  /// In es, this message translates to:
  /// **'La edad en meses debe ser entre 1 y 11.'**
  String get patientValAgeMonthsRange;

  /// No description provided for @patientSnackNeedWeightOrAge.
  ///
  /// In es, this message translates to:
  /// **'Por favor, ingresa el peso del paciente O la edad en años (para cálculo estimado).'**
  String get patientSnackNeedWeightOrAge;

  /// No description provided for @patientSnackNeedWeightAndAge.
  ///
  /// In es, this message translates to:
  /// **'Por favor, ingresa un peso y al menos la edad en años o meses.'**
  String get patientSnackNeedWeightAndAge;

  /// No description provided for @medsTitleYears.
  ///
  /// In es, this message translates to:
  /// **'Medicamentos (1 - 14 años)'**
  String get medsTitleYears;

  /// No description provided for @medsSubtitleViewDetails.
  ///
  /// In es, this message translates to:
  /// **'Ver detalles'**
  String get medsSubtitleViewDetails;

  /// No description provided for @medsChipEstimated.
  ///
  /// In es, this message translates to:
  /// **'Estimado ⚠️'**
  String get medsChipEstimated;

  /// No description provided for @medsChipRealWeight.
  ///
  /// In es, this message translates to:
  /// **'Peso real ✅'**
  String get medsChipRealWeight;

  /// No description provided for @medsBtnChange.
  ///
  /// In es, this message translates to:
  /// **'Cambiar'**
  String get medsBtnChange;

  /// No description provided for @medsSearchHint.
  ///
  /// In es, this message translates to:
  /// **'Buscar medicamento...'**
  String get medsSearchHint;

  /// No description provided for @medsAlphaAll.
  ///
  /// In es, this message translates to:
  /// **'TODAS'**
  String get medsAlphaAll;

  /// No description provided for @medsAlphaFavs.
  ///
  /// In es, this message translates to:
  /// **'Favoritos'**
  String get medsAlphaFavs;

  /// No description provided for @medsSpecialCalculations.
  ///
  /// In es, this message translates to:
  /// **'Cálculos especiales'**
  String get medsSpecialCalculations;

  /// No description provided for @medsModalClose.
  ///
  /// In es, this message translates to:
  /// **'Cerrar'**
  String get medsModalClose;

  /// No description provided for @medsVitalsTitle.
  ///
  /// In es, this message translates to:
  /// **'Signos Vitales (SING V)'**
  String get medsVitalsTitle;

  /// No description provided for @medsPamTitle.
  ///
  /// In es, this message translates to:
  /// **'Presión Arterial Media (PAM)'**
  String get medsPamTitle;

  /// No description provided for @medsOptionHeartRate.
  ///
  /// In es, this message translates to:
  /// **'Frecuencia Cardíaca'**
  String get medsOptionHeartRate;

  /// No description provided for @medsOptionRespRate.
  ///
  /// In es, this message translates to:
  /// **'Frecuencia Respiratoria'**
  String get medsOptionRespRate;

  /// No description provided for @medsOptionBloodPressure.
  ///
  /// In es, this message translates to:
  /// **'Presión Arterial'**
  String get medsOptionBloodPressure;

  /// No description provided for @medsOptionTemperature.
  ///
  /// In es, this message translates to:
  /// **'Temperatura'**
  String get medsOptionTemperature;

  /// No description provided for @medsOptionOxygenSat.
  ///
  /// In es, this message translates to:
  /// **'Saturación de Oxígeno'**
  String get medsOptionOxygenSat;

  /// No description provided for @medsOptionBloodPressureWomen.
  ///
  /// In es, this message translates to:
  /// **'Presión Arterial Mujeres'**
  String get medsOptionBloodPressureWomen;

  /// No description provided for @medsOptionBloodPressureMen.
  ///
  /// In es, this message translates to:
  /// **'Presión Arterial Hombres'**
  String get medsOptionBloodPressureMen;

  /// No description provided for @medsPrintTooltip.
  ///
  /// In es, this message translates to:
  /// **'Imprimir todos los medicamentos calculados'**
  String get medsPrintTooltip;

  /// No description provided for @medsBottomSINGV.
  ///
  /// In es, this message translates to:
  /// **'SING V'**
  String get medsBottomSINGV;

  /// No description provided for @medsBottomPAM.
  ///
  /// In es, this message translates to:
  /// **'PAM'**
  String get medsBottomPAM;

  /// No description provided for @patientHeaderSummaryYears.
  ///
  /// In es, this message translates to:
  /// **'{weight} kg · {age} años'**
  String patientHeaderSummaryYears(Object age, Object weight);

  /// No description provided for @medDetailPrintTooltip.
  ///
  /// In es, this message translates to:
  /// **'Imprimir Reporte'**
  String get medDetailPrintTooltip;

  /// No description provided for @medDetailInfoTitle.
  ///
  /// In es, this message translates to:
  /// **'Información del Medicamento'**
  String get medDetailInfoTitle;

  /// No description provided for @medDetailDoseTitle.
  ///
  /// In es, this message translates to:
  /// **'Dosis calculada para el paciente'**
  String get medDetailDoseTitle;

  /// No description provided for @medDetailCategory.
  ///
  /// In es, this message translates to:
  /// **'Categoría:'**
  String get medDetailCategory;

  /// No description provided for @medDetailSubcategory.
  ///
  /// In es, this message translates to:
  /// **'Subcategoría:'**
  String get medDetailSubcategory;

  /// No description provided for @medDetailOriginalDoseRange.
  ///
  /// In es, this message translates to:
  /// **'Rango dosis original:'**
  String get medDetailOriginalDoseRange;

  /// No description provided for @medDetailPediatricDose.
  ///
  /// In es, this message translates to:
  /// **'Dosis pediátrica:'**
  String get medDetailPediatricDose;

  /// No description provided for @medDetailNotes.
  ///
  /// In es, this message translates to:
  /// **'Observaciones:'**
  String get medDetailNotes;

  /// No description provided for @medDetailCopy.
  ///
  /// In es, this message translates to:
  /// **'Copiar'**
  String get medDetailCopy;

  /// No description provided for @medDetailCopied.
  ///
  /// In es, this message translates to:
  /// **'\"{text}\" copiado'**
  String medDetailCopied(Object text);

  /// No description provided for @commonNA.
  ///
  /// In es, this message translates to:
  /// **'N/A'**
  String get commonNA;

  /// No description provided for @commonDash.
  ///
  /// In es, this message translates to:
  /// **'—'**
  String get commonDash;

  /// No description provided for @printPatientReportTitle.
  ///
  /// In es, this message translates to:
  /// **'Reporte de Paciente'**
  String get printPatientReportTitle;

  /// No description provided for @printAppSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Pedx Calc · Cálculos'**
  String get printAppSubtitle;

  /// No description provided for @printGeneratedBy.
  ///
  /// In es, this message translates to:
  /// **'Generado por Pedx Calc'**
  String get printGeneratedBy;

  /// No description provided for @printDateLabel.
  ///
  /// In es, this message translates to:
  /// **'Fecha'**
  String get printDateLabel;

  /// No description provided for @printPageLabel.
  ///
  /// In es, this message translates to:
  /// **'Página'**
  String get printPageLabel;

  /// No description provided for @printPatientDataTitle.
  ///
  /// In es, this message translates to:
  /// **'Datos del Paciente'**
  String get printPatientDataTitle;

  /// No description provided for @printWeightLabel.
  ///
  /// In es, this message translates to:
  /// **'Peso'**
  String get printWeightLabel;

  /// No description provided for @printAgeLabel.
  ///
  /// In es, this message translates to:
  /// **'Edad'**
  String get printAgeLabel;

  /// No description provided for @printYearsUnit.
  ///
  /// In es, this message translates to:
  /// **'años'**
  String get printYearsUnit;

  /// No description provided for @printMonthsUnit.
  ///
  /// In es, this message translates to:
  /// **'meses'**
  String get printMonthsUnit;

  /// No description provided for @printMedsCalculatedTitle.
  ///
  /// In es, this message translates to:
  /// **'Medicamentos calculados'**
  String get printMedsCalculatedTitle;

  /// No description provided for @printTableHeaderMedication.
  ///
  /// In es, this message translates to:
  /// **'Medicamento'**
  String get printTableHeaderMedication;

  /// No description provided for @printTableHeaderDose.
  ///
  /// In es, this message translates to:
  /// **'Dosis calculada'**
  String get printTableHeaderDose;

  /// No description provided for @printTableHeaderNotes.
  ///
  /// In es, this message translates to:
  /// **'Observaciones'**
  String get printTableHeaderNotes;

  /// No description provided for @printPreviewError.
  ///
  /// In es, this message translates to:
  /// **'Error al generar PDF: {error}'**
  String printPreviewError(Object error);

  /// No description provided for @specialCalcTitle.
  ///
  /// In es, this message translates to:
  /// **'Cálculos especiales jóvenes'**
  String get specialCalcTitle;

  /// No description provided for @specialCalcResetTooltip.
  ///
  /// In es, this message translates to:
  /// **'Restaurar valores'**
  String get specialCalcResetTooltip;

  /// No description provided for @specialCalcPrintTooltip.
  ///
  /// In es, this message translates to:
  /// **'Imprimir reporte completo'**
  String get specialCalcPrintTooltip;

  /// No description provided for @specialCalcPatientHeader.
  ///
  /// In es, this message translates to:
  /// **'Paciente: {weight} kg · {age} {ageUnit}'**
  String specialCalcPatientHeader(Object weight, Object age, Object ageUnit);

  /// No description provided for @specialCalcYearsUnit.
  ///
  /// In es, this message translates to:
  /// **'años'**
  String get specialCalcYearsUnit;

  /// No description provided for @specialCalcMonthsUnit.
  ///
  /// In es, this message translates to:
  /// **'meses'**
  String get specialCalcMonthsUnit;

  /// No description provided for @specialCalcInputPercentTitle.
  ///
  /// In es, this message translates to:
  /// **'Cálculo por porcentaje'**
  String get specialCalcInputPercentTitle;

  /// No description provided for @specialCalcInputPercentHint.
  ///
  /// In es, this message translates to:
  /// **'100'**
  String get specialCalcInputPercentHint;

  /// No description provided for @specialCalcInputPercentHelper.
  ///
  /// In es, this message translates to:
  /// **'Ajusta el % de líquidos (ej: 80, 60, 45…).'**
  String get specialCalcInputPercentHelper;

  /// No description provided for @specialCalcInputSodiumTitle.
  ///
  /// In es, this message translates to:
  /// **'Sodio del paciente (Na)'**
  String get specialCalcInputSodiumTitle;

  /// No description provided for @specialCalcInputSodiumHint.
  ///
  /// In es, this message translates to:
  /// **'120'**
  String get specialCalcInputSodiumHint;

  /// No description provided for @specialCalcInputSodiumHelper.
  ///
  /// In es, this message translates to:
  /// **'Ingresa Na actual (mEq/L).'**
  String get specialCalcInputSodiumHelper;

  /// No description provided for @specialCalcInputHco3Title.
  ///
  /// In es, this message translates to:
  /// **'Reposición HCO3'**
  String get specialCalcInputHco3Title;

  /// No description provided for @specialCalcInputHco3Hint.
  ///
  /// In es, this message translates to:
  /// **'7'**
  String get specialCalcInputHco3Hint;

  /// No description provided for @specialCalcInputHco3Helper.
  ///
  /// In es, this message translates to:
  /// **'Ingresa HCO3 actual (mEq/L).'**
  String get specialCalcInputHco3Helper;

  /// No description provided for @specialCalcSectionLiquids.
  ///
  /// In es, this message translates to:
  /// **'Líquidos endovenosos'**
  String get specialCalcSectionLiquids;

  /// No description provided for @specialCalcSectionSodium.
  ///
  /// In es, this message translates to:
  /// **'Reposición de sodio'**
  String get specialCalcSectionSodium;

  /// No description provided for @specialCalcSectionHco3.
  ///
  /// In es, this message translates to:
  /// **'Reposición HCO3'**
  String get specialCalcSectionHco3;

  /// No description provided for @specialCalcTotalLabel.
  ///
  /// In es, this message translates to:
  /// **'Resultado (total final)'**
  String get specialCalcTotalLabel;

  /// No description provided for @specialCalcPercentInfoFallback.
  ///
  /// In es, this message translates to:
  /// **'Puedes ajustar el porcentaje según la condición del paciente.'**
  String get specialCalcPercentInfoFallback;

  /// No description provided for @patientMonthsAppBarTitle.
  ///
  /// In es, this message translates to:
  /// **'Datos del Paciente (Meses)'**
  String get patientMonthsAppBarTitle;

  /// No description provided for @patientMonthsCardTitle.
  ///
  /// In es, this message translates to:
  /// **'Ingrese los datos (1–11 meses)'**
  String get patientMonthsCardTitle;

  /// No description provided for @howItWorksTitle.
  ///
  /// In es, this message translates to:
  /// **'Cómo funciona:'**
  String get howItWorksTitle;

  /// No description provided for @howItWorksMonthsBody.
  ///
  /// In es, this message translates to:
  /// **'• Si ingresas Peso, calculamos con ese peso.\n• Si no tienes peso, ingresa Edad (1–11 meses) y usamos un peso estimado.\n• El peso estimado es guía; confirma con peso real si es posible.'**
  String get howItWorksMonthsBody;

  /// No description provided for @patientWeightHintMonths.
  ///
  /// In es, this message translates to:
  /// **'Ej: 7.5'**
  String get patientWeightHintMonths;

  /// No description provided for @patientMonthsValidatorEmpty.
  ///
  /// In es, this message translates to:
  /// **'Por favor, ingresa la edad en meses.'**
  String get patientMonthsValidatorEmpty;

  /// No description provided for @patientMonthsValidatorRange.
  ///
  /// In es, this message translates to:
  /// **'La edad debe ser entre 1 y 11 meses.'**
  String get patientMonthsValidatorRange;

  /// No description provided for @estimatedWeightByAge.
  ///
  /// In es, this message translates to:
  /// **'Peso estimado según edad: '**
  String get estimatedWeightByAge;

  /// No description provided for @snackNeedWeightOrValidAgeMonths.
  ///
  /// In es, this message translates to:
  /// **'Por favor, ingresa un peso válido o una edad válida (1–11 meses) para estimarlo.'**
  String get snackNeedWeightOrValidAgeMonths;

  /// No description provided for @btnCalcWithEnteredWeight.
  ///
  /// In es, this message translates to:
  /// **'Calcular con peso ingresado'**
  String get btnCalcWithEnteredWeight;

  /// No description provided for @btnCalcWithEstimatedWeight.
  ///
  /// In es, this message translates to:
  /// **'Calcular con peso estimado'**
  String get btnCalcWithEstimatedWeight;

  /// No description provided for @btnCalcDose.
  ///
  /// In es, this message translates to:
  /// **'Calcular dosis'**
  String get btnCalcDose;

  /// No description provided for @chipRealWeight.
  ///
  /// In es, this message translates to:
  /// **'Peso real ✅'**
  String get chipRealWeight;

  /// No description provided for @chipEstimated.
  ///
  /// In es, this message translates to:
  /// **'Estimado ⚠️'**
  String get chipEstimated;

  /// No description provided for @navPatient.
  ///
  /// In es, this message translates to:
  /// **'Paciente'**
  String get navPatient;

  /// No description provided for @navInstructions.
  ///
  /// In es, this message translates to:
  /// **'Instrucciones'**
  String get navInstructions;

  /// No description provided for @medsMonthsAppBarTitle.
  ///
  /// In es, this message translates to:
  /// **'Medicamentos (1 - 11 meses)'**
  String get medsMonthsAppBarTitle;

  /// No description provided for @searchMedicationHint.
  ///
  /// In es, this message translates to:
  /// **'Buscar medicamento...'**
  String get searchMedicationHint;

  /// No description provided for @viewDetails.
  ///
  /// In es, this message translates to:
  /// **'Ver detalles'**
  String get viewDetails;

  /// No description provided for @btnChange.
  ///
  /// In es, this message translates to:
  /// **'Cambiar'**
  String get btnChange;

  /// No description provided for @filterAll.
  ///
  /// In es, this message translates to:
  /// **'TODAS'**
  String get filterAll;

  /// No description provided for @filterFavorites.
  ///
  /// In es, this message translates to:
  /// **'Favoritos'**
  String get filterFavorites;

  /// No description provided for @specialCalculations.
  ///
  /// In es, this message translates to:
  /// **'Cálculos especiales'**
  String get specialCalculations;

  /// No description provided for @modalClose.
  ///
  /// In es, this message translates to:
  /// **'Cerrar'**
  String get modalClose;

  /// No description provided for @modalVitalsTitle.
  ///
  /// In es, this message translates to:
  /// **'Signos Vitales (SING V)'**
  String get modalVitalsTitle;

  /// No description provided for @modalPamTitle.
  ///
  /// In es, this message translates to:
  /// **'Presión Arterial Media (PAM)'**
  String get modalPamTitle;

  /// No description provided for @vitalHeartRate.
  ///
  /// In es, this message translates to:
  /// **'Frecuencia Cardíaca'**
  String get vitalHeartRate;

  /// No description provided for @vitalRespRate.
  ///
  /// In es, this message translates to:
  /// **'Frecuencia Respiratoria'**
  String get vitalRespRate;

  /// No description provided for @vitalBloodPressure.
  ///
  /// In es, this message translates to:
  /// **'Presión Arterial'**
  String get vitalBloodPressure;

  /// No description provided for @vitalTemperature.
  ///
  /// In es, this message translates to:
  /// **'Temperatura'**
  String get vitalTemperature;

  /// No description provided for @vitalOxygenSat.
  ///
  /// In es, this message translates to:
  /// **'Saturación de Oxígeno'**
  String get vitalOxygenSat;

  /// No description provided for @vitalBloodPressureWomen.
  ///
  /// In es, this message translates to:
  /// **'Presión Arterial Mujeres'**
  String get vitalBloodPressureWomen;

  /// No description provided for @vitalBloodPressureMen.
  ///
  /// In es, this message translates to:
  /// **'Presión Arterial Hombres'**
  String get vitalBloodPressureMen;

  /// No description provided for @printFullReport.
  ///
  /// In es, this message translates to:
  /// **'Imprimir reporte completo'**
  String get printFullReport;

  /// No description provided for @patientHeaderMonthsUnit.
  ///
  /// In es, this message translates to:
  /// **'meses'**
  String get patientHeaderMonthsUnit;

  /// No description provided for @specialCalcMonthsTitle.
  ///
  /// In es, this message translates to:
  /// **'Cálculos especiales (1 - 11 meses)'**
  String get specialCalcMonthsTitle;

  /// No description provided for @restoreValues.
  ///
  /// In es, this message translates to:
  /// **'Restaurar valores'**
  String get restoreValues;

  /// No description provided for @patientHeaderPrefix.
  ///
  /// In es, this message translates to:
  /// **'Paciente'**
  String get patientHeaderPrefix;

  /// No description provided for @inputLiquidsPercentTitle.
  ///
  /// In es, this message translates to:
  /// **'Cálculo por porcentaje de líquidos IV'**
  String get inputLiquidsPercentTitle;

  /// No description provided for @inputLiquidsPercentHelper.
  ///
  /// In es, this message translates to:
  /// **'Ajusta el % según condición (ej: 80, 60, 45…).'**
  String get inputLiquidsPercentHelper;

  /// No description provided for @inputHco3Title.
  ///
  /// In es, this message translates to:
  /// **'Reposición HCO3'**
  String get inputHco3Title;

  /// No description provided for @inputHco3Helper.
  ///
  /// In es, this message translates to:
  /// **'Ingresa HCO3 actual.'**
  String get inputHco3Helper;

  /// No description provided for @inputSodiumTitle.
  ///
  /// In es, this message translates to:
  /// **'Reposición de sodio (Na)'**
  String get inputSodiumTitle;

  /// No description provided for @inputSodiumHelper.
  ///
  /// In es, this message translates to:
  /// **'Ingresa Na actual.'**
  String get inputSodiumHelper;

  /// No description provided for @sectionLiquidsIV.
  ///
  /// In es, this message translates to:
  /// **'Líquids IV'**
  String get sectionLiquidsIV;

  /// No description provided for @sectionHco3.
  ///
  /// In es, this message translates to:
  /// **'Reposición de HCO3'**
  String get sectionHco3;

  /// No description provided for @sectionSodium.
  ///
  /// In es, this message translates to:
  /// **'Reposición de sodio'**
  String get sectionSodium;

  /// No description provided for @resultTotalFinal.
  ///
  /// In es, this message translates to:
  /// **'Resultado (total final)'**
  String get resultTotalFinal;

  /// No description provided for @printReportTooltip.
  ///
  /// In es, this message translates to:
  /// **'Imprimir reporte'**
  String get printReportTooltip;

  /// No description provided for @medInfoTitle.
  ///
  /// In es, this message translates to:
  /// **'Información del medicamento'**
  String get medInfoTitle;

  /// No description provided for @medInfoCategoryLabel.
  ///
  /// In es, this message translates to:
  /// **'Categoría:'**
  String get medInfoCategoryLabel;

  /// No description provided for @medInfoSubcategoryLabel.
  ///
  /// In es, this message translates to:
  /// **'Subcategoría:'**
  String get medInfoSubcategoryLabel;

  /// No description provided for @medInfoOriginalDoseRangeLabel.
  ///
  /// In es, this message translates to:
  /// **'Rango dosis original:'**
  String get medInfoOriginalDoseRangeLabel;

  /// No description provided for @medInfoPediatricDoseLabel.
  ///
  /// In es, this message translates to:
  /// **'Dosis pediátrica:'**
  String get medInfoPediatricDoseLabel;

  /// No description provided for @medInfoObservationsLabel.
  ///
  /// In es, this message translates to:
  /// **'Observaciones:'**
  String get medInfoObservationsLabel;

  /// No description provided for @patientCalculatedDoseTitle.
  ///
  /// In es, this message translates to:
  /// **'Dosis calculada para el paciente'**
  String get patientCalculatedDoseTitle;

  /// No description provided for @copyTooltip.
  ///
  /// In es, this message translates to:
  /// **'Copiar'**
  String get copyTooltip;

  /// No description provided for @snackbarCopied.
  ///
  /// In es, this message translates to:
  /// **'\"{text}\" copiado al portapapeles'**
  String snackbarCopied(Object text);

  /// No description provided for @calcInfoTitle.
  ///
  /// In es, this message translates to:
  /// **'Información del Cálculo'**
  String get calcInfoTitle;

  /// No description provided for @calcTypeLabel.
  ///
  /// In es, this message translates to:
  /// **'Tipo:'**
  String get calcTypeLabel;

  /// No description provided for @calcMedicationLabel.
  ///
  /// In es, this message translates to:
  /// **'Medicamento:'**
  String get calcMedicationLabel;

  /// No description provided for @calcObservationsLabel.
  ///
  /// In es, this message translates to:
  /// **'Observaciones:'**
  String get calcObservationsLabel;

  /// No description provided for @notAvailable.
  ///
  /// In es, this message translates to:
  /// **'N/A'**
  String get notAvailable;

  /// No description provided for @bpAppBarTitle.
  ///
  /// In es, this message translates to:
  /// **'Presión Arterial'**
  String get bpAppBarTitle;

  /// No description provided for @bpColAge.
  ///
  /// In es, this message translates to:
  /// **'Edad'**
  String get bpColAge;

  /// No description provided for @bpColSystolic.
  ///
  /// In es, this message translates to:
  /// **'Sistólica'**
  String get bpColSystolic;

  /// No description provided for @bpColDiastolic.
  ///
  /// In es, this message translates to:
  /// **'Diastólica'**
  String get bpColDiastolic;

  /// No description provided for @bpColHypotensionSystolic.
  ///
  /// In es, this message translates to:
  /// **'Hipotensión\nsistólica'**
  String get bpColHypotensionSystolic;

  /// No description provided for @bpRowAge1to2.
  ///
  /// In es, this message translates to:
  /// **'1-2 años (Niñ@ pequeñ@)'**
  String get bpRowAge1to2;

  /// No description provided for @bpRowAge3to5.
  ///
  /// In es, this message translates to:
  /// **'3-5 años (Preescolar)'**
  String get bpRowAge3to5;

  /// No description provided for @bpRowAge6to9.
  ///
  /// In es, this message translates to:
  /// **'6-9 años (Edad escolar)'**
  String get bpRowAge6to9;

  /// No description provided for @bpRowAge10to11.
  ///
  /// In es, this message translates to:
  /// **'10-11 años (Preadolescente)'**
  String get bpRowAge10to11;

  /// No description provided for @bpRowAge12to15.
  ///
  /// In es, this message translates to:
  /// **'12-15 años (Adolescente)'**
  String get bpRowAge12to15;

  /// No description provided for @bpRowHypotensionFormula.
  ///
  /// In es, this message translates to:
  /// **'<70 + (edad × 2)'**
  String get bpRowHypotensionFormula;

  /// No description provided for @bpNoteFormula.
  ///
  /// In es, this message translates to:
  /// **'Nota: El umbral de hipotensión sistólica para las edades preescolar se calcula: 70 + (edad en años × 2).'**
  String get bpNoteFormula;

  /// No description provided for @bpNeoAppBarTitle.
  ///
  /// In es, this message translates to:
  /// **'Presión Arterial'**
  String get bpNeoAppBarTitle;

  /// No description provided for @bpNeoColAge.
  ///
  /// In es, this message translates to:
  /// **'Edad'**
  String get bpNeoColAge;

  /// No description provided for @bpNeoColSystolic.
  ///
  /// In es, this message translates to:
  /// **'Sistólico'**
  String get bpNeoColSystolic;

  /// No description provided for @bpNeoColDiastolic.
  ///
  /// In es, this message translates to:
  /// **'Diastólico'**
  String get bpNeoColDiastolic;

  /// No description provided for @bpNeoColHypotensionSystolic.
  ///
  /// In es, this message translates to:
  /// **'Hipotensión\nsistólica'**
  String get bpNeoColHypotensionSystolic;

  /// No description provided for @bpNeoRowBirth12hLt1kg.
  ///
  /// In es, this message translates to:
  /// **'Nacimiento (12 h) <1 kg'**
  String get bpNeoRowBirth12hLt1kg;

  /// No description provided for @bpNeoRowBirth12h3kg.
  ///
  /// In es, this message translates to:
  /// **'Nacimiento (12 h) 3 kg'**
  String get bpNeoRowBirth12h3kg;

  /// No description provided for @bpNeoRowNeonate96h.
  ///
  /// In es, this message translates to:
  /// **'Neonato (96 h)'**
  String get bpNeoRowNeonate96h;

  /// No description provided for @bpNeoRowInfant1to12mo.
  ///
  /// In es, this message translates to:
  /// **'Infante (1–12 meses)'**
  String get bpNeoRowInfant1to12mo;

  /// No description provided for @bpNeoNote.
  ///
  /// In es, this message translates to:
  /// **'Nota: Rangos normales y de hipotensión por edad (mmHg).'**
  String get bpNeoNote;

  /// No description provided for @hrAppBarTitle.
  ///
  /// In es, this message translates to:
  /// **'Frecuencia Cardíaca (latidos/min)'**
  String get hrAppBarTitle;

  /// No description provided for @hrColAge.
  ///
  /// In es, this message translates to:
  /// **'Edad'**
  String get hrColAge;

  /// No description provided for @hrColAwake.
  ///
  /// In es, this message translates to:
  /// **'Despierto'**
  String get hrColAwake;

  /// No description provided for @hrColAsleep.
  ///
  /// In es, this message translates to:
  /// **'Dormido'**
  String get hrColAsleep;

  /// No description provided for @hrRowToddler.
  ///
  /// In es, this message translates to:
  /// **'1–2 años (Niñ@ pequeñ@)'**
  String get hrRowToddler;

  /// No description provided for @hrRowPreschool.
  ///
  /// In es, this message translates to:
  /// **'3–5 años (Preescolar)'**
  String get hrRowPreschool;

  /// No description provided for @hrRowSchoolAge.
  ///
  /// In es, this message translates to:
  /// **'6–11 años (Edad escolar)'**
  String get hrRowSchoolAge;

  /// No description provided for @hrRowAdolescent.
  ///
  /// In es, this message translates to:
  /// **'12–15 años (Adolescente)'**
  String get hrRowAdolescent;

  /// No description provided for @hrNote.
  ///
  /// In es, this message translates to:
  /// **'Nota: Los rangos varían si el paciente está despierto o dormido.'**
  String get hrNote;

  /// No description provided for @hrInfantAppBarTitle.
  ///
  /// In es, this message translates to:
  /// **'Frecuencia Cardíaca (latidos/min)'**
  String get hrInfantAppBarTitle;

  /// No description provided for @hrInfantRowNeonate.
  ///
  /// In es, this message translates to:
  /// **'(<28 días) (RN)'**
  String get hrInfantRowNeonate;

  /// No description provided for @hrInfantRowInfant.
  ///
  /// In es, this message translates to:
  /// **'(1–12 meses) (Infante)'**
  String get hrInfantRowInfant;

  /// No description provided for @calculatedDoseTitle.
  ///
  /// In es, this message translates to:
  /// **'Dosis calculada para el paciente'**
  String get calculatedDoseTitle;

  /// No description provided for @medCategory.
  ///
  /// In es, this message translates to:
  /// **'Categoría:'**
  String get medCategory;

  /// No description provided for @medSubcategory.
  ///
  /// In es, this message translates to:
  /// **'Subcategoría:'**
  String get medSubcategory;

  /// No description provided for @medOriginalDoseRange.
  ///
  /// In es, this message translates to:
  /// **'Rango dosis original:'**
  String get medOriginalDoseRange;

  /// No description provided for @medPediatricDose.
  ///
  /// In es, this message translates to:
  /// **'Dosis pediátrica:'**
  String get medPediatricDose;

  /// No description provided for @medObservations.
  ///
  /// In es, this message translates to:
  /// **'Observaciones:'**
  String get medObservations;

  /// No description provided for @copy.
  ///
  /// In es, this message translates to:
  /// **'Copiar'**
  String get copy;

  /// No description provided for @printReport.
  ///
  /// In es, this message translates to:
  /// **'Imprimir reporte'**
  String get printReport;

  /// No description provided for @copiedText.
  ///
  /// In es, this message translates to:
  /// **'\"{text}\" copiado'**
  String copiedText(Object text);

  /// No description provided for @o2AppBarTitle.
  ///
  /// In es, this message translates to:
  /// **'Saturación de oxígeno (SpO₂)'**
  String get o2AppBarTitle;

  /// No description provided for @o2CardTitle.
  ///
  /// In es, this message translates to:
  /// **'Saturación de oxígeno (SpO₂)'**
  String get o2CardTitle;

  /// No description provided for @o2Paragraph1.
  ///
  /// In es, this message translates to:
  /// **'SpO₂ es menor en el período neonatal inmediato.'**
  String get o2Paragraph1;

  /// No description provided for @o2Paragraph2Part1.
  ///
  /// In es, this message translates to:
  /// **'Más allá de este período, una SpO₂ de '**
  String get o2Paragraph2Part1;

  /// No description provided for @o2ThresholdBold.
  ///
  /// In es, this message translates to:
  /// **'<90–92%'**
  String get o2ThresholdBold;

  /// No description provided for @o2Paragraph2Part2.
  ///
  /// In es, this message translates to:
  /// **' puede sugerir una '**
  String get o2Paragraph2Part2;

  /// No description provided for @o2RespConditionBold.
  ///
  /// In es, this message translates to:
  /// **'condición respiratoria'**
  String get o2RespConditionBold;

  /// No description provided for @o2Or.
  ///
  /// In es, this message translates to:
  /// **' o '**
  String get o2Or;

  /// No description provided for @o2CyanoticHeartBold.
  ///
  /// In es, this message translates to:
  /// **'cardiopatía cianótica.'**
  String get o2CyanoticHeartBold;

  /// No description provided for @o2Note.
  ///
  /// In es, this message translates to:
  /// **'La saturación de oxígeno se considera un signo vital clave para evaluar la oxigenación.'**
  String get o2Note;

  /// No description provided for @rrAppBarTitle.
  ///
  /// In es, this message translates to:
  /// **'Frecuencia Respiratoria'**
  String get rrAppBarTitle;

  /// No description provided for @rrCardTitle.
  ///
  /// In es, this message translates to:
  /// **'Rangos normales por edad'**
  String get rrCardTitle;

  /// No description provided for @rrTableHeaderAge.
  ///
  /// In es, this message translates to:
  /// **'Edad'**
  String get rrTableHeaderAge;

  /// No description provided for @rrTableHeaderNormal.
  ///
  /// In es, this message translates to:
  /// **'Normal'**
  String get rrTableHeaderNormal;

  /// No description provided for @rrAgeRow1.
  ///
  /// In es, this message translates to:
  /// **'1-2 años (Niñ@ pequeñ@)'**
  String get rrAgeRow1;

  /// No description provided for @rrAgeRow2.
  ///
  /// In es, this message translates to:
  /// **'3-5 años (Preescolar)'**
  String get rrAgeRow2;

  /// No description provided for @rrAgeRow3.
  ///
  /// In es, this message translates to:
  /// **'6-11 años (Edad escolar)'**
  String get rrAgeRow3;

  /// No description provided for @rrAgeRow4.
  ///
  /// In es, this message translates to:
  /// **'12-15 años (Adolescente)'**
  String get rrAgeRow4;

  /// No description provided for @rrSourceNote.
  ///
  /// In es, this message translates to:
  /// **'Fuente: Guías de Referencia Pediátrica.'**
  String get rrSourceNote;

  /// No description provided for @rrAppBarTitleWithUnit.
  ///
  /// In es, this message translates to:
  /// **'Frecuencia Respiratoria (respiraciones/min)'**
  String get rrAppBarTitleWithUnit;

  /// No description provided for @rrAgeInfant.
  ///
  /// In es, this message translates to:
  /// **'(<1 año) (RN)'**
  String get rrAgeInfant;

  /// No description provided for @rrAgeToddler.
  ///
  /// In es, this message translates to:
  /// **'(1–2 años) (niños)'**
  String get rrAgeToddler;

  /// No description provided for @tempAppBarTitleByMethod.
  ///
  /// In es, this message translates to:
  /// **'Temperatura (por método)'**
  String get tempAppBarTitleByMethod;

  /// No description provided for @tempCardTitleNormalRangesByMethod.
  ///
  /// In es, this message translates to:
  /// **'Rangos normales por método'**
  String get tempCardTitleNormalRangesByMethod;

  /// No description provided for @tempTableHeaderMethod.
  ///
  /// In es, this message translates to:
  /// **'Método'**
  String get tempTableHeaderMethod;

  /// No description provided for @tempTableHeaderNormal.
  ///
  /// In es, this message translates to:
  /// **'Normal'**
  String get tempTableHeaderNormal;

  /// No description provided for @tempMethodRectal.
  ///
  /// In es, this message translates to:
  /// **'Rectal'**
  String get tempMethodRectal;

  /// No description provided for @tempMethodTympanic.
  ///
  /// In es, this message translates to:
  /// **'Timpánica'**
  String get tempMethodTympanic;

  /// No description provided for @tempMethodOral.
  ///
  /// In es, this message translates to:
  /// **'Oral'**
  String get tempMethodOral;

  /// No description provided for @tempMethodAxillary.
  ///
  /// In es, this message translates to:
  /// **'Axilar'**
  String get tempMethodAxillary;

  /// No description provided for @tempNoteRangesDoNotVary.
  ///
  /// In es, this message translates to:
  /// **'Rangos no varían con la edad.'**
  String get tempNoteRangesDoNotVary;

  /// No description provided for @tempGuideScreeningLabel.
  ///
  /// In es, this message translates to:
  /// **'Tamizaje:'**
  String get tempGuideScreeningLabel;

  /// No description provided for @tempGuideScreeningText.
  ///
  /// In es, this message translates to:
  /// **'axilar, temporal, timpánica (↓ precisión)'**
  String get tempGuideScreeningText;

  /// No description provided for @tempGuideDefinitiveLabel.
  ///
  /// In es, this message translates to:
  /// **'Definitiva:'**
  String get tempGuideDefinitiveLabel;

  /// No description provided for @tempGuideDefinitiveText.
  ///
  /// In es, this message translates to:
  /// **'rectal & oral (↑ reflejo de la temperatura central)'**
  String get tempGuideDefinitiveText;

  /// No description provided for @tempReferenceCps2015.
  ///
  /// In es, this message translates to:
  /// **'Referencia: Declaración de posición de la CPS sobre la medición de la temperatura en pediatría (2015)'**
  String get tempReferenceCps2015;

  /// No description provided for @tempAppBarTitleCelsiusByMethod.
  ///
  /// In es, this message translates to:
  /// **'Temperatura (°C) (Por método)'**
  String get tempAppBarTitleCelsiusByMethod;

  /// No description provided for @tempGuideScreeningTextAlt.
  ///
  /// In es, this message translates to:
  /// **'axilar, temporal, tímpano (↓ precisión)'**
  String get tempGuideScreeningTextAlt;

  /// No description provided for @tempReferenceCps2015Alt.
  ///
  /// In es, this message translates to:
  /// **'Referencia: CPS Declaración de posición sobre la medición de la temperatura en pediatría (2015)'**
  String get tempReferenceCps2015Alt;

  /// No description provided for @bpWomenTitle.
  ///
  /// In es, this message translates to:
  /// **'Presión Arterial Mujeres'**
  String get bpWomenTitle;

  /// No description provided for @bpColMin.
  ///
  /// In es, this message translates to:
  /// **'Mínima'**
  String get bpColMin;

  /// No description provided for @bpColMean.
  ///
  /// In es, this message translates to:
  /// **'Media'**
  String get bpColMean;

  /// No description provided for @bpColMax.
  ///
  /// In es, this message translates to:
  /// **'Máxima'**
  String get bpColMax;

  /// No description provided for @bpGroupSystolicDiastolic.
  ///
  /// In es, this message translates to:
  /// **'Presión arterial\nsistólica/diastólica'**
  String get bpGroupSystolicDiastolic;

  /// No description provided for @bpGroupMeanArterialPressure.
  ///
  /// In es, this message translates to:
  /// **'Presión arterial\nmedia'**
  String get bpGroupMeanArterialPressure;

  /// No description provided for @bpAgeLt7Days.
  ///
  /// In es, this message translates to:
  /// **'<7 días'**
  String get bpAgeLt7Days;

  /// No description provided for @bpAge8to30Days.
  ///
  /// In es, this message translates to:
  /// **'8-30 días'**
  String get bpAge8to30Days;

  /// No description provided for @bpAge1to5Months.
  ///
  /// In es, this message translates to:
  /// **'1-5 meses'**
  String get bpAge1to5Months;

  /// No description provided for @bpAge6to11Months.
  ///
  /// In es, this message translates to:
  /// **'6-11 meses'**
  String get bpAge6to11Months;

  /// No description provided for @bpFormulasTitle.
  ///
  /// In es, this message translates to:
  /// **'Fórmulas de Presión Arterial'**
  String get bpFormulasTitle;

  /// No description provided for @bpFormulaLine1.
  ///
  /// In es, this message translates to:
  /// **'Presión arterial media = (presión diastólica) + (presión sistólica - presión diastólica) / 3'**
  String get bpFormulaLine1;

  /// No description provided for @bpFormulaLine2.
  ///
  /// In es, this message translates to:
  /// **'o PAM = PD + (PS-PD)/3'**
  String get bpFormulaLine2;

  /// No description provided for @bpFormulaLine3.
  ///
  /// In es, this message translates to:
  /// **'o PAM = (PS + (2xPD)) / 3'**
  String get bpFormulaLine3;

  /// No description provided for @bpAge1y.
  ///
  /// In es, this message translates to:
  /// **'1 año'**
  String get bpAge1y;

  /// No description provided for @bpAge2y.
  ///
  /// In es, this message translates to:
  /// **'2 años'**
  String get bpAge2y;

  /// No description provided for @bpAge3y.
  ///
  /// In es, this message translates to:
  /// **'3 años'**
  String get bpAge3y;

  /// No description provided for @bpAge4y.
  ///
  /// In es, this message translates to:
  /// **'4 años'**
  String get bpAge4y;

  /// No description provided for @bpAge5y.
  ///
  /// In es, this message translates to:
  /// **'5 años'**
  String get bpAge5y;

  /// No description provided for @bpAge6y.
  ///
  /// In es, this message translates to:
  /// **'6 años'**
  String get bpAge6y;

  /// No description provided for @bpAge7y.
  ///
  /// In es, this message translates to:
  /// **'7 años'**
  String get bpAge7y;

  /// No description provided for @bpAge8y.
  ///
  /// In es, this message translates to:
  /// **'8 años'**
  String get bpAge8y;

  /// No description provided for @bpAge9y.
  ///
  /// In es, this message translates to:
  /// **'9 años'**
  String get bpAge9y;

  /// No description provided for @bpAge10y.
  ///
  /// In es, this message translates to:
  /// **'10 años'**
  String get bpAge10y;

  /// No description provided for @bpAge11y.
  ///
  /// In es, this message translates to:
  /// **'11 años'**
  String get bpAge11y;

  /// No description provided for @bpAge12y.
  ///
  /// In es, this message translates to:
  /// **'12 años'**
  String get bpAge12y;

  /// No description provided for @bpAge13y.
  ///
  /// In es, this message translates to:
  /// **'13 años'**
  String get bpAge13y;

  /// No description provided for @bpAge14y.
  ///
  /// In es, this message translates to:
  /// **'14 años'**
  String get bpAge14y;

  /// No description provided for @bpAge15y.
  ///
  /// In es, this message translates to:
  /// **'15 años'**
  String get bpAge15y;

  /// No description provided for @bpAge16y.
  ///
  /// In es, this message translates to:
  /// **'16 años'**
  String get bpAge16y;

  /// No description provided for @bpAge17y.
  ///
  /// In es, this message translates to:
  /// **'17 años'**
  String get bpAge17y;

  /// No description provided for @bpAge18y.
  ///
  /// In es, this message translates to:
  /// **'18 años'**
  String get bpAge18y;

  /// No description provided for @bpAge19y.
  ///
  /// In es, this message translates to:
  /// **'19 años'**
  String get bpAge19y;

  /// No description provided for @bpMenTitle.
  ///
  /// In es, this message translates to:
  /// **'Presión Arterial Hombres'**
  String get bpMenTitle;

  /// No description provided for @bpAge8To30Days.
  ///
  /// In es, this message translates to:
  /// **'8-30 días'**
  String get bpAge8To30Days;

  /// No description provided for @bpAge1To5Months.
  ///
  /// In es, this message translates to:
  /// **'1-5 meses'**
  String get bpAge1To5Months;

  /// No description provided for @bpAge6To11Months.
  ///
  /// In es, this message translates to:
  /// **'6-11 meses'**
  String get bpAge6To11Months;

  /// No description provided for @bpMenNote.
  ///
  /// In es, this message translates to:
  /// **'Nota: no se programa el intervalo de tiempo en que se toma la presión arterial media de acuerdo con las condiciones del paciente, de 15 minutos para los casos graves a 24 horas para los estables. Cuando la presión arterial media baje por debajo del nivel mínimo, se debe iniciar la infusión de cristaloides, según el protocolo. Cuando la presión arterial media tiende a elevarse por encima de la máxima normal, hay que suspender la infusión de líquidos para evitar la sobrecarga de volumen.'**
  String get bpMenNote;

  /// No description provided for @bpAge1Year.
  ///
  /// In es, this message translates to:
  /// **'1 año'**
  String get bpAge1Year;

  /// No description provided for @bpAge2Years.
  ///
  /// In es, this message translates to:
  /// **'2 años'**
  String get bpAge2Years;

  /// No description provided for @bpAge3Years.
  ///
  /// In es, this message translates to:
  /// **'3 años'**
  String get bpAge3Years;

  /// No description provided for @bpAge4Years.
  ///
  /// In es, this message translates to:
  /// **'4 años'**
  String get bpAge4Years;

  /// No description provided for @bpAge5Years.
  ///
  /// In es, this message translates to:
  /// **'5 años'**
  String get bpAge5Years;

  /// No description provided for @bpAge6Years.
  ///
  /// In es, this message translates to:
  /// **'6 años'**
  String get bpAge6Years;

  /// No description provided for @bpAge7Years.
  ///
  /// In es, this message translates to:
  /// **'7 años'**
  String get bpAge7Years;

  /// No description provided for @bpAge8Years.
  ///
  /// In es, this message translates to:
  /// **'8 años'**
  String get bpAge8Years;

  /// No description provided for @bpAge9Years.
  ///
  /// In es, this message translates to:
  /// **'9 años'**
  String get bpAge9Years;

  /// No description provided for @bpAge10Years.
  ///
  /// In es, this message translates to:
  /// **'10 años'**
  String get bpAge10Years;

  /// No description provided for @bpAge11Years.
  ///
  /// In es, this message translates to:
  /// **'11 años'**
  String get bpAge11Years;

  /// No description provided for @bpAge12Years.
  ///
  /// In es, this message translates to:
  /// **'12 años'**
  String get bpAge12Years;

  /// No description provided for @bpAge13Years.
  ///
  /// In es, this message translates to:
  /// **'13 años'**
  String get bpAge13Years;

  /// No description provided for @bpAge14Years.
  ///
  /// In es, this message translates to:
  /// **'14 años'**
  String get bpAge14Years;

  /// No description provided for @bpAge15Years.
  ///
  /// In es, this message translates to:
  /// **'15 años'**
  String get bpAge15Years;

  /// No description provided for @bpAge16Years.
  ///
  /// In es, this message translates to:
  /// **'16 años'**
  String get bpAge16Years;

  /// No description provided for @bpAge17Years.
  ///
  /// In es, this message translates to:
  /// **'17 años'**
  String get bpAge17Years;

  /// No description provided for @bpAge18Years.
  ///
  /// In es, this message translates to:
  /// **'18 años'**
  String get bpAge18Years;

  /// No description provided for @bpAge19Years.
  ///
  /// In es, this message translates to:
  /// **'19 años'**
  String get bpAge19Years;

  /// No description provided for @catAnaphylaxis.
  ///
  /// In es, this message translates to:
  /// **'Anafilaxia'**
  String get catAnaphylaxis;

  /// No description provided for @catAnalgesia.
  ///
  /// In es, this message translates to:
  /// **'Analgesia'**
  String get catAnalgesia;

  /// No description provided for @catAntibiotics.
  ///
  /// In es, this message translates to:
  /// **'Antibióticos'**
  String get catAntibiotics;

  /// No description provided for @medAnaEpiImStandard.
  ///
  /// In es, this message translates to:
  /// **'Adrenalina IM'**
  String get medAnaEpiImStandard;

  /// No description provided for @medAnaEpiImWeightBased.
  ///
  /// In es, this message translates to:
  /// **'Adrenalina IM.'**
  String get medAnaEpiImWeightBased;

  /// No description provided for @medAnalgesiaFentanyl.
  ///
  /// In es, this message translates to:
  /// **'Fentanilo'**
  String get medAnalgesiaFentanyl;

  /// No description provided for @medAnalgesiaMorphine.
  ///
  /// In es, this message translates to:
  /// **'Morfina'**
  String get medAnalgesiaMorphine;

  /// No description provided for @medAnalgesiaKetamine.
  ///
  /// In es, this message translates to:
  /// **'Ketamina'**
  String get medAnalgesiaKetamine;

  /// No description provided for @medAbxAmpicillin.
  ///
  /// In es, this message translates to:
  /// **'Ampicilina'**
  String get medAbxAmpicillin;

  /// No description provided for @medAbxCefotaxime.
  ///
  /// In es, this message translates to:
  /// **'Cefotaxima'**
  String get medAbxCefotaxime;

  /// No description provided for @medAbxCeftazidime.
  ///
  /// In es, this message translates to:
  /// **'Ceftazidime'**
  String get medAbxCeftazidime;

  /// No description provided for @medAbxMeropenem.
  ///
  /// In es, this message translates to:
  /// **'Meropenem'**
  String get medAbxMeropenem;

  /// No description provided for @medAbxVancomycin.
  ///
  /// In es, this message translates to:
  /// **'Vancomicina'**
  String get medAbxVancomycin;

  /// No description provided for @medAbxAcyclovir.
  ///
  /// In es, this message translates to:
  /// **'Aciclovir'**
  String get medAbxAcyclovir;

  /// No description provided for @medAbxPipTazo.
  ///
  /// In es, this message translates to:
  /// **'Pipe-tazo'**
  String get medAbxPipTazo;

  /// No description provided for @medAbxAmoxClav.
  ///
  /// In es, this message translates to:
  /// **'Amoxicilina-clavulanato'**
  String get medAbxAmoxClav;

  /// No description provided for @medAbxAmikacin.
  ///
  /// In es, this message translates to:
  /// **'Amikacina'**
  String get medAbxAmikacin;

  /// No description provided for @medAbxClindamycin.
  ///
  /// In es, this message translates to:
  /// **'Clindamicina'**
  String get medAbxClindamycin;

  /// No description provided for @medAnaEpiImStandardRange.
  ///
  /// In es, this message translates to:
  /// **'1mg/ml (1:1000)'**
  String get medAnaEpiImStandardRange;

  /// No description provided for @medAnaEpiImStandardDose.
  ///
  /// In es, this message translates to:
  /// **'0,01 mg/kg'**
  String get medAnaEpiImStandardDose;

  /// No description provided for @medAnaEpiImStandardNotes.
  ///
  /// In es, this message translates to:
  /// **'Máximo 0.5 ml'**
  String get medAnaEpiImStandardNotes;

  /// No description provided for @medAnaEpiImWeightBasedRange.
  ///
  /// In es, this message translates to:
  /// **'1mg/ml (1:1000) <= 30kg'**
  String get medAnaEpiImWeightBasedRange;

  /// No description provided for @medAnaEpiImWeightBasedDose.
  ///
  /// In es, this message translates to:
  /// **''**
  String get medAnaEpiImWeightBasedDose;

  /// No description provided for @medAnaEpiImWeightBasedNotes.
  ///
  /// In es, this message translates to:
  /// **'1mg/ml (1:1000) >30kg'**
  String get medAnaEpiImWeightBasedNotes;

  /// No description provided for @medAnalgesiaFentanylRange.
  ///
  /// In es, this message translates to:
  /// **'(50mcg/ml; 2ml)'**
  String get medAnalgesiaFentanylRange;

  /// No description provided for @medAnalgesiaFentanylDose.
  ///
  /// In es, this message translates to:
  /// **'1-5 mcg/kg'**
  String get medAnalgesiaFentanylDose;

  /// No description provided for @medAnalgesiaFentanylNotes.
  ///
  /// In es, this message translates to:
  /// **'Puede duplicar la dosis.'**
  String get medAnalgesiaFentanylNotes;

  /// No description provided for @medAnalgesiaMorphineRange.
  ///
  /// In es, this message translates to:
  /// **'(15mg/ml; 1ml) (1ml + 14cc SF)'**
  String get medAnalgesiaMorphineRange;

  /// No description provided for @medAnalgesiaMorphineDose.
  ///
  /// In es, this message translates to:
  /// **'0,1 mg/kg'**
  String get medAnalgesiaMorphineDose;

  /// No description provided for @medAnalgesiaMorphineNotes.
  ///
  /// In es, this message translates to:
  /// **'Puede duplicar la dosis.'**
  String get medAnalgesiaMorphineNotes;

  /// No description provided for @medAnalgesiaKetamineRange.
  ///
  /// In es, this message translates to:
  /// **'(10mg/ml; 20ml)'**
  String get medAnalgesiaKetamineRange;

  /// No description provided for @medAnalgesiaKetamineDose.
  ///
  /// In es, this message translates to:
  /// **'1-2 mg/kg'**
  String get medAnalgesiaKetamineDose;

  /// No description provided for @medAnalgesiaKetamineNotes.
  ///
  /// In es, this message translates to:
  /// **'Puede duplicar la dosis.'**
  String get medAnalgesiaKetamineNotes;

  /// No description provided for @medAbxAmpicillinRange.
  ///
  /// In es, this message translates to:
  /// **'25-50mg/Kg/dosis'**
  String get medAbxAmpicillinRange;

  /// No description provided for @medAbxAmpicillinDose.
  ///
  /// In es, this message translates to:
  /// **'cada 6 h'**
  String get medAbxAmpicillinDose;

  /// No description provided for @medAbxAmpicillinNotes.
  ///
  /// In es, this message translates to:
  /// **'Máximo: 3g/dosis'**
  String get medAbxAmpicillinNotes;

  /// No description provided for @medAbxCefotaximeRange.
  ///
  /// In es, this message translates to:
  /// **'50mg/kg/dosis'**
  String get medAbxCefotaximeRange;

  /// No description provided for @medAbxCefotaximeDose.
  ///
  /// In es, this message translates to:
  /// **'cada 8 h ó cada 6 h'**
  String get medAbxCefotaximeDose;

  /// No description provided for @medAbxCefotaximeNotes.
  ///
  /// In es, this message translates to:
  /// **'Máximo: 2-4g/dosis'**
  String get medAbxCefotaximeNotes;

  /// No description provided for @medAbxCeftazidimeRange.
  ///
  /// In es, this message translates to:
  /// **'50mg/kg/dosis'**
  String get medAbxCeftazidimeRange;

  /// No description provided for @medAbxCeftazidimeDose.
  ///
  /// In es, this message translates to:
  /// **'cada 8 h'**
  String get medAbxCeftazidimeDose;

  /// No description provided for @medAbxCeftazidimeNotes.
  ///
  /// In es, this message translates to:
  /// **'Máximo: 6g/d'**
  String get medAbxCeftazidimeNotes;

  /// No description provided for @medAbxMeropenemRange.
  ///
  /// In es, this message translates to:
  /// **'60mg/kg/día'**
  String get medAbxMeropenemRange;

  /// No description provided for @medAbxMeropenemDose.
  ///
  /// In es, this message translates to:
  /// **'cada 8 h'**
  String get medAbxMeropenemDose;

  /// No description provided for @medAbxMeropenemNotes.
  ///
  /// In es, this message translates to:
  /// **'Máximo: 1g/dosis'**
  String get medAbxMeropenemNotes;

  /// No description provided for @medAbxVancomycinRange.
  ///
  /// In es, this message translates to:
  /// **'15mg/kg/dosis'**
  String get medAbxVancomycinRange;

  /// No description provided for @medAbxVancomycinDose.
  ///
  /// In es, this message translates to:
  /// **'cada 6 h'**
  String get medAbxVancomycinDose;

  /// No description provided for @medAbxVancomycinNotes.
  ///
  /// In es, this message translates to:
  /// **'Máximo: 500mg/dosis'**
  String get medAbxVancomycinNotes;

  /// No description provided for @medAbxAcyclovirRange.
  ///
  /// In es, this message translates to:
  /// **'60mg/kg/día'**
  String get medAbxAcyclovirRange;

  /// No description provided for @medAbxAcyclovirDose.
  ///
  /// In es, this message translates to:
  /// **'cada 8 h'**
  String get medAbxAcyclovirDose;

  /// No description provided for @medAbxAcyclovirNotes.
  ///
  /// In es, this message translates to:
  /// **'Máximo: 1 g'**
  String get medAbxAcyclovirNotes;

  /// No description provided for @medAbxPipTazoRange.
  ///
  /// In es, this message translates to:
  /// **'300mg/kg/día'**
  String get medAbxPipTazoRange;

  /// No description provided for @medAbxPipTazoDose.
  ///
  /// In es, this message translates to:
  /// **'cada 8 h'**
  String get medAbxPipTazoDose;

  /// No description provided for @medAbxPipTazoNotes.
  ///
  /// In es, this message translates to:
  /// **''**
  String get medAbxPipTazoNotes;

  /// No description provided for @medAbxAmoxClavRange.
  ///
  /// In es, this message translates to:
  /// **'90mg/kg/día'**
  String get medAbxAmoxClavRange;

  /// No description provided for @medAbxAmoxClavDose.
  ///
  /// In es, this message translates to:
  /// **'cada 12 h'**
  String get medAbxAmoxClavDose;

  /// No description provided for @medAbxAmoxClavNotes.
  ///
  /// In es, this message translates to:
  /// **''**
  String get medAbxAmoxClavNotes;

  /// No description provided for @medAbxAmikacinRange.
  ///
  /// In es, this message translates to:
  /// **'22,5 mg/kg/día'**
  String get medAbxAmikacinRange;

  /// No description provided for @medAbxAmikacinDose.
  ///
  /// In es, this message translates to:
  /// **'cada día'**
  String get medAbxAmikacinDose;

  /// No description provided for @medAbxAmikacinNotes.
  ///
  /// In es, this message translates to:
  /// **''**
  String get medAbxAmikacinNotes;

  /// No description provided for @medAbxClindamycinRange.
  ///
  /// In es, this message translates to:
  /// **'40mg/kg/día'**
  String get medAbxClindamycinRange;

  /// No description provided for @medAbxClindamycinDose.
  ///
  /// In es, this message translates to:
  /// **'cada 8 h'**
  String get medAbxClindamycinDose;

  /// No description provided for @medAbxClindamycinNotes.
  ///
  /// In es, this message translates to:
  /// **''**
  String get medAbxClindamycinNotes;

  /// No description provided for @calcTypeSodium.
  ///
  /// In es, this message translates to:
  /// **'Sodio'**
  String get calcTypeSodium;

  /// No description provided for @calcTypeHco3.
  ///
  /// In es, this message translates to:
  /// **'HCO3'**
  String get calcTypeHco3;

  /// No description provided for @calcTypeIvFluids.
  ///
  /// In es, this message translates to:
  /// **'Líquidos IV'**
  String get calcTypeIvFluids;

  /// No description provided for @specNaPatient.
  ///
  /// In es, this message translates to:
  /// **'Sodio del paciente'**
  String get specNaPatient;

  /// No description provided for @specNaDeficit.
  ///
  /// In es, this message translates to:
  /// **'Déficit de sodio'**
  String get specNaDeficit;

  /// No description provided for @specNaSg5Volume.
  ///
  /// In es, this message translates to:
  /// **'Volumen de SG 5%'**
  String get specNaSg5Volume;

  /// No description provided for @specNaWithNs.
  ///
  /// In es, this message translates to:
  /// **'Con SF'**
  String get specNaWithNs;

  /// No description provided for @specNaInfusionRate.
  ///
  /// In es, this message translates to:
  /// **'Velocidad de infusión'**
  String get specNaInfusionRate;

  /// No description provided for @specHco3Patient.
  ///
  /// In es, this message translates to:
  /// **'HCO₃ del paciente'**
  String get specHco3Patient;

  /// No description provided for @specHco3Deficit.
  ///
  /// In es, this message translates to:
  /// **'Déficit de HCO₃'**
  String get specHco3Deficit;

  /// No description provided for @specHco3Sg5Volume.
  ///
  /// In es, this message translates to:
  /// **'Volumen de SG 5% para diluir déficit de HCO₃'**
  String get specHco3Sg5Volume;

  /// No description provided for @specHco3InfusionRate.
  ///
  /// In es, this message translates to:
  /// **'Velocidad de infusión'**
  String get specHco3InfusionRate;

  /// No description provided for @specIvMixedSolution.
  ///
  /// In es, this message translates to:
  /// **'Solución mixta de mantenimiento'**
  String get specIvMixedSolution;

  /// No description provided for @specIvPercentInfoTitle.
  ///
  /// In es, this message translates to:
  /// **'Cálculo de porcentaje'**
  String get specIvPercentInfoTitle;

  /// No description provided for @specIvResult.
  ///
  /// In es, this message translates to:
  /// **'Resultado'**
  String get specIvResult;

  /// No description provided for @specIvDrip.
  ///
  /// In es, this message translates to:
  /// **'Goteo'**
  String get specIvDrip;

  /// No description provided for @specIvDripAdjusted.
  ///
  /// In es, this message translates to:
  /// **'Goteo (ajustado)'**
  String get specIvDripAdjusted;

  /// No description provided for @bottomVitals.
  ///
  /// In es, this message translates to:
  /// **'SING V'**
  String get bottomVitals;

  /// No description provided for @bottomPam.
  ///
  /// In es, this message translates to:
  /// **'PAM'**
  String get bottomPam;

  /// No description provided for @catAntidotes.
  ///
  /// In es, this message translates to:
  /// **'Antídotos'**
  String get catAntidotes;

  /// No description provided for @catAsthma.
  ///
  /// In es, this message translates to:
  /// **'Asma'**
  String get catAsthma;

  /// No description provided for @catBradyarrhythmias.
  ///
  /// In es, this message translates to:
  /// **'Bradiarritmias'**
  String get catBradyarrhythmias;

  /// No description provided for @catHighFlowNasalCannula.
  ///
  /// In es, this message translates to:
  /// **'Cánulas de alto flujo'**
  String get catHighFlowNasalCannula;

  /// No description provided for @medAntidoteNaloxone.
  ///
  /// In es, this message translates to:
  /// **'Naloxona'**
  String get medAntidoteNaloxone;

  /// No description provided for @medAntidoteNaloxoneRange.
  ///
  /// In es, this message translates to:
  /// **'0,4 mg/ml'**
  String get medAntidoteNaloxoneRange;

  /// No description provided for @medAntidoteNaloxoneDose.
  ///
  /// In es, this message translates to:
  /// **'0,01 mg/kg'**
  String get medAntidoteNaloxoneDose;

  /// No description provided for @medAntidoteNaloxoneNotes.
  ///
  /// In es, this message translates to:
  /// **'Antídoto de opioides'**
  String get medAntidoteNaloxoneNotes;

  /// No description provided for @medAntidoteFlumazenil.
  ///
  /// In es, this message translates to:
  /// **'Flumazenil'**
  String get medAntidoteFlumazenil;

  /// No description provided for @medAntidoteFlumazenilRange.
  ///
  /// In es, this message translates to:
  /// **'0,1 mg/ml'**
  String get medAntidoteFlumazenilRange;

  /// No description provided for @medAntidoteFlumazenilDose.
  ///
  /// In es, this message translates to:
  /// **'0,01 mg/kg'**
  String get medAntidoteFlumazenilDose;

  /// No description provided for @medAntidoteFlumazenilNotes.
  ///
  /// In es, this message translates to:
  /// **'Antídoto de benzodiacepinas'**
  String get medAntidoteFlumazenilNotes;

  /// No description provided for @medAsthmaSalbutamol1to5.
  ///
  /// In es, this message translates to:
  /// **'Salbutamol 1–5 años'**
  String get medAsthmaSalbutamol1to5;

  /// No description provided for @medAsthmaSalbutamol1to5Notes.
  ///
  /// In es, this message translates to:
  /// **'Máximo #6 nebulizaciones'**
  String get medAsthmaSalbutamol1to5Notes;

  /// No description provided for @medAsthmaSalbutamolOver5.
  ///
  /// In es, this message translates to:
  /// **'Salbutamol > 5 años'**
  String get medAsthmaSalbutamolOver5;

  /// No description provided for @medAsthmaSalbutamolOver5Notes.
  ///
  /// In es, this message translates to:
  /// **'Máximo #6 nebulizaciones'**
  String get medAsthmaSalbutamolOver5Notes;

  /// No description provided for @medAsthmaAtrovent2to5.
  ///
  /// In es, this message translates to:
  /// **'Atrovent 2–5 años'**
  String get medAsthmaAtrovent2to5;

  /// No description provided for @medAsthmaAtrovent2to5Notes.
  ///
  /// In es, this message translates to:
  /// **'Máximo #3 nebulizaciones'**
  String get medAsthmaAtrovent2to5Notes;

  /// No description provided for @medAsthmaAtroventOver5.
  ///
  /// In es, this message translates to:
  /// **'Atrovent > 5 años'**
  String get medAsthmaAtroventOver5;

  /// No description provided for @medAsthmaAtroventOver5Notes.
  ///
  /// In es, this message translates to:
  /// **'Máximo #3 nebulizaciones'**
  String get medAsthmaAtroventOver5Notes;

  /// No description provided for @medAsthmaPrednisone.
  ///
  /// In es, this message translates to:
  /// **'Prednisona'**
  String get medAsthmaPrednisone;

  /// No description provided for @medAsthmaPrednisoneDose.
  ///
  /// In es, this message translates to:
  /// **'1–2 mg/kg por 3–5 días'**
  String get medAsthmaPrednisoneDose;

  /// No description provided for @medAsthmaPrednisoneNotes.
  ///
  /// In es, this message translates to:
  /// **'Máximo 50 mg'**
  String get medAsthmaPrednisoneNotes;

  /// No description provided for @medAsthmaDexamethasoneIV.
  ///
  /// In es, this message translates to:
  /// **'Dexametasona IV'**
  String get medAsthmaDexamethasoneIV;

  /// No description provided for @medAsthmaDexamethasoneIVRange.
  ///
  /// In es, this message translates to:
  /// **'(4 mg/ml)'**
  String get medAsthmaDexamethasoneIVRange;

  /// No description provided for @medAsthmaDexamethasoneIVDose.
  ///
  /// In es, this message translates to:
  /// **'cada 6 h IV por 3–5 días'**
  String get medAsthmaDexamethasoneIVDose;

  /// No description provided for @medAsthmaHydrocortisoneIV.
  ///
  /// In es, this message translates to:
  /// **'Hidrocortisona IV'**
  String get medAsthmaHydrocortisoneIV;

  /// No description provided for @medAsthmaHydrocortisoneIVRange.
  ///
  /// In es, this message translates to:
  /// **'(50 mg/ml; 2 ml)'**
  String get medAsthmaHydrocortisoneIVRange;

  /// No description provided for @medAsthmaHydrocortisoneIVDose.
  ///
  /// In es, this message translates to:
  /// **'Max: 100 mg; (cada 6 h 1er día) (cada 12 h 2do día) (cada 24 h 3er día)'**
  String get medAsthmaHydrocortisoneIVDose;

  /// No description provided for @medAsthmaMethylprednisolone.
  ///
  /// In es, this message translates to:
  /// **'Metilprednisolona'**
  String get medAsthmaMethylprednisolone;

  /// No description provided for @medAsthmaMethylprednisoloneRange.
  ///
  /// In es, this message translates to:
  /// **'(Dosis de carga: 2 mg/kg)'**
  String get medAsthmaMethylprednisoloneRange;

  /// No description provided for @medAsthmaMethylprednisoloneDose.
  ///
  /// In es, this message translates to:
  /// **'Max: 60 mg; Mantenimiento: 1 mg/kg/dosis (c/6 h 1er día); (c/12 h 2do día) y (c/24 h 3er día)'**
  String get medAsthmaMethylprednisoloneDose;

  /// No description provided for @medAsthmaMagnesiumSulfate.
  ///
  /// In es, this message translates to:
  /// **'Sulfato de magnesio'**
  String get medAsthmaMagnesiumSulfate;

  /// No description provided for @medAsthmaMagnesiumSulfateRange.
  ///
  /// In es, this message translates to:
  /// **'(200 mg/ml; 10 ml)'**
  String get medAsthmaMagnesiumSulfateRange;

  /// No description provided for @medAsthmaMagnesiumSulfateDose.
  ///
  /// In es, this message translates to:
  /// **'En 100 cc SF a pasar en 20 min IV (Máximo 2 dosis)'**
  String get medAsthmaMagnesiumSulfateDose;

  /// No description provided for @medAsthmaMagnesiumSulfateNotes.
  ///
  /// In es, this message translates to:
  /// **'Máximo: 2 g.'**
  String get medAsthmaMagnesiumSulfateNotes;

  /// No description provided for @medBradyEpinephrineIV.
  ///
  /// In es, this message translates to:
  /// **'Adrenalina IV'**
  String get medBradyEpinephrineIV;

  /// No description provided for @medBradyEpinephrineIVRange.
  ///
  /// In es, this message translates to:
  /// **'1 mg/ml (1 ml + 9 ml SF)'**
  String get medBradyEpinephrineIVRange;

  /// No description provided for @medBradyEpinephrineIVDose.
  ///
  /// In es, this message translates to:
  /// **'(1 ml = 0,1 mg) (0,01 mg/kg)'**
  String get medBradyEpinephrineIVDose;

  /// No description provided for @medBradyEpinephrineIVNotes.
  ///
  /// In es, this message translates to:
  /// **'Máximo 10 ml'**
  String get medBradyEpinephrineIVNotes;

  /// No description provided for @medBradyAtropine.
  ///
  /// In es, this message translates to:
  /// **'Atropina'**
  String get medBradyAtropine;

  /// No description provided for @medBradyAtropineRange.
  ///
  /// In es, this message translates to:
  /// **'0,5 mg/ml (Diluir 2 ml + 8 cc SF)'**
  String get medBradyAtropineRange;

  /// No description provided for @medBradyAtropineDose.
  ///
  /// In es, this message translates to:
  /// **'(1 ml = 0,1 mg) (0,02 mg/kg)'**
  String get medBradyAtropineDose;

  /// No description provided for @medHfncFlow.
  ///
  /// In es, this message translates to:
  /// **'Flujo'**
  String get medHfncFlow;

  /// No description provided for @medHfncFlowDose.
  ///
  /// In es, this message translates to:
  /// **'Modificar FiO2 para saturación mayor a 94%'**
  String get medHfncFlowDose;

  /// No description provided for @medHfncFlowNotes.
  ///
  /// In es, this message translates to:
  /// **'FiO2 inicia 50%'**
  String get medHfncFlowNotes;

  /// No description provided for @medHfncCannulaSizeByWeight.
  ///
  /// In es, this message translates to:
  /// **'Talla de cánula según peso'**
  String get medHfncCannulaSizeByWeight;

  /// No description provided for @medHfncCannulaSizeByWeightNotes.
  ///
  /// In es, this message translates to:
  /// **'La \"X\" son las tallas posibles a utilizar según el peso del paciente'**
  String get medHfncCannulaSizeByWeightNotes;

  /// No description provided for @printPageOfLabel.
  ///
  /// In es, this message translates to:
  /// **'de'**
  String get printPageOfLabel;

  /// No description provided for @catCalciumMaintenance.
  ///
  /// In es, this message translates to:
  /// **'Calcio de mantenimiento'**
  String get catCalciumMaintenance;

  /// No description provided for @catEndocrineRenal.
  ///
  /// In es, this message translates to:
  /// **'Endocrino / Renal'**
  String get catEndocrineRenal;

  /// No description provided for @catElectrolytes.
  ///
  /// In es, this message translates to:
  /// **'Electrolitos'**
  String get catElectrolytes;

  /// No description provided for @catFeverPain.
  ///
  /// In es, this message translates to:
  /// **'Fiebre/Dolor'**
  String get catFeverPain;

  /// No description provided for @catUncontrolledSevereBleeding.
  ///
  /// In es, this message translates to:
  /// **'Hemorragia severa incontrolable'**
  String get catUncontrolledSevereBleeding;

  /// No description provided for @catIntracranialHypertension.
  ///
  /// In es, this message translates to:
  /// **'Hipertensión intracraneal'**
  String get catIntracranialHypertension;

  /// No description provided for @medCaMaintCalciumGluconate10.
  ///
  /// In es, this message translates to:
  /// **'Gluconato de calcio 10%'**
  String get medCaMaintCalciumGluconate10;

  /// No description provided for @medCaMaintCalciumGluconate10Range.
  ///
  /// In es, this message translates to:
  /// **'(100mg/ml; 10ml)'**
  String get medCaMaintCalciumGluconate10Range;

  /// No description provided for @medCaMaintCalciumGluconate10Dose.
  ///
  /// In es, this message translates to:
  /// **'2-4cc/kg/d a pasar en solución de mantenimiento en 24h'**
  String get medCaMaintCalciumGluconate10Dose;

  /// No description provided for @medCaMaintCalciumGluconate10Notes.
  ///
  /// In es, this message translates to:
  /// **'Máximo: 2g/dosis (20ml)'**
  String get medCaMaintCalciumGluconate10Notes;

  /// No description provided for @medEndoRenalRegularInsulinInfusion.
  ///
  /// In es, this message translates to:
  /// **'Insulina simple'**
  String get medEndoRenalRegularInsulinInfusion;

  /// No description provided for @medEndoRenalRegularInsulinInfusionRange.
  ///
  /// In es, this message translates to:
  /// **'(100 UI/ml; 10ml) (0,5cc insulina en 50cc SF)'**
  String get medEndoRenalRegularInsulinInfusionRange;

  /// No description provided for @medEndoRenalRegularInsulinInfusionDose.
  ///
  /// In es, this message translates to:
  /// **'0,05 - 0,1 UI/kg/h'**
  String get medEndoRenalRegularInsulinInfusionDose;

  /// No description provided for @medEndoRenalFurosemide.
  ///
  /// In es, this message translates to:
  /// **'Furosemida'**
  String get medEndoRenalFurosemide;

  /// No description provided for @medEndoRenalFurosemideDose.
  ///
  /// In es, this message translates to:
  /// **'0,5-1 mg/kg/dosis'**
  String get medEndoRenalFurosemideDose;

  /// No description provided for @medElectrolytesCalciumGluconate10HyperK.
  ///
  /// In es, this message translates to:
  /// **'Gluconato de calcio 10%'**
  String get medElectrolytesCalciumGluconate10HyperK;

  /// No description provided for @medElectrolytesCalciumGluconate10HyperKRange.
  ///
  /// In es, this message translates to:
  /// **'(100mg/ml; 10ml)'**
  String get medElectrolytesCalciumGluconate10HyperKRange;

  /// No description provided for @medElectrolytesCalciumGluconate10HyperKDose.
  ///
  /// In es, this message translates to:
  /// **'0,5cc/kg IV STAT pasar lento vía periférica'**
  String get medElectrolytesCalciumGluconate10HyperKDose;

  /// No description provided for @medElectrolytesCalciumGluconate10HyperKNotes.
  ///
  /// In es, this message translates to:
  /// **'Máximo: 2g/dosis (20ml)'**
  String get medElectrolytesCalciumGluconate10HyperKNotes;

  /// No description provided for @medElectrolytesCalciumChloride10HyperK.
  ///
  /// In es, this message translates to:
  /// **'Cloruro de calcio 10%'**
  String get medElectrolytesCalciumChloride10HyperK;

  /// No description provided for @medElectrolytesCalciumChloride10HyperKRange.
  ///
  /// In es, this message translates to:
  /// **'(100mg/ml; 10ml)'**
  String get medElectrolytesCalciumChloride10HyperKRange;

  /// No description provided for @medElectrolytesCalciumChloride10HyperKDose.
  ///
  /// In es, this message translates to:
  /// **'0,1 - 0,2cc/kg IV STAT pasar lento vía central'**
  String get medElectrolytesCalciumChloride10HyperKDose;

  /// No description provided for @medElectrolytesCalciumChloride10HyperKNotes.
  ///
  /// In es, this message translates to:
  /// **'Máximo: 1g/dosis (10ml)'**
  String get medElectrolytesCalciumChloride10HyperKNotes;

  /// No description provided for @medElectrolytesNebSalbutamolHyperK.
  ///
  /// In es, this message translates to:
  /// **'Salbutamol nebulizado'**
  String get medElectrolytesNebSalbutamolHyperK;

  /// No description provided for @medElectrolytesNebSalbutamolHyperKDose.
  ///
  /// In es, this message translates to:
  /// **'<25kg= 0,5ml; >25kg= 1cc'**
  String get medElectrolytesNebSalbutamolHyperKDose;

  /// No description provided for @medElectrolytesD10WPlusHyperK.
  ///
  /// In es, this message translates to:
  /// **'Solución glucosada al 10% +'**
  String get medElectrolytesD10WPlusHyperK;

  /// No description provided for @medElectrolytesD10WPlusHyperKDose.
  ///
  /// In es, this message translates to:
  /// **'5cc/kg +'**
  String get medElectrolytesD10WPlusHyperKDose;

  /// No description provided for @medElectrolytesRegularInsulinBolusHyperK.
  ///
  /// In es, this message translates to:
  /// **'Insulina simple'**
  String get medElectrolytesRegularInsulinBolusHyperK;

  /// No description provided for @medElectrolytesRegularInsulinBolusHyperKRange.
  ///
  /// In es, this message translates to:
  /// **'(100 UI/ml; 10ml) (0,5cc insulina en 50cc SF)'**
  String get medElectrolytesRegularInsulinBolusHyperKRange;

  /// No description provided for @medElectrolytesRegularInsulinBolusHyperKDose.
  ///
  /// In es, this message translates to:
  /// **'0,1U/kg pasar IV en 1h junto con glucosado al 10%'**
  String get medElectrolytesRegularInsulinBolusHyperKDose;

  /// No description provided for @medElectrolytesSodiumBicarb1MHyperK.
  ///
  /// In es, this message translates to:
  /// **'Bicarbonato de sodio 1M'**
  String get medElectrolytesSodiumBicarb1MHyperK;

  /// No description provided for @medElectrolytesSodiumBicarb1MHyperKRange.
  ///
  /// In es, this message translates to:
  /// **'(1meq/ml)'**
  String get medElectrolytesSodiumBicarb1MHyperKRange;

  /// No description provided for @medElectrolytesSodiumBicarb1MHyperKDose.
  ///
  /// In es, this message translates to:
  /// **'Diluir con SF: vía central (1 HCO3 : 1 SF); vía periférica: (1 HCO3 : 6 SF)'**
  String get medElectrolytesSodiumBicarb1MHyperKDose;

  /// No description provided for @medFeverPainParacetamolPoIv.
  ///
  /// In es, this message translates to:
  /// **'Paracetamol oral IV'**
  String get medFeverPainParacetamolPoIv;

  /// No description provided for @medFeverPainParacetamolPoIvDose.
  ///
  /// In es, this message translates to:
  /// **'15mg / kg / dosis cada 6h'**
  String get medFeverPainParacetamolPoIvDose;

  /// No description provided for @medFeverPainMetamizoleIv.
  ///
  /// In es, this message translates to:
  /// **'Metamizol IV'**
  String get medFeverPainMetamizoleIv;

  /// No description provided for @medFeverPainMetamizoleIvDose.
  ///
  /// In es, this message translates to:
  /// **'15mg / kg / dosis cada 8h'**
  String get medFeverPainMetamizoleIvDose;

  /// No description provided for @medFeverPainMetamizoleIvNotes.
  ///
  /// In es, this message translates to:
  /// **'Max: 1g por dosis / 4 g por día'**
  String get medFeverPainMetamizoleIvNotes;

  /// No description provided for @medMassiveBleedingTranexamicAcid.
  ///
  /// In es, this message translates to:
  /// **'Ácido tranexámico'**
  String get medMassiveBleedingTranexamicAcid;

  /// No description provided for @medMassiveBleedingTranexamicAcidRange.
  ///
  /// In es, this message translates to:
  /// **'100mg/ml'**
  String get medMassiveBleedingTranexamicAcidRange;

  /// No description provided for @medMassiveBleedingTranexamicAcidDose.
  ///
  /// In es, this message translates to:
  /// **'15mg/kg'**
  String get medMassiveBleedingTranexamicAcidDose;

  /// No description provided for @medMassiveBleedingTranexamicAcidNotes.
  ///
  /// In es, this message translates to:
  /// **'Fluidos tibios'**
  String get medMassiveBleedingTranexamicAcidNotes;

  /// No description provided for @medMassiveBleedingRbcFfp.
  ///
  /// In es, this message translates to:
  /// **'GRE/PFC'**
  String get medMassiveBleedingRbcFfp;

  /// No description provided for @medMassiveBleedingRbcFfpRange.
  ///
  /// In es, this message translates to:
  /// **'(dilución 1:1)'**
  String get medMassiveBleedingRbcFfpRange;

  /// No description provided for @medMassiveBleedingRbcFfpDose.
  ///
  /// In es, this message translates to:
  /// **'5ml/kg'**
  String get medMassiveBleedingRbcFfpDose;

  /// No description provided for @medMassiveBleedingRbcFfpNotes.
  ///
  /// In es, this message translates to:
  /// **'Fluidos tibios'**
  String get medMassiveBleedingRbcFfpNotes;

  /// No description provided for @medMassiveBleedingPlatelets.
  ///
  /// In es, this message translates to:
  /// **'Plaquetas'**
  String get medMassiveBleedingPlatelets;

  /// No description provided for @medMassiveBleedingPlateletsDose.
  ///
  /// In es, this message translates to:
  /// **'10-15ml/kg'**
  String get medMassiveBleedingPlateletsDose;

  /// No description provided for @medMassiveBleedingPlateletsNotes.
  ///
  /// In es, this message translates to:
  /// **'Fluidos tibios'**
  String get medMassiveBleedingPlateletsNotes;

  /// No description provided for @medMassiveBleedingCryo.
  ///
  /// In es, this message translates to:
  /// **'Crioprecipitados'**
  String get medMassiveBleedingCryo;

  /// No description provided for @medMassiveBleedingCryoDose.
  ///
  /// In es, this message translates to:
  /// **'10ml/kg'**
  String get medMassiveBleedingCryoDose;

  /// No description provided for @medMassiveBleedingCryoNotes.
  ///
  /// In es, this message translates to:
  /// **'Fluidos tibios'**
  String get medMassiveBleedingCryoNotes;

  /// No description provided for @medIchHypertonicSaline3.
  ///
  /// In es, this message translates to:
  /// **'Solución hipertónica 3%'**
  String get medIchHypertonicSaline3;

  /// No description provided for @medIchHypertonicSaline3Range.
  ///
  /// In es, this message translates to:
  /// **'(30ml NaCl4M + 70ml SF)'**
  String get medIchHypertonicSaline3Range;

  /// No description provided for @medIchHypertonicSaline3Dose.
  ///
  /// In es, this message translates to:
  /// **'2-5ml/kg a pasar en 10min'**
  String get medIchHypertonicSaline3Dose;

  /// No description provided for @medIchHypertonicSaline3Notes.
  ///
  /// In es, this message translates to:
  /// **'Vigilar aumento de FC'**
  String get medIchHypertonicSaline3Notes;

  /// No description provided for @medIchMannitol.
  ///
  /// In es, this message translates to:
  /// **'Manitol'**
  String get medIchMannitol;

  /// No description provided for @medIchMannitolRange.
  ///
  /// In es, this message translates to:
  /// **'20g/100ml'**
  String get medIchMannitolRange;

  /// No description provided for @medIchMannitolDose.
  ///
  /// In es, this message translates to:
  /// **'0,5-1g/kg a pasar en 10min'**
  String get medIchMannitolDose;

  /// No description provided for @medIchMannitolNotes.
  ///
  /// In es, this message translates to:
  /// **'Vigilar aumento de FC'**
  String get medIchMannitolNotes;

  /// No description provided for @catSevereHypocalcemiaHypermagCCB.
  ///
  /// In es, this message translates to:
  /// **'Hipocalcemia severa, hipermagnesemia o intoxicación por bloqueadores de canales de calcio'**
  String get catSevereHypocalcemiaHypermagCCB;

  /// No description provided for @catAcuteSymptomaticHyponatremia.
  ///
  /// In es, this message translates to:
  /// **'Hiponatremia aguda sintomática (convulsiones)'**
  String get catAcuteSymptomaticHyponatremia;

  /// No description provided for @catHypoglycemia.
  ///
  /// In es, this message translates to:
  /// **'Hipoglicemia'**
  String get catHypoglycemia;

  /// No description provided for @catSedationInfusions.
  ///
  /// In es, this message translates to:
  /// **'Infusiones sedación'**
  String get catSedationInfusions;

  /// No description provided for @catInotropes.
  ///
  /// In es, this message translates to:
  /// **'Inotrópicos'**
  String get catInotropes;

  /// No description provided for @catIVFluids.
  ///
  /// In es, this message translates to:
  /// **'Líquidos IV'**
  String get catIVFluids;

  /// No description provided for @catRespiratorySpecificMeds.
  ///
  /// In es, this message translates to:
  /// **'Medicación específica según patología respiratoria'**
  String get catRespiratorySpecificMeds;

  /// No description provided for @catNeuromuscularParalysis.
  ///
  /// In es, this message translates to:
  /// **'Parálisis muscular'**
  String get catNeuromuscularParalysis;

  /// No description provided for @catCardiacArrest.
  ///
  /// In es, this message translates to:
  /// **'Paro cardíaco'**
  String get catCardiacArrest;

  /// No description provided for @medHypocalcemiaCalciumGluconate10.
  ///
  /// In es, this message translates to:
  /// **'Gluconato de calcio 10%'**
  String get medHypocalcemiaCalciumGluconate10;

  /// No description provided for @medHypocalcemiaCalciumGluconate10Range.
  ///
  /// In es, this message translates to:
  /// **'(100mg/ml; 10ml)'**
  String get medHypocalcemiaCalciumGluconate10Range;

  /// No description provided for @medHypocalcemiaCalciumGluconate10Dose.
  ///
  /// In es, this message translates to:
  /// **'0,5cc/kg IV STAT pasar lento vía periférica'**
  String get medHypocalcemiaCalciumGluconate10Dose;

  /// No description provided for @medHypocalcemiaCalciumGluconate10Notes.
  ///
  /// In es, this message translates to:
  /// **'Máximo: 2g/dosis (20ml)'**
  String get medHypocalcemiaCalciumGluconate10Notes;

  /// No description provided for @medHypocalcemiaCalciumChloride10.
  ///
  /// In es, this message translates to:
  /// **'Cloruro de calcio 10%'**
  String get medHypocalcemiaCalciumChloride10;

  /// No description provided for @medHypocalcemiaCalciumChloride10Range.
  ///
  /// In es, this message translates to:
  /// **'(100mg/ml; 10ml)'**
  String get medHypocalcemiaCalciumChloride10Range;

  /// No description provided for @medHypocalcemiaCalciumChloride10Dose.
  ///
  /// In es, this message translates to:
  /// **'0,1 - 0,2cc/kg IV STAT pasar lento vía central'**
  String get medHypocalcemiaCalciumChloride10Dose;

  /// No description provided for @medHypocalcemiaCalciumChloride10Notes.
  ///
  /// In es, this message translates to:
  /// **'Máximo: 1g/dosis (10ml)'**
  String get medHypocalcemiaCalciumChloride10Notes;

  /// No description provided for @medHyponatremiaHypertonicSaline3.
  ///
  /// In es, this message translates to:
  /// **'Solución hipertónica 3%'**
  String get medHyponatremiaHypertonicSaline3;

  /// No description provided for @medHyponatremiaHypertonicSaline3Range.
  ///
  /// In es, this message translates to:
  /// **'(30ml NaCl4M + 70ml SF)'**
  String get medHyponatremiaHypertonicSaline3Range;

  /// No description provided for @medHyponatremiaHypertonicSaline3Dose.
  ///
  /// In es, this message translates to:
  /// **'4ml/kg a pasar en 20min'**
  String get medHyponatremiaHypertonicSaline3Dose;

  /// No description provided for @medHyponatremiaHypertonicSaline3Notes.
  ///
  /// In es, this message translates to:
  /// **'Vigilar cese de convulsión'**
  String get medHyponatremiaHypertonicSaline3Notes;

  /// No description provided for @medHypoglycemiaDextrose10.
  ///
  /// In es, this message translates to:
  /// **'Solución glucosada al 10%'**
  String get medHypoglycemiaDextrose10;

  /// No description provided for @medHypoglycemiaDextrose10Dose.
  ///
  /// In es, this message translates to:
  /// **'0.5-1g/kg/dosis = 5-10cc/kg/dosis IV STAT'**
  String get medHypoglycemiaDextrose10Dose;

  /// No description provided for @medHypoglycemiaDextrose10Notes.
  ///
  /// In es, this message translates to:
  /// **'Control de GMM en 1min'**
  String get medHypoglycemiaDextrose10Notes;

  /// No description provided for @medSedationInfusionMorphine.
  ///
  /// In es, this message translates to:
  /// **'Morfina'**
  String get medSedationInfusionMorphine;

  /// No description provided for @medSedationInfusionMorphineRange.
  ///
  /// In es, this message translates to:
  /// **'(15mg/ml; 1ml)'**
  String get medSedationInfusionMorphineRange;

  /// No description provided for @medSedationInfusionMorphineDose.
  ///
  /// In es, this message translates to:
  /// **'20mcg/kg/h'**
  String get medSedationInfusionMorphineDose;

  /// No description provided for @medSedationInfusionMidazolam.
  ///
  /// In es, this message translates to:
  /// **'Midazolam'**
  String get medSedationInfusionMidazolam;

  /// No description provided for @medSedationInfusionMidazolamRange.
  ///
  /// In es, this message translates to:
  /// **'(5mg/ml; 3ml)'**
  String get medSedationInfusionMidazolamRange;

  /// No description provided for @medSedationInfusionMidazolamDose.
  ///
  /// In es, this message translates to:
  /// **'2mcg/kg/min'**
  String get medSedationInfusionMidazolamDose;

  /// No description provided for @medSedationInfusionFentanyl.
  ///
  /// In es, this message translates to:
  /// **'Fentanilo'**
  String get medSedationInfusionFentanyl;

  /// No description provided for @medSedationInfusionFentanylRange.
  ///
  /// In es, this message translates to:
  /// **'(50mcg/ml; 2ml)'**
  String get medSedationInfusionFentanylRange;

  /// No description provided for @medSedationInfusionFentanylDose.
  ///
  /// In es, this message translates to:
  /// **'5mcg/kg/h'**
  String get medSedationInfusionFentanylDose;

  /// No description provided for @medInotropesEpiNorepiInfusion.
  ///
  /// In es, this message translates to:
  /// **'Adrenalina / Norepinefrina'**
  String get medInotropesEpiNorepiInfusion;

  /// No description provided for @medInotropesEpiNorepiInfusionDose.
  ///
  /// In es, this message translates to:
  /// **'0.3mg/kg en 50cc SG5% iniciar a 1cc/h hasta 5cc/h'**
  String get medInotropesEpiNorepiInfusionDose;

  /// No description provided for @medInotropesEpiNorepiInfusionNotes.
  ///
  /// In es, this message translates to:
  /// **'0,1mcg/kg/min'**
  String get medInotropesEpiNorepiInfusionNotes;

  /// No description provided for @medInotropesDopamineDobutamineInfusion.
  ///
  /// In es, this message translates to:
  /// **'Dopamina / Dobutamina'**
  String get medInotropesDopamineDobutamineInfusion;

  /// No description provided for @medInotropesDopamineDobutamineInfusionDose.
  ///
  /// In es, this message translates to:
  /// **'15mg/kg en 50cc SG5% iniciar a 1cc/h hasta 4cc/h'**
  String get medInotropesDopamineDobutamineInfusionDose;

  /// No description provided for @medInotropesDopamineDobutamineInfusionNotes.
  ///
  /// In es, this message translates to:
  /// **'5mcg/kg/min'**
  String get medInotropesDopamineDobutamineInfusionNotes;

  /// No description provided for @medIvFluidsMixedSolution.
  ///
  /// In es, this message translates to:
  /// **'Solución mixta'**
  String get medIvFluidsMixedSolution;

  /// No description provided for @medIvFluidsMixedSolutionRange.
  ///
  /// In es, this message translates to:
  /// **'(Requerimientos al 100%)'**
  String get medIvFluidsMixedSolutionRange;

  /// No description provided for @medIvFluidsMixedSolutionDose.
  ///
  /// In es, this message translates to:
  /// **'pasar en Bomba de Infusión continua en 24h IV'**
  String get medIvFluidsMixedSolutionDose;

  /// No description provided for @medIvFluidsDrip.
  ///
  /// In es, this message translates to:
  /// **'Goteo'**
  String get medIvFluidsDrip;

  /// No description provided for @medIvFluidsDripNotes.
  ///
  /// In es, this message translates to:
  /// **'Requerimientos diarios'**
  String get medIvFluidsDripNotes;

  /// No description provided for @medIvFluidsResult.
  ///
  /// In es, this message translates to:
  /// **'Resultado'**
  String get medIvFluidsResult;

  /// No description provided for @medIvFluidsResultDose.
  ///
  /// In es, this message translates to:
  /// **'Restar medicamentos'**
  String get medIvFluidsResultDose;

  /// No description provided for @medIvFluidsDripAdjusted.
  ///
  /// In es, this message translates to:
  /// **'Goteo.'**
  String get medIvFluidsDripAdjusted;

  /// No description provided for @medIvFluidsDripAdjustedDose.
  ///
  /// In es, this message translates to:
  /// **'Restar infusiones'**
  String get medIvFluidsDripAdjustedDose;

  /// No description provided for @medIvFluidsDripAdjustedNotes.
  ///
  /// In es, this message translates to:
  /// **'Cálculo de líquidos por porcentaje'**
  String get medIvFluidsDripAdjustedNotes;

  /// No description provided for @medRespCroupDexamethasoneIv.
  ///
  /// In es, this message translates to:
  /// **'Dexametasona IV'**
  String get medRespCroupDexamethasoneIv;

  /// No description provided for @medRespCroupDexamethasoneIvRange.
  ///
  /// In es, this message translates to:
  /// **'(4mg/ml)'**
  String get medRespCroupDexamethasoneIvRange;

  /// No description provided for @medRespCroupDexamethasoneIvDose.
  ///
  /// In es, this message translates to:
  /// **'0,6 mg/kg dosis única'**
  String get medRespCroupDexamethasoneIvDose;

  /// No description provided for @medRespCroupNebEpinephrine.
  ///
  /// In es, this message translates to:
  /// **'Adrenalina nebulizada'**
  String get medRespCroupNebEpinephrine;

  /// No description provided for @medRespCroupNebEpinephrineRange.
  ///
  /// In es, this message translates to:
  /// **'(L-adrenalina 1:1000)'**
  String get medRespCroupNebEpinephrineRange;

  /// No description provided for @medRespCroupNebEpinephrineDose.
  ///
  /// In es, this message translates to:
  /// **'0,5 mg/kg (Diluir 1:1 con Solución Fisológica)'**
  String get medRespCroupNebEpinephrineDose;

  /// No description provided for @medRespCroupNebEpinephrineNotes.
  ///
  /// In es, this message translates to:
  /// **'Máximo 5ml'**
  String get medRespCroupNebEpinephrineNotes;

  /// No description provided for @medRespCroupNebBudesonide.
  ///
  /// In es, this message translates to:
  /// **'Budesonida nebulizada'**
  String get medRespCroupNebBudesonide;

  /// No description provided for @medRespCroupNebBudesonideRange.
  ///
  /// In es, this message translates to:
  /// **'(0,5mg/ml; 2ml)'**
  String get medRespCroupNebBudesonideRange;

  /// No description provided for @medParalysisSuccinylcholine.
  ///
  /// In es, this message translates to:
  /// **'Succinilcolina'**
  String get medParalysisSuccinylcholine;

  /// No description provided for @medParalysisSuccinylcholineRange.
  ///
  /// In es, this message translates to:
  /// **'(50mg/ml; 10ml) (1ml + 5cc SF)'**
  String get medParalysisSuccinylcholineRange;

  /// No description provided for @medParalysisSuccinylcholineDose.
  ///
  /// In es, this message translates to:
  /// **'1-2 mg/kg'**
  String get medParalysisSuccinylcholineDose;

  /// No description provided for @medParalysisSuccinylcholineNotes.
  ///
  /// In es, this message translates to:
  /// **'Efecto de minutos.'**
  String get medParalysisSuccinylcholineNotes;

  /// No description provided for @medParalysisPancuronium.
  ///
  /// In es, this message translates to:
  /// **'Pancuronio'**
  String get medParalysisPancuronium;

  /// No description provided for @medParalysisPancuroniumRange.
  ///
  /// In es, this message translates to:
  /// **'(2mg/ml)'**
  String get medParalysisPancuroniumRange;

  /// No description provided for @medParalysisPancuroniumDose.
  ///
  /// In es, this message translates to:
  /// **'0,1 mg/kg'**
  String get medParalysisPancuroniumDose;

  /// No description provided for @medParalysisPancuroniumNotes.
  ///
  /// In es, this message translates to:
  /// **'Efecto por 40min.'**
  String get medParalysisPancuroniumNotes;

  /// No description provided for @medParalysisRocuronium.
  ///
  /// In es, this message translates to:
  /// **'Rocuronio'**
  String get medParalysisRocuronium;

  /// No description provided for @medParalysisRocuroniumRange.
  ///
  /// In es, this message translates to:
  /// **'(10mg/ml)'**
  String get medParalysisRocuroniumRange;

  /// No description provided for @medParalysisRocuroniumDose.
  ///
  /// In es, this message translates to:
  /// **'1 mg/kg'**
  String get medParalysisRocuroniumDose;

  /// No description provided for @medParalysisRocuroniumNotes.
  ///
  /// In es, this message translates to:
  /// **'Efecto por 30min.'**
  String get medParalysisRocuroniumNotes;

  /// No description provided for @medParalysisAtracurium.
  ///
  /// In es, this message translates to:
  /// **'Atracurio'**
  String get medParalysisAtracurium;

  /// No description provided for @medParalysisAtracuriumRange.
  ///
  /// In es, this message translates to:
  /// **'(10mg/ml)'**
  String get medParalysisAtracuriumRange;

  /// No description provided for @medParalysisAtracuriumDose.
  ///
  /// In es, this message translates to:
  /// **'0,4 mg/kg'**
  String get medParalysisAtracuriumDose;

  /// No description provided for @medParalysisAtracuriumNotes.
  ///
  /// In es, this message translates to:
  /// **'Efecto por 20min.'**
  String get medParalysisAtracuriumNotes;

  /// No description provided for @medParalysisEttUncuffed.
  ///
  /// In es, this message translates to:
  /// **'TET sin balón'**
  String get medParalysisEttUncuffed;

  /// No description provided for @medParalysisEttUncuffedDose.
  ///
  /// In es, this message translates to:
  /// **'Tener disponible el TET 0.5mm menor y mayor'**
  String get medParalysisEttUncuffedDose;

  /// No description provided for @medParalysisEttCuffed.
  ///
  /// In es, this message translates to:
  /// **'TET con balón'**
  String get medParalysisEttCuffed;

  /// No description provided for @medParalysisEttCuffedDose.
  ///
  /// In es, this message translates to:
  /// **'Tener disponible el TET 0.5mm menor y mayor'**
  String get medParalysisEttCuffedDose;

  /// No description provided for @medParalysisEttDepthLip.
  ///
  /// In es, this message translates to:
  /// **'Longitud inserción a comisura labial'**
  String get medParalysisEttDepthLip;

  /// No description provided for @medParalysisEttDepthLipDose.
  ///
  /// In es, this message translates to:
  /// **'También usar TET x 3'**
  String get medParalysisEttDepthLipDose;

  /// No description provided for @medCardiacArrestEpinephrineIv.
  ///
  /// In es, this message translates to:
  /// **'Adrenalina IV'**
  String get medCardiacArrestEpinephrineIv;

  /// No description provided for @medCardiacArrestEpinephrineIvRange.
  ///
  /// In es, this message translates to:
  /// **'1mg/ml (1 ml + 9 ml SF)'**
  String get medCardiacArrestEpinephrineIvRange;

  /// No description provided for @medCardiacArrestEpinephrineIvDose.
  ///
  /// In es, this message translates to:
  /// **'(1ml=0,1mg) (0,01mg/kg)'**
  String get medCardiacArrestEpinephrineIvDose;

  /// No description provided for @medCardiacArrestEpinephrineIvNotes.
  ///
  /// In es, this message translates to:
  /// **'Máximo 10ml'**
  String get medCardiacArrestEpinephrineIvNotes;

  /// No description provided for @medCardiacArrestEpinephrineEt.
  ///
  /// In es, this message translates to:
  /// **'Adrenalina ET'**
  String get medCardiacArrestEpinephrineEt;

  /// No description provided for @medCardiacArrestEpinephrineEtRange.
  ///
  /// In es, this message translates to:
  /// **'1mg/ml (1 ml + 9 ml SF)'**
  String get medCardiacArrestEpinephrineEtRange;

  /// No description provided for @medCardiacArrestEpinephrineEtDose.
  ///
  /// In es, this message translates to:
  /// **'(1ml=0,1mg) (0,1mg/kg)'**
  String get medCardiacArrestEpinephrineEtDose;

  /// No description provided for @medCardiacArrestEpinephrineEtNotes.
  ///
  /// In es, this message translates to:
  /// **'Máximo 10ml'**
  String get medCardiacArrestEpinephrineEtNotes;

  /// No description provided for @medCardiacArrestFirstShock.
  ///
  /// In es, this message translates to:
  /// **'Primera descarga eléctrica'**
  String get medCardiacArrestFirstShock;

  /// No description provided for @medCardiacArrestFirstShockDose.
  ///
  /// In es, this message translates to:
  /// **'2J/kg'**
  String get medCardiacArrestFirstShockDose;

  /// No description provided for @medCardiacArrestFirstShockNotes.
  ///
  /// In es, this message translates to:
  /// **'Aumentar el doble cada descarga'**
  String get medCardiacArrestFirstShockNotes;

  /// No description provided for @medCardiacArrestSecondShock.
  ///
  /// In es, this message translates to:
  /// **'Segunda descarga eléctrica'**
  String get medCardiacArrestSecondShock;

  /// No description provided for @medCardiacArrestSecondShockDose.
  ///
  /// In es, this message translates to:
  /// **'2J/kg'**
  String get medCardiacArrestSecondShockDose;

  /// No description provided for @medCardiacArrestSecondShockNotes.
  ///
  /// In es, this message translates to:
  /// **'Máximo 10J/kg'**
  String get medCardiacArrestSecondShockNotes;

  /// No description provided for @medCardiacArrestAmiodarone.
  ///
  /// In es, this message translates to:
  /// **'Amiodarona'**
  String get medCardiacArrestAmiodarone;

  /// No description provided for @medCardiacArrestAmiodaroneRange.
  ///
  /// In es, this message translates to:
  /// **'(50mg/ml; 3ml) (3ml + 22ml SG5%)'**
  String get medCardiacArrestAmiodaroneRange;

  /// No description provided for @medCardiacArrestAmiodaroneDose.
  ///
  /// In es, this message translates to:
  /// **'5mg/kg'**
  String get medCardiacArrestAmiodaroneDose;

  /// No description provided for @medCardiacArrestAmiodaroneNotes.
  ///
  /// In es, this message translates to:
  /// **'Máximo 300mg'**
  String get medCardiacArrestAmiodaroneNotes;

  /// No description provided for @medCardiacArrestMagnesiumSulfate.
  ///
  /// In es, this message translates to:
  /// **'Sulfato de magnesio'**
  String get medCardiacArrestMagnesiumSulfate;

  /// No description provided for @medCardiacArrestMagnesiumSulfateRange.
  ///
  /// In es, this message translates to:
  /// **'(200mg/ml; 10ml)'**
  String get medCardiacArrestMagnesiumSulfateRange;

  /// No description provided for @medCardiacArrestMagnesiumSulfateDose.
  ///
  /// In es, this message translates to:
  /// **'50mg/kg; Llevar a 5ml con SF y pasar en 3-5 min'**
  String get medCardiacArrestMagnesiumSulfateDose;

  /// No description provided for @medCardiacArrestMagnesiumSulfateNotes.
  ///
  /// In es, this message translates to:
  /// **'Máximo 2 gramos'**
  String get medCardiacArrestMagnesiumSulfateNotes;

  /// No description provided for @medCardiacArrestSodiumBicarb1M.
  ///
  /// In es, this message translates to:
  /// **'Bicarbonato de sodio 1M'**
  String get medCardiacArrestSodiumBicarb1M;

  /// No description provided for @medCardiacArrestSodiumBicarb1MRange.
  ///
  /// In es, this message translates to:
  /// **'(Diluir 1:1 con SF)'**
  String get medCardiacArrestSodiumBicarb1MRange;

  /// No description provided for @medCardiacArrestSodiumBicarb1MDose.
  ///
  /// In es, this message translates to:
  /// **'(1mEq/kg)'**
  String get medCardiacArrestSodiumBicarb1MDose;

  /// No description provided for @catSVT.
  ///
  /// In es, this message translates to:
  /// **'Taquicardia supraventricular'**
  String get catSVT;

  /// No description provided for @catHco3Replacement.
  ///
  /// In es, this message translates to:
  /// **'Reposición de HCO3'**
  String get catHco3Replacement;

  /// No description provided for @catPotassiumReplacement.
  ///
  /// In es, this message translates to:
  /// **'Reposición de K'**
  String get catPotassiumReplacement;

  /// No description provided for @catRSI.
  ///
  /// In es, this message translates to:
  /// **'Secuencia rápida de intubación'**
  String get catRSI;

  /// No description provided for @catShock.
  ///
  /// In es, this message translates to:
  /// **'Shock'**
  String get catShock;

  /// No description provided for @catStatusEpilepticus.
  ///
  /// In es, this message translates to:
  /// **'Status convulsivo'**
  String get catStatusEpilepticus;

  /// No description provided for @catCentralLinesPleuralDrains.
  ///
  /// In es, this message translates to:
  /// **'Vías centrales y drenajes pleurales'**
  String get catCentralLinesPleuralDrains;

  /// No description provided for @medSvtAdenosineFirst.
  ///
  /// In es, this message translates to:
  /// **'Adenosina primera'**
  String get medSvtAdenosineFirst;

  /// No description provided for @medSvtAdenosineFirstRange.
  ///
  /// In es, this message translates to:
  /// **'3mg/ml Primera Dosis'**
  String get medSvtAdenosineFirstRange;

  /// No description provided for @medSvtAdenosineFirstDose.
  ///
  /// In es, this message translates to:
  /// **'0,1 mg/kg'**
  String get medSvtAdenosineFirstDose;

  /// No description provided for @medSvtAdenosineFirstNotes.
  ///
  /// In es, this message translates to:
  /// **'Máximo 2 ml'**
  String get medSvtAdenosineFirstNotes;

  /// No description provided for @medSvtAdenosineSecond.
  ///
  /// In es, this message translates to:
  /// **'Adenosina segunda'**
  String get medSvtAdenosineSecond;

  /// No description provided for @medSvtAdenosineSecondRange.
  ///
  /// In es, this message translates to:
  /// **'3mg/ml Segunda Dosis'**
  String get medSvtAdenosineSecondRange;

  /// No description provided for @medSvtAdenosineSecondDose.
  ///
  /// In es, this message translates to:
  /// **'0,2 mg/kg'**
  String get medSvtAdenosineSecondDose;

  /// No description provided for @medSvtAdenosineSecondNotes.
  ///
  /// In es, this message translates to:
  /// **'Máximo 4 ml'**
  String get medSvtAdenosineSecondNotes;

  /// No description provided for @medSvtAdenosineThird.
  ///
  /// In es, this message translates to:
  /// **'Adenosina tercera'**
  String get medSvtAdenosineThird;

  /// No description provided for @medSvtAdenosineThirdRange.
  ///
  /// In es, this message translates to:
  /// **'3mg/ml Tercera Dosis'**
  String get medSvtAdenosineThirdRange;

  /// No description provided for @medSvtAdenosineThirdDose.
  ///
  /// In es, this message translates to:
  /// **'0,3 mg/kg'**
  String get medSvtAdenosineThirdDose;

  /// No description provided for @medSvtAdenosineThirdNotes.
  ///
  /// In es, this message translates to:
  /// **'Máximo 4 ml'**
  String get medSvtAdenosineThirdNotes;

  /// No description provided for @medSvtAmiodarone.
  ///
  /// In es, this message translates to:
  /// **'Amiodarona'**
  String get medSvtAmiodarone;

  /// No description provided for @medSvtAmiodaroneRange.
  ///
  /// In es, this message translates to:
  /// **'(50mg/ml; 3ml) (3ml + 22ml SG5%)'**
  String get medSvtAmiodaroneRange;

  /// No description provided for @medSvtAmiodaroneDose.
  ///
  /// In es, this message translates to:
  /// **'5mg/kg pasar en 30min-1h'**
  String get medSvtAmiodaroneDose;

  /// No description provided for @medSvtAmiodaroneNotes.
  ///
  /// In es, this message translates to:
  /// **'Máximo 300 mg'**
  String get medSvtAmiodaroneNotes;

  /// No description provided for @medHco3PatientValue.
  ///
  /// In es, this message translates to:
  /// **'HCO3 del paciente'**
  String get medHco3PatientValue;

  /// No description provided for @medHco3PatientValueNotes.
  ///
  /// In es, this message translates to:
  /// **'Control de Na y gases al finalizar'**
  String get medHco3PatientValueNotes;

  /// No description provided for @medHco3Deficit.
  ///
  /// In es, this message translates to:
  /// **'Déficit de HCO3'**
  String get medHco3Deficit;

  /// No description provided for @medHco3DeficitDose.
  ///
  /// In es, this message translates to:
  /// **'de Bicarbonato de Sodio al 1M (1mEq/mL)'**
  String get medHco3DeficitDose;

  /// No description provided for @medHco3Sg5Volume.
  ///
  /// In es, this message translates to:
  /// **'Volumen de SG5%'**
  String get medHco3Sg5Volume;

  /// No description provided for @medHco3Sg5VolumeRange.
  ///
  /// In es, this message translates to:
  /// **'a diluir déficit de HCO3'**
  String get medHco3Sg5VolumeRange;

  /// No description provided for @medHco3Sg5VolumeDose.
  ///
  /// In es, this message translates to:
  /// **'Pasar en 3h'**
  String get medHco3Sg5VolumeDose;

  /// No description provided for @medHco3InfusionRate3h.
  ///
  /// In es, this message translates to:
  /// **'Velocidad de infusión a pasar en 3h'**
  String get medHco3InfusionRate3h;

  /// No description provided for @medHco3InfusionRate3hRange.
  ///
  /// In es, this message translates to:
  /// **'a diluir déficit de HCO3'**
  String get medHco3InfusionRate3hRange;

  /// No description provided for @medHco3InfusionRate3hDose.
  ///
  /// In es, this message translates to:
  /// **'Pasar en 3h'**
  String get medHco3InfusionRate3hDose;

  /// No description provided for @medKReplacementSfVolume.
  ///
  /// In es, this message translates to:
  /// **'Volumen de SF'**
  String get medKReplacementSfVolume;

  /// No description provided for @medKReplacementSfVolumeRange.
  ///
  /// In es, this message translates to:
  /// **'500cc + 10cc KCL2M'**
  String get medKReplacementSfVolumeRange;

  /// No description provided for @medKReplacementSfVolumeDose.
  ///
  /// In es, this message translates to:
  /// **'Pasar en 2h por vía periférica'**
  String get medKReplacementSfVolumeDose;

  /// No description provided for @medKReplacementSfVolumeNotes.
  ///
  /// In es, this message translates to:
  /// **'Control de K al finalizar'**
  String get medKReplacementSfVolumeNotes;

  /// No description provided for @medRsiMidazolam.
  ///
  /// In es, this message translates to:
  /// **'Midazolam'**
  String get medRsiMidazolam;

  /// No description provided for @medRsiMidazolamRange.
  ///
  /// In es, this message translates to:
  /// **'(5mg/ml; 3ml)'**
  String get medRsiMidazolamRange;

  /// No description provided for @medRsiMidazolamDose.
  ///
  /// In es, this message translates to:
  /// **'0,3mg/kg'**
  String get medRsiMidazolamDose;

  /// No description provided for @medShockNormalSaline.
  ///
  /// In es, this message translates to:
  /// **'Solución Fisiológica'**
  String get medShockNormalSaline;

  /// No description provided for @medShockNormalSalineRange.
  ///
  /// In es, this message translates to:
  /// **'0.9% (Bolo a 10cc/kg)'**
  String get medShockNormalSalineRange;

  /// No description provided for @medShockNormalSalineDose.
  ///
  /// In es, this message translates to:
  /// **'10-20cc/kg cada 5min. Máximo 60cc/kg.'**
  String get medShockNormalSalineDose;

  /// No description provided for @medShockNormalSalineNotes.
  ///
  /// In es, this message translates to:
  /// **'Considerar inotrópicos'**
  String get medShockNormalSalineNotes;

  /// No description provided for @medSeizureDiazepamIv.
  ///
  /// In es, this message translates to:
  /// **'Diazepam IV'**
  String get medSeizureDiazepamIv;

  /// No description provided for @medSeizureDiazepamIvRange.
  ///
  /// In es, this message translates to:
  /// **'(5mg/ml; 2ml)'**
  String get medSeizureDiazepamIvRange;

  /// No description provided for @medSeizureDiazepamIvDose.
  ///
  /// In es, this message translates to:
  /// **'0,3mg/kg cada 5min #3 dosis'**
  String get medSeizureDiazepamIvDose;

  /// No description provided for @medSeizureDiazepamIvNotes.
  ///
  /// In es, this message translates to:
  /// **'Máximo 2ml'**
  String get medSeizureDiazepamIvNotes;

  /// No description provided for @medSeizureDiazepamPr.
  ///
  /// In es, this message translates to:
  /// **'Diazepam VR'**
  String get medSeizureDiazepamPr;

  /// No description provided for @medSeizureDiazepamPrRange.
  ///
  /// In es, this message translates to:
  /// **'(5mg/ml; 2ml)'**
  String get medSeizureDiazepamPrRange;

  /// No description provided for @medSeizureDiazepamPrDose.
  ///
  /// In es, this message translates to:
  /// **'0,5mg/kg; Introducir Angiocath rectal 5cm'**
  String get medSeizureDiazepamPrDose;

  /// No description provided for @medSeizureDiazepamPrNotes.
  ///
  /// In es, this message translates to:
  /// **'Máximo 2ml'**
  String get medSeizureDiazepamPrNotes;

  /// No description provided for @medSeizureMidazolamIvIm.
  ///
  /// In es, this message translates to:
  /// **'Midazolam IV o IM'**
  String get medSeizureMidazolamIvIm;

  /// No description provided for @medSeizureMidazolamIvImRange.
  ///
  /// In es, this message translates to:
  /// **'(5mg/ml; 3ml)'**
  String get medSeizureMidazolamIvImRange;

  /// No description provided for @medSeizureMidazolamIvImDose.
  ///
  /// In es, this message translates to:
  /// **'0,3mg/kg cada 5min #3 dosis'**
  String get medSeizureMidazolamIvImDose;

  /// No description provided for @medSeizureMidazolamIvImNotes.
  ///
  /// In es, this message translates to:
  /// **'Máximo 2ml'**
  String get medSeizureMidazolamIvImNotes;

  /// No description provided for @medSeizureMidazolamIn.
  ///
  /// In es, this message translates to:
  /// **'Midazolam IN'**
  String get medSeizureMidazolamIn;

  /// No description provided for @medSeizureMidazolamInRange.
  ///
  /// In es, this message translates to:
  /// **'(5mg/ml; 3ml)'**
  String get medSeizureMidazolamInRange;

  /// No description provided for @medSeizureMidazolamInDose.
  ///
  /// In es, this message translates to:
  /// **'0,4mg/kg cada 5min #3 dosis. Utilizar atomizador nasal'**
  String get medSeizureMidazolamInDose;

  /// No description provided for @medSeizureMidazolamInNotes.
  ///
  /// In es, this message translates to:
  /// **'Máximo 2ml'**
  String get medSeizureMidazolamInNotes;

  /// No description provided for @medSeizurePhenytoinIv.
  ///
  /// In es, this message translates to:
  /// **'Fenitoína IV'**
  String get medSeizurePhenytoinIv;

  /// No description provided for @medSeizurePhenytoinIvRange.
  ///
  /// In es, this message translates to:
  /// **'(50mg/ml; 5ml)'**
  String get medSeizurePhenytoinIvRange;

  /// No description provided for @medSeizurePhenytoinIvDose.
  ///
  /// In es, this message translates to:
  /// **'20mg/kg; Diluir en 10x el volumen de SF y pasar en 30min'**
  String get medSeizurePhenytoinIvDose;

  /// No description provided for @medSeizurePhenytoinIvNotes.
  ///
  /// In es, this message translates to:
  /// **'Diluir en SF, nunca en glucosado'**
  String get medSeizurePhenytoinIvNotes;

  /// No description provided for @medSeizurePhenobarbitalIv.
  ///
  /// In es, this message translates to:
  /// **'Fenobarbital IV'**
  String get medSeizurePhenobarbitalIv;

  /// No description provided for @medSeizurePhenobarbitalIvRange.
  ///
  /// In es, this message translates to:
  /// **'(50mg/ml; 1ml)'**
  String get medSeizurePhenobarbitalIvRange;

  /// No description provided for @medSeizurePhenobarbitalIvDose.
  ///
  /// In es, this message translates to:
  /// **'20mg/kg; Diluir en 10x el volumen de Agua Estéril y pasar en 15min'**
  String get medSeizurePhenobarbitalIvDose;

  /// No description provided for @medSeizurePhenobarbitalIvNotes.
  ///
  /// In es, this message translates to:
  /// **'Diluir en agua, nunca en glucosado'**
  String get medSeizurePhenobarbitalIvNotes;

  /// No description provided for @medCentralLinesFemoralDepth.
  ///
  /// In es, this message translates to:
  /// **'Catéter femoral:'**
  String get medCentralLinesFemoralDepth;

  /// No description provided for @medCentralLinesFemoralDepthDose.
  ///
  /// In es, this message translates to:
  /// **'Profundidad de colocación'**
  String get medCentralLinesFemoralDepthDose;

  /// No description provided for @medCentralLinesFemoralDepthNotes.
  ///
  /// In es, this message translates to:
  /// **'13 a 30 cm'**
  String get medCentralLinesFemoralDepthNotes;

  /// No description provided for @medCentralLinesJugularDepth.
  ///
  /// In es, this message translates to:
  /// **'Catéter yugular:'**
  String get medCentralLinesJugularDepth;

  /// No description provided for @medCentralLinesJugularDepthDose.
  ///
  /// In es, this message translates to:
  /// **'Profundidad de colocación'**
  String get medCentralLinesJugularDepthDose;

  /// No description provided for @medCentralLinesJugularDepthNotes.
  ///
  /// In es, this message translates to:
  /// **'5 a 8 cm'**
  String get medCentralLinesJugularDepthNotes;

  /// No description provided for @medPleuralDrainCatheter.
  ///
  /// In es, this message translates to:
  /// **'Catéter para drenaje pleural:'**
  String get medPleuralDrainCatheter;

  /// No description provided for @medPleuralDrainCatheterDose.
  ///
  /// In es, this message translates to:
  /// **'Pre-escolar 8-20F'**
  String get medPleuralDrainCatheterDose;

  /// No description provided for @medPleuralDrainCatheterNotes.
  ///
  /// In es, this message translates to:
  /// **'Adolescente 14-36F'**
  String get medPleuralDrainCatheterNotes;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
