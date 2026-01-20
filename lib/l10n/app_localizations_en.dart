// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get termsTitle => 'Instructions & Terms';

  @override
  String get menuAbout => 'About';

  @override
  String get menuLanguage => 'Languages';

  @override
  String get languageTitle => 'Select language';

  @override
  String get languageSpanish => 'Spanish';

  @override
  String get languageEnglish => 'English';

  @override
  String get quickSummaryTitle => 'Quick summary:';

  @override
  String get quickSummaryBody =>
      '• Real weight is recommended when available.\n• If no weight is available, the app estimates weight by age automatically.\n• Always verify doses with your local protocol/guideline before administering.';

  @override
  String get termsAccept => 'I have read and accept the terms and conditions.';

  @override
  String get btnContinue => 'Continue';

  @override
  String get accordion1Title => '1. Table content';

  @override
  String get accordion1Body =>
      'This table contains information about commonly used emergency medications.';

  @override
  String get accordion2Title => '2. Applicability to children';

  @override
  String get accordion2Body => 'Applicable to children older than one month.';

  @override
  String get accordion3Title => '3. Weight/Age determination';

  @override
  String get accordion3Body =>
      'Enter weight in kilograms when available (recommended). If you don\'t know the weight, enter age (years or months as applicable) and the app will estimate weight automatically. The screen will show whether “Real weight ✅” or “Estimated ⚠️” is used.';

  @override
  String get accordion4Title => '4. Maintenance solution volume';

  @override
  String get accordion4Body =>
      'For maintenance fluids, you may adjust the percentage of requirements used for the solution.';

  @override
  String get accordion5Title => '5. Automatic calculations';

  @override
  String get accordion5Body =>
      'All doses are calculated automatically using real or estimated weight (if applicable), plus other clinical variables depending on the medication.';

  @override
  String get accordion6Title => '6. Range verification';

  @override
  String get accordion6Body =>
      'When a dose has a range, the app shows a suggested value. Verify range and formula according to your local protocol.';

  @override
  String get accordion7Title => '7. Alternative dose calculations';

  @override
  String get accordion7Body =>
      'If you need a different dose than the proposed one, calculate it manually, since this table/app is not editable.';

  @override
  String get accordion8Title => '8. CAF size calculation (XS, S, etc.)';

  @override
  String get accordion8Body =>
      'CAF size is suggested based on patient weight. If there is no suitable recommendation, the field may be blank.';

  @override
  String get accordion9Title => '9. User responsibility';

  @override
  String get accordion9Body =>
      'USING THIS APPLICATION IS THE COMPLETE AND INDIVIDUAL RESPONSIBILITY OF THE USER. IT DOES NOT REMOVE THE PROFESSIONAL DUTY TO VERIFY DATA WITH AN UPDATED TEXT/PROTOCOL BEFORE ADMINISTERING MEDICATIONS.';

  @override
  String get aboutTitle => 'About';

  @override
  String get aboutDevelopedBy => 'Developed by';

  @override
  String get aboutPurpose => 'Purpose';

  @override
  String get aboutSupport => 'Support';

  @override
  String get aboutPurposeBody =>
      'Clinical tool for pediatric calculations and quick access to vital sign ranges.';

  @override
  String get aboutSupportBody =>
      'If you need support or want new features, contact the developer.';

  @override
  String get aboutBack => 'Back';

  @override
  String aboutCopyright(Object company, Object year) {
    return '© $year $company. All rights reserved.';
  }

  @override
  String get developedBy => 'Developed by';

  @override
  String get purpose => 'Purpose';

  @override
  String get support => 'Support';

  @override
  String get aboutPurposeText =>
      'Clinical tool for pediatric calculations and quick access to vital signs ranges.';

  @override
  String get aboutSupportText =>
      'If you need support or want new features, contact the developer.';

  @override
  String get back => 'Back';

  @override
  String get rightsReserved => 'All rights reserved.';

  @override
  String get proTag => 'PRO';

  @override
  String get ageSelectTitle => 'Select age type';

  @override
  String get ageSelectQuestion => 'How do you want to enter the age?';

  @override
  String get ageYearsTitle => 'Age in Years';

  @override
  String get ageYearsSubtitle => 'For patients from 1 to 14 years old';

  @override
  String get ageSelectNote =>
      'If you don’t have the weight, the next screens can estimate it using age.';

  @override
  String get commonBadge => 'Most common';

  @override
  String get ageMonthsTitle => 'Age in Months';

  @override
  String get ageMonthsSubtitle => 'For infants from 1 to 11 months old';

  @override
  String get ageSelectSubtitle =>
      'Choose the option that matches how you have the patient\'s data.';

  @override
  String get patientAppBarTitleYears => 'Patient Data (Years)';

  @override
  String get patientHeaderTitle => 'Enter patient information';

  @override
  String get patientHowItWorks => 'How it works:';

  @override
  String get patientHowItWorksBody =>
      '• If you enter weight, calculation uses it.\n• If you don\'t have weight, enter Age (1–14) and we use an estimated weight.\n• Estimated weight is a guide; confirm with real weight if possible.';

  @override
  String get patientWeightLabel => 'Current weight (kg)';

  @override
  String get patientWeightHint => 'e.g. 22.6';

  @override
  String get patientAgeYearsLabel => 'Age (Years - 1 to 14 years)';

  @override
  String get patientAgeYearsHint => 'e.g. 4';

  @override
  String get patientAgeMonthsLabel => 'Age (Months - 1 to 11 months)';

  @override
  String get patientAgeMonthsHint => 'e.g., 6';

  @override
  String get patientEstimatedWeightLabel => 'Estimated weight by age:';

  @override
  String get patientChipRealWeight => 'Real weight ✅';

  @override
  String get patientChipEstimated => 'Estimated ⚠️';

  @override
  String get patientBtnWithEnteredWeight => 'Calculate using entered weight';

  @override
  String get patientBtnWithEstimatedWeight =>
      'Calculate using estimated weight';

  @override
  String get patientBtnCalculateDose => 'Calculate Dose';

  @override
  String get patientValWeightOrValidAgeToEstimate =>
      'Enter weight or a valid age in years to estimate it.';

  @override
  String get patientValInvalidNumber => 'Invalid input. Enter a number.';

  @override
  String get patientValEnterAgeYears => 'Please enter age in years.';

  @override
  String get patientValAgeRangeYears => 'Age must be between 1 and 14 years.';

  @override
  String get patientValAgeMonthsRange =>
      'Age in months must be between 1 and 11.';

  @override
  String get patientSnackNeedWeightOrAge =>
      'Please enter patient weight OR age in years (for estimated weight).';

  @override
  String get patientSnackNeedWeightAndAge =>
      'Please enter weight and at least age in years or months.';

  @override
  String get medsTitleYears => 'Medications (1 - 14 years)';

  @override
  String get medsSubtitleViewDetails => 'View details';

  @override
  String get medsChipEstimated => 'Estimated ⚠️';

  @override
  String get medsChipRealWeight => 'Real weight ✅';

  @override
  String get medsBtnChange => 'Change';

  @override
  String get medsSearchHint => 'Search medication...';

  @override
  String get medsAlphaAll => 'ALL';

  @override
  String get medsAlphaFavs => 'Favorites';

  @override
  String get medsSpecialCalculations => 'Special calculations';

  @override
  String get medsModalClose => 'Close';

  @override
  String get medsVitalsTitle => 'Vital Signs (SING V)';

  @override
  String get medsPamTitle => 'Mean Arterial Pressure (MAP)';

  @override
  String get medsOptionHeartRate => 'Heart Rate';

  @override
  String get medsOptionRespRate => 'Respiratory Rate';

  @override
  String get medsOptionBloodPressure => 'Blood Pressure';

  @override
  String get medsOptionTemperature => 'Temperature';

  @override
  String get medsOptionOxygenSat => 'Oxygen Saturation';

  @override
  String get medsOptionBloodPressureWomen => 'Blood Pressure (Women)';

  @override
  String get medsOptionBloodPressureMen => 'Blood Pressure (Men)';

  @override
  String get medsPrintTooltip => 'Print all calculated medications';

  @override
  String get medsBottomSINGV => 'SING V';

  @override
  String get medsBottomPAM => 'MAP';

  @override
  String patientHeaderSummaryYears(Object age, Object weight) {
    return '$weight kg · $age years';
  }

  @override
  String get medDetailPrintTooltip => 'Print report';

  @override
  String get medDetailInfoTitle => 'Medication information';

  @override
  String get medDetailDoseTitle => 'Calculated dose for the patient';

  @override
  String get medDetailCategory => 'Category:';

  @override
  String get medDetailSubcategory => 'Subcategory:';

  @override
  String get medDetailOriginalDoseRange => 'Original dose range:';

  @override
  String get medDetailPediatricDose => 'Pediatric dose:';

  @override
  String get medDetailNotes => 'Notes:';

  @override
  String get medDetailCopy => 'Copy';

  @override
  String medDetailCopied(Object text) {
    return '\"$text\" copied';
  }

  @override
  String get commonNA => 'N/A';

  @override
  String get commonDash => '—';

  @override
  String get printPatientReportTitle => 'Patient Report';

  @override
  String get printAppSubtitle => 'Pedx Calc · Calculations';

  @override
  String get printGeneratedBy => 'Generated by Pedx Calc';

  @override
  String get printDateLabel => 'Date';

  @override
  String get printPageLabel => 'Page';

  @override
  String get printPatientDataTitle => 'Patient Data';

  @override
  String get printWeightLabel => 'Weight';

  @override
  String get printAgeLabel => 'Age';

  @override
  String get printYearsUnit => 'years';

  @override
  String get printMonthsUnit => 'months';

  @override
  String get printMedsCalculatedTitle => 'Calculated medications';

  @override
  String get printTableHeaderMedication => 'Medication';

  @override
  String get printTableHeaderDose => 'Calculated dose';

  @override
  String get printTableHeaderNotes => 'Notes';

  @override
  String printPreviewError(Object error) {
    return 'Error generating PDF: $error';
  }

  @override
  String get specialCalcTitle => 'Special calculations (youth)';

  @override
  String get specialCalcResetTooltip => 'Reset values';

  @override
  String get specialCalcPrintTooltip => 'Print full report';

  @override
  String specialCalcPatientHeader(Object weight, Object age, Object ageUnit) {
    return 'Patient: $weight kg · $age $ageUnit';
  }

  @override
  String get specialCalcYearsUnit => 'years';

  @override
  String get specialCalcMonthsUnit => 'months';

  @override
  String get specialCalcInputPercentTitle => 'Percentage calculation';

  @override
  String get specialCalcInputPercentHint => '100';

  @override
  String get specialCalcInputPercentHelper =>
      'Adjust fluid percentage (e.g., 80, 60, 45…).';

  @override
  String get specialCalcInputSodiumTitle => 'Patient sodium (Na)';

  @override
  String get specialCalcInputSodiumHint => '120';

  @override
  String get specialCalcInputSodiumHelper => 'Enter current Na (mEq/L).';

  @override
  String get specialCalcInputHco3Title => 'HCO3 replacement';

  @override
  String get specialCalcInputHco3Hint => '7';

  @override
  String get specialCalcInputHco3Helper => 'Enter current HCO3 (mEq/L).';

  @override
  String get specialCalcSectionLiquids => 'IV fluids';

  @override
  String get specialCalcSectionSodium => 'Sodium replacement';

  @override
  String get specialCalcSectionHco3 => 'HCO3 replacement';

  @override
  String get specialCalcTotalLabel => 'Result (final total)';

  @override
  String get specialCalcPercentInfoFallback =>
      'You can adjust the percentage based on the patient\'s condition.';

  @override
  String get patientMonthsAppBarTitle => 'Patient data (Months)';

  @override
  String get patientMonthsCardTitle => 'Enter data (1–11 months)';

  @override
  String get howItWorksTitle => 'How it works:';

  @override
  String get howItWorksMonthsBody =>
      '• If you enter Weight, we calculate using that weight.\n• If you don’t have weight, enter Age (1–11 months) and we use an estimated weight.\n• Estimated weight is guidance; confirm with real weight if possible.';

  @override
  String get patientWeightHintMonths => 'e.g., 7.5';

  @override
  String get patientMonthsValidatorEmpty => 'Please enter age in months.';

  @override
  String get patientMonthsValidatorRange =>
      'Age must be between 1 and 11 months.';

  @override
  String get estimatedWeightByAge => 'Estimated weight by age: ';

  @override
  String get snackNeedWeightOrValidAgeMonths =>
      'Please enter a valid weight or a valid age (1–11 months) to estimate it.';

  @override
  String get btnCalcWithEnteredWeight => 'Calculate with entered weight';

  @override
  String get btnCalcWithEstimatedWeight => 'Calculate with estimated weight';

  @override
  String get btnCalcDose => 'Calculate dose';

  @override
  String get chipRealWeight => 'Actual weight ✅';

  @override
  String get chipEstimated => 'Estimated ⚠️';

  @override
  String get navPatient => 'Patient';

  @override
  String get navInstructions => 'Instructions';

  @override
  String get medsMonthsAppBarTitle => 'Medications (1 - 11 months)';

  @override
  String get searchMedicationHint => 'Search medication...';

  @override
  String get viewDetails => 'View details';

  @override
  String get btnChange => 'Change';

  @override
  String get filterAll => 'ALL';

  @override
  String get filterFavorites => 'Favorites';

  @override
  String get specialCalculations => 'Special calculations';

  @override
  String get modalClose => 'Close';

  @override
  String get modalVitalsTitle => 'Vital Signs (SING V)';

  @override
  String get modalPamTitle => 'Mean Arterial Pressure (MAP)';

  @override
  String get vitalHeartRate => 'Heart rate';

  @override
  String get vitalRespRate => 'Respiratory rate';

  @override
  String get vitalBloodPressure => 'Blood pressure';

  @override
  String get vitalTemperature => 'Temperature';

  @override
  String get vitalOxygenSat => 'Oxygen saturation';

  @override
  String get vitalBloodPressureWomen => 'Blood pressure (Women)';

  @override
  String get vitalBloodPressureMen => 'Blood pressure (Men)';

  @override
  String get printFullReport => 'Print full report';

  @override
  String get patientHeaderMonthsUnit => 'months';

  @override
  String get specialCalcMonthsTitle => 'Special calculations (1 - 11 months)';

  @override
  String get restoreValues => 'Restore values';

  @override
  String get patientHeaderPrefix => 'Patient';

  @override
  String get inputLiquidsPercentTitle => 'IV fluids percentage calculation';

  @override
  String get inputLiquidsPercentHelper =>
      'Adjust % by condition (e.g., 80, 60, 45…).';

  @override
  String get inputHco3Title => 'HCO3 replacement';

  @override
  String get inputHco3Helper => 'Enter current HCO3.';

  @override
  String get inputSodiumTitle => 'Sodium replacement (Na)';

  @override
  String get inputSodiumHelper => 'Enter current Na.';

  @override
  String get sectionLiquidsIV => 'IV Fluids';

  @override
  String get sectionHco3 => 'HCO3 replacement';

  @override
  String get sectionSodium => 'Sodium replacement';

  @override
  String get resultTotalFinal => 'Result (final total)';

  @override
  String get printReportTooltip => 'Print report';

  @override
  String get medInfoTitle => 'Medication information';

  @override
  String get medInfoCategoryLabel => 'Category:';

  @override
  String get medInfoSubcategoryLabel => 'Subcategory:';

  @override
  String get medInfoOriginalDoseRangeLabel => 'Original dose range:';

  @override
  String get medInfoPediatricDoseLabel => 'Pediatric dose:';

  @override
  String get medInfoObservationsLabel => 'Notes:';

  @override
  String get patientCalculatedDoseTitle => 'Calculated dose for the patient';

  @override
  String get copyTooltip => 'Copy';

  @override
  String snackbarCopied(Object text) {
    return '\"$text\" copied to clipboard';
  }

  @override
  String get calcInfoTitle => 'Calculation information';

  @override
  String get calcTypeLabel => 'Type:';

  @override
  String get calcMedicationLabel => 'Medication:';

  @override
  String get calcObservationsLabel => 'Notes:';

  @override
  String get notAvailable => 'N/A';

  @override
  String get bpAppBarTitle => 'Blood Pressure';

  @override
  String get bpColAge => 'Age';

  @override
  String get bpColSystolic => 'Systolic';

  @override
  String get bpColDiastolic => 'Diastolic';

  @override
  String get bpColHypotensionSystolic => 'Systolic\nhypotension';

  @override
  String get bpRowAge1to2 => '1–2 years (Toddler)';

  @override
  String get bpRowAge3to5 => '3–5 years (Preschool)';

  @override
  String get bpRowAge6to9 => '6–9 years (School age)';

  @override
  String get bpRowAge10to11 => '10–11 years (Pre-adolescent)';

  @override
  String get bpRowAge12to15 => '12–15 years (Adolescent)';

  @override
  String get bpRowHypotensionFormula => '<70 + (age × 2)';

  @override
  String get bpNoteFormula =>
      'Note: The systolic hypotension threshold for preschool ages is calculated as: 70 + (age in years × 2).';

  @override
  String get bpNeoAppBarTitle => 'Blood Pressure';

  @override
  String get bpNeoColAge => 'Age';

  @override
  String get bpNeoColSystolic => 'Systolic';

  @override
  String get bpNeoColDiastolic => 'Diastolic';

  @override
  String get bpNeoColHypotensionSystolic => 'Systolic\nhypotension';

  @override
  String get bpNeoRowBirth12hLt1kg => 'Birth (12 h) <1 kg';

  @override
  String get bpNeoRowBirth12h3kg => 'Birth (12 h) 3 kg';

  @override
  String get bpNeoRowNeonate96h => 'Neonate (96 h)';

  @override
  String get bpNeoRowInfant1to12mo => 'Infant (1–12 months)';

  @override
  String get bpNeoNote =>
      'Note: Normal ranges and hypotension thresholds by age (mmHg).';

  @override
  String get hrAppBarTitle => 'Heart Rate (beats/min)';

  @override
  String get hrColAge => 'Age';

  @override
  String get hrColAwake => 'Awake';

  @override
  String get hrColAsleep => 'Asleep';

  @override
  String get hrRowToddler => '1–2 years (Toddler)';

  @override
  String get hrRowPreschool => '3–5 years (Preschool)';

  @override
  String get hrRowSchoolAge => '6–11 years (School age)';

  @override
  String get hrRowAdolescent => '12–15 years (Adolescent)';

  @override
  String get hrNote =>
      'Note: Ranges vary depending on whether the patient is awake or asleep.';

  @override
  String get hrInfantAppBarTitle => 'Heart Rate (beats/min)';

  @override
  String get hrInfantRowNeonate => '(<28 days) (Neonate)';

  @override
  String get hrInfantRowInfant => '(1–12 months) (Infant)';

  @override
  String get calculatedDoseTitle => 'Calculated dose for the patient';

  @override
  String get medCategory => 'Category:';

  @override
  String get medSubcategory => 'Subcategory:';

  @override
  String get medOriginalDoseRange => 'Original dose range:';

  @override
  String get medPediatricDose => 'Pediatric dose:';

  @override
  String get medObservations => 'Observations:';

  @override
  String get copy => 'Copy';

  @override
  String get printReport => 'Print report';

  @override
  String copiedText(Object text) {
    return '\"$text\" copied';
  }

  @override
  String get o2AppBarTitle => 'Oxygen saturation (SpO₂)';

  @override
  String get o2CardTitle => 'Oxygen saturation (SpO₂)';

  @override
  String get o2Paragraph1 => 'SpO₂ is lower in the immediate neonatal period.';

  @override
  String get o2Paragraph2Part1 => 'Beyond this period, an SpO₂ of ';

  @override
  String get o2ThresholdBold => '<90–92%';

  @override
  String get o2Paragraph2Part2 => ' may suggest a ';

  @override
  String get o2RespConditionBold => 'respiratory condition';

  @override
  String get o2Or => ' or ';

  @override
  String get o2CyanoticHeartBold => 'cyanotic congenital heart disease.';

  @override
  String get o2Note =>
      'Oxygen saturation is considered a key vital sign to assess oxygenation.';

  @override
  String get rrAppBarTitle => 'Respiratory Rate';

  @override
  String get rrCardTitle => 'Normal ranges by age';

  @override
  String get rrTableHeaderAge => 'Age';

  @override
  String get rrTableHeaderNormal => 'Normal';

  @override
  String get rrAgeRow1 => '1–2 years (Toddler)';

  @override
  String get rrAgeRow2 => '3–5 years (Preschool)';

  @override
  String get rrAgeRow3 => '6–11 years (School age)';

  @override
  String get rrAgeRow4 => '12–15 years (Adolescent)';

  @override
  String get rrSourceNote => 'Source: Pediatric Reference Guidelines.';

  @override
  String get rrAppBarTitleWithUnit => 'Respiratory Rate (breaths/min)';

  @override
  String get rrAgeInfant => '(<1 year) (Neonate)';

  @override
  String get rrAgeToddler => '(1–2 years) (Children)';

  @override
  String get tempAppBarTitleByMethod => 'Temperature (by method)';

  @override
  String get tempCardTitleNormalRangesByMethod => 'Normal ranges by method';

  @override
  String get tempTableHeaderMethod => 'Method';

  @override
  String get tempTableHeaderNormal => 'Normal';

  @override
  String get tempMethodRectal => 'Rectal';

  @override
  String get tempMethodTympanic => 'Tympanic';

  @override
  String get tempMethodOral => 'Oral';

  @override
  String get tempMethodAxillary => 'Axillary';

  @override
  String get tempNoteRangesDoNotVary => 'Ranges do not vary by age.';

  @override
  String get tempGuideScreeningLabel => 'Screening:';

  @override
  String get tempGuideScreeningText =>
      'axillary, temporal, tympanic (↓ accuracy)';

  @override
  String get tempGuideDefinitiveLabel => 'Definitive:';

  @override
  String get tempGuideDefinitiveText =>
      'rectal & oral (↑ reflection of core temperature)';

  @override
  String get tempReferenceCps2015 =>
      'Reference: CPS position statement on temperature measurement in pediatrics (2015)';

  @override
  String get tempAppBarTitleCelsiusByMethod => 'Temperature (°C) (By method)';

  @override
  String get tempGuideScreeningTextAlt =>
      'axillary, temporal, tympanic (↓ accuracy)';

  @override
  String get tempReferenceCps2015Alt =>
      'Reference: CPS position statement on temperature measurement in pediatrics (2015)';

  @override
  String get bpWomenTitle => 'Blood Pressure (Women)';

  @override
  String get bpColMin => 'Minimum';

  @override
  String get bpColMean => 'Mean';

  @override
  String get bpColMax => 'Maximum';

  @override
  String get bpGroupSystolicDiastolic => 'Systolic/diastolic\nblood pressure';

  @override
  String get bpGroupMeanArterialPressure => 'Mean arterial\npressure';

  @override
  String get bpAgeLt7Days => '<7 days';

  @override
  String get bpAge8to30Days => '8-30 days';

  @override
  String get bpAge1to5Months => '1-5 months';

  @override
  String get bpAge6to11Months => '6-11 months';

  @override
  String get bpFormulasTitle => 'Blood Pressure Formulas';

  @override
  String get bpFormulaLine1 =>
      'Mean arterial pressure = (diastolic pressure) + (systolic - diastolic) / 3';

  @override
  String get bpFormulaLine2 => 'or MAP = DP + (SP-DP)/3';

  @override
  String get bpFormulaLine3 => 'or MAP = (SP + (2×DP)) / 3';

  @override
  String get bpAge1y => '1 year';

  @override
  String get bpAge2y => '2 years';

  @override
  String get bpAge3y => '3 years';

  @override
  String get bpAge4y => '4 years';

  @override
  String get bpAge5y => '5 years';

  @override
  String get bpAge6y => '6 years';

  @override
  String get bpAge7y => '7 years';

  @override
  String get bpAge8y => '8 years';

  @override
  String get bpAge9y => '9 years';

  @override
  String get bpAge10y => '10 years';

  @override
  String get bpAge11y => '11 years';

  @override
  String get bpAge12y => '12 years';

  @override
  String get bpAge13y => '13 years';

  @override
  String get bpAge14y => '14 years';

  @override
  String get bpAge15y => '15 years';

  @override
  String get bpAge16y => '16 years';

  @override
  String get bpAge17y => '17 years';

  @override
  String get bpAge18y => '18 years';

  @override
  String get bpAge19y => '19 years';

  @override
  String get bpMenTitle => 'Blood Pressure (Men)';

  @override
  String get bpAge8To30Days => '8-30 days';

  @override
  String get bpAge1To5Months => '1-5 months';

  @override
  String get bpAge6To11Months => '6-11 months';

  @override
  String get bpMenNote =>
      'Note: the time interval for measuring mean arterial pressure is not fixed; it depends on the patient\'s condition, ranging from every 15 minutes in severe cases to every 24 hours in stable patients. If mean arterial pressure falls below the minimum level, crystalloid infusion should be initiated according to protocol. If mean arterial pressure tends to rise above the normal maximum, fluid infusion should be stopped to avoid volume overload.';

  @override
  String get bpAge1Year => '1 year';

  @override
  String get bpAge2Years => '2 years';

  @override
  String get bpAge3Years => '3 years';

  @override
  String get bpAge4Years => '4 years';

  @override
  String get bpAge5Years => '5 years';

  @override
  String get bpAge6Years => '6 years';

  @override
  String get bpAge7Years => '7 years';

  @override
  String get bpAge8Years => '8 years';

  @override
  String get bpAge9Years => '9 years';

  @override
  String get bpAge10Years => '10 years';

  @override
  String get bpAge11Years => '11 years';

  @override
  String get bpAge12Years => '12 years';

  @override
  String get bpAge13Years => '13 years';

  @override
  String get bpAge14Years => '14 years';

  @override
  String get bpAge15Years => '15 years';

  @override
  String get bpAge16Years => '16 years';

  @override
  String get bpAge17Years => '17 years';

  @override
  String get bpAge18Years => '18 years';

  @override
  String get bpAge19Years => '19 years';

  @override
  String get catAnaphylaxis => 'Anaphylaxis';

  @override
  String get catAnalgesia => 'Analgesia';

  @override
  String get catAntibiotics => 'Antibiotics';

  @override
  String get medAnaEpiImStandard => 'Epinephrine IM';

  @override
  String get medAnaEpiImWeightBased => 'Epinephrine IM.';

  @override
  String get medAnalgesiaFentanyl => 'Fentanyl';

  @override
  String get medAnalgesiaMorphine => 'Morphine';

  @override
  String get medAnalgesiaKetamine => 'Ketamine';

  @override
  String get medAbxAmpicillin => 'Ampicillin';

  @override
  String get medAbxCefotaxime => 'Cefotaxime';

  @override
  String get medAbxCeftazidime => 'Ceftazidime';

  @override
  String get medAbxMeropenem => 'Meropenem';

  @override
  String get medAbxVancomycin => 'Vancomycin';

  @override
  String get medAbxAcyclovir => 'Acyclovir';

  @override
  String get medAbxPipTazo => 'Pipe-tazo';

  @override
  String get medAbxAmoxClav => 'Amoxicillin-clavulanate';

  @override
  String get medAbxAmikacin => 'Amikacin';

  @override
  String get medAbxClindamycin => 'Clindamycin';

  @override
  String get medAnaEpiImStandardRange => '1mg/ml (1:1000)';

  @override
  String get medAnaEpiImStandardDose => '0.01 mg/kg';

  @override
  String get medAnaEpiImStandardNotes => 'Max 0.5 ml';

  @override
  String get medAnaEpiImWeightBasedRange => '1mg/ml (1:1000) <= 30kg';

  @override
  String get medAnaEpiImWeightBasedDose => '';

  @override
  String get medAnaEpiImWeightBasedNotes => '1mg/ml (1:1000) > 30kg';

  @override
  String get medAnalgesiaFentanylRange => '(50mcg/ml; 2ml)';

  @override
  String get medAnalgesiaFentanylDose => '1–5 mcg/kg';

  @override
  String get medAnalgesiaFentanylNotes => 'May repeat the dose.';

  @override
  String get medAnalgesiaMorphineRange => '(15mg/ml; 1ml) (1ml + 14cc NS)';

  @override
  String get medAnalgesiaMorphineDose => '0.1 mg/kg';

  @override
  String get medAnalgesiaMorphineNotes => 'May repeat the dose.';

  @override
  String get medAnalgesiaKetamineRange => '(10mg/ml; 20ml)';

  @override
  String get medAnalgesiaKetamineDose => '1–2 mg/kg';

  @override
  String get medAnalgesiaKetamineNotes => 'May repeat the dose.';

  @override
  String get medAbxAmpicillinRange => '25–50 mg/kg/dose';

  @override
  String get medAbxAmpicillinDose => 'every 6 h';

  @override
  String get medAbxAmpicillinNotes => 'Max: 3 g/dose';

  @override
  String get medAbxCefotaximeRange => '50 mg/kg/dose';

  @override
  String get medAbxCefotaximeDose => 'every 8 h or every 6 h';

  @override
  String get medAbxCefotaximeNotes => 'Max: 2–4 g/dose';

  @override
  String get medAbxCeftazidimeRange => '50 mg/kg/dose';

  @override
  String get medAbxCeftazidimeDose => 'every 8 h';

  @override
  String get medAbxCeftazidimeNotes => 'Max: 6 g/day';

  @override
  String get medAbxMeropenemRange => '60 mg/kg/day';

  @override
  String get medAbxMeropenemDose => 'every 8 h';

  @override
  String get medAbxMeropenemNotes => 'Max: 1 g/dose';

  @override
  String get medAbxVancomycinRange => '15 mg/kg/dose';

  @override
  String get medAbxVancomycinDose => 'every 6 h';

  @override
  String get medAbxVancomycinNotes => 'Max: 500 mg/dose';

  @override
  String get medAbxAcyclovirRange => '60 mg/kg/day';

  @override
  String get medAbxAcyclovirDose => 'every 8 h';

  @override
  String get medAbxAcyclovirNotes => 'Max: 1 g';

  @override
  String get medAbxPipTazoRange => '300 mg/kg/day';

  @override
  String get medAbxPipTazoDose => 'every 8 h';

  @override
  String get medAbxPipTazoNotes => '';

  @override
  String get medAbxAmoxClavRange => '90 mg/kg/day';

  @override
  String get medAbxAmoxClavDose => 'every 12 h';

  @override
  String get medAbxAmoxClavNotes => '';

  @override
  String get medAbxAmikacinRange => '22.5 mg/kg/day';

  @override
  String get medAbxAmikacinDose => 'daily';

  @override
  String get medAbxAmikacinNotes => '';

  @override
  String get medAbxClindamycinRange => '40 mg/kg/day';

  @override
  String get medAbxClindamycinDose => 'every 8 h';

  @override
  String get medAbxClindamycinNotes => '';

  @override
  String get calcTypeSodium => 'Sodium';

  @override
  String get calcTypeHco3 => 'Bicarbonate (HCO₃)';

  @override
  String get calcTypeIvFluids => 'IV Fluids';

  @override
  String get specNaPatient => 'Patient sodium';

  @override
  String get specNaDeficit => 'Sodium deficit';

  @override
  String get specNaSg5Volume => 'D5W volume';

  @override
  String get specNaWithNs => 'With normal saline';

  @override
  String get specNaInfusionRate => 'Infusion rate';

  @override
  String get specHco3Patient => 'Patient HCO₃';

  @override
  String get specHco3Deficit => 'HCO₃ deficit';

  @override
  String get specHco3Sg5Volume => 'D5W volume to dilute HCO₃ deficit';

  @override
  String get specHco3InfusionRate => 'Infusion rate';

  @override
  String get specIvMixedSolution => 'Maintenance mixed solution';

  @override
  String get specIvPercentInfoTitle => 'Percentage calculation';

  @override
  String get specIvResult => 'Result';

  @override
  String get specIvDrip => 'Drip rate';

  @override
  String get specIvDripAdjusted => 'Drip rate (adjusted)';

  @override
  String get bottomVitals => 'VITALS';

  @override
  String get bottomPam => 'MAP';

  @override
  String get catAntidotes => 'Antidotes';

  @override
  String get catAsthma => 'Asthma';

  @override
  String get catBradyarrhythmias => 'Bradyarrhythmias';

  @override
  String get catHighFlowNasalCannula => 'High-flow nasal cannula';

  @override
  String get medAntidoteNaloxone => 'Naloxone';

  @override
  String get medAntidoteNaloxoneRange => '0.4 mg/mL';

  @override
  String get medAntidoteNaloxoneDose => '0.01 mg/kg';

  @override
  String get medAntidoteNaloxoneNotes => 'Opioid antidote';

  @override
  String get medAntidoteFlumazenil => 'Flumazenil';

  @override
  String get medAntidoteFlumazenilRange => '0.1 mg/mL';

  @override
  String get medAntidoteFlumazenilDose => '0.01 mg/kg';

  @override
  String get medAntidoteFlumazenilNotes => 'Benzodiazepine antidote';

  @override
  String get medAsthmaSalbutamol1to5 => 'Salbutamol 1–5 years';

  @override
  String get medAsthmaSalbutamol1to5Notes => 'Maximum #6 nebulizations';

  @override
  String get medAsthmaSalbutamolOver5 => 'Salbutamol > 5 years';

  @override
  String get medAsthmaSalbutamolOver5Notes => 'Maximum #6 nebulizations';

  @override
  String get medAsthmaAtrovent2to5 => 'Ipratropium (Atrovent) 2–5 years';

  @override
  String get medAsthmaAtrovent2to5Notes => 'Maximum #3 nebulizations';

  @override
  String get medAsthmaAtroventOver5 => 'Ipratropium (Atrovent) > 5 years';

  @override
  String get medAsthmaAtroventOver5Notes => 'Maximum #3 nebulizations';

  @override
  String get medAsthmaPrednisone => 'Prednisone';

  @override
  String get medAsthmaPrednisoneDose => '1–2 mg/kg for 3–5 days';

  @override
  String get medAsthmaPrednisoneNotes => 'Maximum 50 mg';

  @override
  String get medAsthmaDexamethasoneIV => 'Dexamethasone IV';

  @override
  String get medAsthmaDexamethasoneIVRange => '(4 mg/mL)';

  @override
  String get medAsthmaDexamethasoneIVDose => 'every 6 h IV for 3–5 days';

  @override
  String get medAsthmaHydrocortisoneIV => 'Hydrocortisone IV';

  @override
  String get medAsthmaHydrocortisoneIVRange => '(50 mg/mL; 2 mL)';

  @override
  String get medAsthmaHydrocortisoneIVDose =>
      'Max: 100 mg; (every 6 h day 1) (every 12 h day 2) (every 24 h day 3)';

  @override
  String get medAsthmaMethylprednisolone => 'Methylprednisolone';

  @override
  String get medAsthmaMethylprednisoloneRange => '(Loading dose: 2 mg/kg)';

  @override
  String get medAsthmaMethylprednisoloneDose =>
      'Max: 60 mg; Maintenance: 1 mg/kg/dose (q6h day 1); (q12h day 2) and (q24h day 3)';

  @override
  String get medAsthmaMagnesiumSulfate => 'Magnesium sulfate';

  @override
  String get medAsthmaMagnesiumSulfateRange => '(200 mg/mL; 10 mL)';

  @override
  String get medAsthmaMagnesiumSulfateDose =>
      'In 100 mL NS over 20 min IV (maximum 2 doses)';

  @override
  String get medAsthmaMagnesiumSulfateNotes => 'Maximum: 2 g.';

  @override
  String get medBradyEpinephrineIV => 'Epinephrine IV';

  @override
  String get medBradyEpinephrineIVRange => '1 mg/mL (1 mL + 9 mL NS)';

  @override
  String get medBradyEpinephrineIVDose => '(1 mL = 0.1 mg) (0.01 mg/kg)';

  @override
  String get medBradyEpinephrineIVNotes => 'Maximum 10 mL';

  @override
  String get medBradyAtropine => 'Atropine';

  @override
  String get medBradyAtropineRange => '0.5 mg/mL (dilute 2 mL + 8 mL NS)';

  @override
  String get medBradyAtropineDose => '(1 mL = 0.1 mg) (0.02 mg/kg)';

  @override
  String get medHfncFlow => 'Flow';

  @override
  String get medHfncFlowDose => 'Adjust FiO2 to keep oxygen saturation > 94%';

  @override
  String get medHfncFlowNotes => 'Start FiO2 at 50%';

  @override
  String get medHfncCannulaSizeByWeight => 'Cannula size by weight';

  @override
  String get medHfncCannulaSizeByWeightNotes =>
      '\"X\" indicates possible cannula sizes to use based on patient weight';

  @override
  String get printPageOfLabel => 'of';

  @override
  String get catCalciumMaintenance => 'Maintenance calcium';

  @override
  String get catEndocrineRenal => 'Endocrine / Renal';

  @override
  String get catElectrolytes => 'Electrolytes';

  @override
  String get catFeverPain => 'Fever/Pain';

  @override
  String get catUncontrolledSevereBleeding => 'Uncontrolled severe bleeding';

  @override
  String get catIntracranialHypertension => 'Intracranial hypertension';

  @override
  String get medCaMaintCalciumGluconate10 => 'Calcium gluconate 10%';

  @override
  String get medCaMaintCalciumGluconate10Range => '(100 mg/mL; 10 mL)';

  @override
  String get medCaMaintCalciumGluconate10Dose =>
      '2–4 mL/kg/day in maintenance solution over 24 h';

  @override
  String get medCaMaintCalciumGluconate10Notes => 'Max: 2 g/dose (20 mL)';

  @override
  String get medEndoRenalRegularInsulinInfusion => 'Regular insulin';

  @override
  String get medEndoRenalRegularInsulinInfusionRange =>
      '(100 IU/mL; 10 mL) (0.5 mL insulin in 50 mL NS)';

  @override
  String get medEndoRenalRegularInsulinInfusionDose => '0.05–0.1 IU/kg/h';

  @override
  String get medEndoRenalFurosemide => 'Furosemide';

  @override
  String get medEndoRenalFurosemideDose => '0.5–1 mg/kg/dose';

  @override
  String get medElectrolytesCalciumGluconate10HyperK => 'Calcium gluconate 10%';

  @override
  String get medElectrolytesCalciumGluconate10HyperKRange =>
      '(100 mg/mL; 10 mL)';

  @override
  String get medElectrolytesCalciumGluconate10HyperKDose =>
      '0.5 mL/kg IV STAT, slow via peripheral line';

  @override
  String get medElectrolytesCalciumGluconate10HyperKNotes =>
      'Max: 2 g/dose (20 mL)';

  @override
  String get medElectrolytesCalciumChloride10HyperK => 'Calcium chloride 10%';

  @override
  String get medElectrolytesCalciumChloride10HyperKRange =>
      '(100 mg/mL; 10 mL)';

  @override
  String get medElectrolytesCalciumChloride10HyperKDose =>
      '0.1–0.2 mL/kg IV STAT, slow via central line';

  @override
  String get medElectrolytesCalciumChloride10HyperKNotes =>
      'Max: 1 g/dose (10 mL)';

  @override
  String get medElectrolytesNebSalbutamolHyperK => 'Nebulized salbutamol';

  @override
  String get medElectrolytesNebSalbutamolHyperKDose =>
      '<25 kg = 0.5 mL; >25 kg = 1 mL';

  @override
  String get medElectrolytesD10WPlusHyperK => 'Dextrose 10% solution +';

  @override
  String get medElectrolytesD10WPlusHyperKDose => '5 mL/kg +';

  @override
  String get medElectrolytesRegularInsulinBolusHyperK => 'Regular insulin';

  @override
  String get medElectrolytesRegularInsulinBolusHyperKRange =>
      '(100 IU/mL; 10 mL) (0.5 mL insulin in 50 mL NS)';

  @override
  String get medElectrolytesRegularInsulinBolusHyperKDose =>
      '0.1 IU/kg IV over 1 h with dextrose 10%';

  @override
  String get medElectrolytesSodiumBicarb1MHyperK => 'Sodium bicarbonate 1 M';

  @override
  String get medElectrolytesSodiumBicarb1MHyperKRange => '(1 mEq/mL)';

  @override
  String get medElectrolytesSodiumBicarb1MHyperKDose =>
      'Dilute with NS: central line (1 bicarb : 1 NS); peripheral line (1 bicarb : 6 NS)';

  @override
  String get medFeverPainParacetamolPoIv => 'Paracetamol PO/IV';

  @override
  String get medFeverPainParacetamolPoIvDose => '15 mg/kg/dose every 6 h';

  @override
  String get medFeverPainMetamizoleIv => 'Metamizole IV';

  @override
  String get medFeverPainMetamizoleIvDose => '15 mg/kg/dose every 8 h';

  @override
  String get medFeverPainMetamizoleIvNotes => 'Max: 1 g per dose / 4 g per day';

  @override
  String get medMassiveBleedingTranexamicAcid => 'Tranexamic acid';

  @override
  String get medMassiveBleedingTranexamicAcidRange => '100 mg/mL';

  @override
  String get medMassiveBleedingTranexamicAcidDose => '15 mg/kg';

  @override
  String get medMassiveBleedingTranexamicAcidNotes => 'Warm fluids';

  @override
  String get medMassiveBleedingRbcFfp => 'PRBC/FFP';

  @override
  String get medMassiveBleedingRbcFfpRange => '(1:1 dilution)';

  @override
  String get medMassiveBleedingRbcFfpDose => '5 mL/kg';

  @override
  String get medMassiveBleedingRbcFfpNotes => 'Warm fluids';

  @override
  String get medMassiveBleedingPlatelets => 'Platelets';

  @override
  String get medMassiveBleedingPlateletsDose => '10–15 mL/kg';

  @override
  String get medMassiveBleedingPlateletsNotes => 'Warm fluids';

  @override
  String get medMassiveBleedingCryo => 'Cryoprecipitate';

  @override
  String get medMassiveBleedingCryoDose => '10 mL/kg';

  @override
  String get medMassiveBleedingCryoNotes => 'Warm fluids';

  @override
  String get medIchHypertonicSaline3 => 'Hypertonic saline 3%';

  @override
  String get medIchHypertonicSaline3Range => '(30 mL NaCl 4M + 70 mL NS)';

  @override
  String get medIchHypertonicSaline3Dose => '2–5 mL/kg over 10 min';

  @override
  String get medIchHypertonicSaline3Notes => 'Monitor HR increase';

  @override
  String get medIchMannitol => 'Mannitol';

  @override
  String get medIchMannitolRange => '20 g/100 mL';

  @override
  String get medIchMannitolDose => '0.5–1 g/kg over 10 min';

  @override
  String get medIchMannitolNotes => 'Monitor HR increase';

  @override
  String get catSevereHypocalcemiaHypermagCCB =>
      'Severe hypocalcemia / hypermagnesemia / calcium channel blocker intoxication';

  @override
  String get catAcuteSymptomaticHyponatremia =>
      'Acute symptomatic hyponatremia (seizures)';

  @override
  String get catHypoglycemia => 'Hypoglycemia';

  @override
  String get catSedationInfusions => 'Sedation infusions';

  @override
  String get catInotropes => 'Inotropes';

  @override
  String get catIVFluids => 'IV fluids';

  @override
  String get catRespiratorySpecificMeds =>
      'Respiratory condition-specific medication';

  @override
  String get catNeuromuscularParalysis => 'Neuromuscular paralysis';

  @override
  String get catCardiacArrest => 'Cardiac arrest';

  @override
  String get medHypocalcemiaCalciumGluconate10 => 'Calcium gluconate 10%';

  @override
  String get medHypocalcemiaCalciumGluconate10Range => '(100 mg/mL; 10 mL)';

  @override
  String get medHypocalcemiaCalciumGluconate10Dose =>
      '0.5 mL/kg IV STAT, slow via peripheral line';

  @override
  String get medHypocalcemiaCalciumGluconate10Notes => 'Max: 2 g/dose (20 mL)';

  @override
  String get medHypocalcemiaCalciumChloride10 => 'Calcium chloride 10%';

  @override
  String get medHypocalcemiaCalciumChloride10Range => '(100 mg/mL; 10 mL)';

  @override
  String get medHypocalcemiaCalciumChloride10Dose =>
      '0.1–0.2 mL/kg IV STAT, slow via central line';

  @override
  String get medHypocalcemiaCalciumChloride10Notes => 'Max: 1 g/dose (10 mL)';

  @override
  String get medHyponatremiaHypertonicSaline3 => 'Hypertonic saline 3%';

  @override
  String get medHyponatremiaHypertonicSaline3Range =>
      '(30 mL NaCl 4M + 70 mL NS)';

  @override
  String get medHyponatremiaHypertonicSaline3Dose => '4 mL/kg over 20 min';

  @override
  String get medHyponatremiaHypertonicSaline3Notes =>
      'Monitor seizure cessation';

  @override
  String get medHypoglycemiaDextrose10 => 'Dextrose 10% solution';

  @override
  String get medHypoglycemiaDextrose10Dose =>
      '0.5–1 g/kg/dose = 5–10 mL/kg/dose IV STAT';

  @override
  String get medHypoglycemiaDextrose10Notes => 'Check bedside glucose in 1 min';

  @override
  String get medSedationInfusionMorphine => 'Morphine';

  @override
  String get medSedationInfusionMorphineRange => '(15 mg/mL; 1 mL)';

  @override
  String get medSedationInfusionMorphineDose => '20 mcg/kg/h';

  @override
  String get medSedationInfusionMidazolam => 'Midazolam';

  @override
  String get medSedationInfusionMidazolamRange => '(5 mg/mL; 3 mL)';

  @override
  String get medSedationInfusionMidazolamDose => '2 mcg/kg/min';

  @override
  String get medSedationInfusionFentanyl => 'Fentanyl';

  @override
  String get medSedationInfusionFentanylRange => '(50 mcg/mL; 2 mL)';

  @override
  String get medSedationInfusionFentanylDose => '5 mcg/kg/h';

  @override
  String get medInotropesEpiNorepiInfusion => 'Epinephrine / norepinephrine';

  @override
  String get medInotropesEpiNorepiInfusionDose =>
      '0.3 mg/kg in 50 mL D5W, start 1 mL/h up to 5 mL/h';

  @override
  String get medInotropesEpiNorepiInfusionNotes => '0.1 mcg/kg/min';

  @override
  String get medInotropesDopamineDobutamineInfusion => 'Dopamine / dobutamine';

  @override
  String get medInotropesDopamineDobutamineInfusionDose =>
      '15 mg/kg in 50 mL D5W, start 1 mL/h up to 4 mL/h';

  @override
  String get medInotropesDopamineDobutamineInfusionNotes => '5 mcg/kg/min';

  @override
  String get medIvFluidsMixedSolution => 'Mixed maintenance solution';

  @override
  String get medIvFluidsMixedSolutionRange => '(100% requirements)';

  @override
  String get medIvFluidsMixedSolutionDose =>
      'Run on infusion pump continuously over 24 h IV';

  @override
  String get medIvFluidsDrip => 'Drip rate';

  @override
  String get medIvFluidsDripNotes => 'Daily requirements';

  @override
  String get medIvFluidsResult => 'Result';

  @override
  String get medIvFluidsResultDose => 'Subtract medications';

  @override
  String get medIvFluidsDripAdjusted => 'Drip rate (adjusted)';

  @override
  String get medIvFluidsDripAdjustedDose => 'Subtract infusions';

  @override
  String get medIvFluidsDripAdjustedNotes => 'Fluid calculation by percentage';

  @override
  String get medRespCroupDexamethasoneIv => 'Dexamethasone IV';

  @override
  String get medRespCroupDexamethasoneIvRange => '(4 mg/mL)';

  @override
  String get medRespCroupDexamethasoneIvDose => '0.6 mg/kg single dose';

  @override
  String get medRespCroupNebEpinephrine => 'Nebulized epinephrine';

  @override
  String get medRespCroupNebEpinephrineRange => '(L-epinephrine 1:1000)';

  @override
  String get medRespCroupNebEpinephrineDose =>
      '0.5 mg/kg (Dilute 1:1 with normal saline)';

  @override
  String get medRespCroupNebEpinephrineNotes => 'Max 5 mL';

  @override
  String get medRespCroupNebBudesonide => 'Nebulized budesonide';

  @override
  String get medRespCroupNebBudesonideRange => '(0.5 mg/mL; 2 mL)';

  @override
  String get medParalysisSuccinylcholine => 'Succinylcholine';

  @override
  String get medParalysisSuccinylcholineRange =>
      '(50 mg/mL; 10 mL) (1 mL + 5 mL NS)';

  @override
  String get medParalysisSuccinylcholineDose => '1–2 mg/kg';

  @override
  String get medParalysisSuccinylcholineNotes => 'Effect lasts minutes.';

  @override
  String get medParalysisPancuronium => 'Pancuronium';

  @override
  String get medParalysisPancuroniumRange => '(2 mg/mL)';

  @override
  String get medParalysisPancuroniumDose => '0.1 mg/kg';

  @override
  String get medParalysisPancuroniumNotes => 'Effect ~40 min.';

  @override
  String get medParalysisRocuronium => 'Rocuronium';

  @override
  String get medParalysisRocuroniumRange => '(10 mg/mL)';

  @override
  String get medParalysisRocuroniumDose => '1 mg/kg';

  @override
  String get medParalysisRocuroniumNotes => 'Effect ~30 min.';

  @override
  String get medParalysisAtracurium => 'Atracurium';

  @override
  String get medParalysisAtracuriumRange => '(10 mg/mL)';

  @override
  String get medParalysisAtracuriumDose => '0.4 mg/kg';

  @override
  String get medParalysisAtracuriumNotes => 'Effect ~20 min.';

  @override
  String get medParalysisEttUncuffed => 'ETT (uncuffed)';

  @override
  String get medParalysisEttUncuffedDose =>
      'Have ETT 0.5 mm smaller and larger available';

  @override
  String get medParalysisEttCuffed => 'ETT (cuffed)';

  @override
  String get medParalysisEttCuffedDose =>
      'Have ETT 0.5 mm smaller and larger available';

  @override
  String get medParalysisEttDepthLip => 'Insertion depth at lip corner';

  @override
  String get medParalysisEttDepthLipDose => 'Also use ETT x 3';

  @override
  String get medCardiacArrestEpinephrineIv => 'Epinephrine IV';

  @override
  String get medCardiacArrestEpinephrineIvRange => '1 mg/mL (1 mL + 9 mL NS)';

  @override
  String get medCardiacArrestEpinephrineIvDose =>
      '(1 mL = 0.1 mg) (0.01 mg/kg)';

  @override
  String get medCardiacArrestEpinephrineIvNotes => 'Max 10 mL';

  @override
  String get medCardiacArrestEpinephrineEt => 'Epinephrine ET';

  @override
  String get medCardiacArrestEpinephrineEtRange => '1 mg/mL (1 mL + 9 mL NS)';

  @override
  String get medCardiacArrestEpinephrineEtDose => '(1 mL = 0.1 mg) (0.1 mg/kg)';

  @override
  String get medCardiacArrestEpinephrineEtNotes => 'Max 10 mL';

  @override
  String get medCardiacArrestFirstShock => 'First shock';

  @override
  String get medCardiacArrestFirstShockDose => '2 J/kg';

  @override
  String get medCardiacArrestFirstShockNotes => 'Double with each shock';

  @override
  String get medCardiacArrestSecondShock => 'Second shock';

  @override
  String get medCardiacArrestSecondShockDose => '2 J/kg';

  @override
  String get medCardiacArrestSecondShockNotes => 'Max 10 J/kg';

  @override
  String get medCardiacArrestAmiodarone => 'Amiodarone';

  @override
  String get medCardiacArrestAmiodaroneRange =>
      '(50 mg/mL; 3 mL) (3 mL + 22 mL D5W)';

  @override
  String get medCardiacArrestAmiodaroneDose => '5 mg/kg';

  @override
  String get medCardiacArrestAmiodaroneNotes => 'Max 300 mg';

  @override
  String get medCardiacArrestMagnesiumSulfate => 'Magnesium sulfate';

  @override
  String get medCardiacArrestMagnesiumSulfateRange => '(200 mg/mL; 10 mL)';

  @override
  String get medCardiacArrestMagnesiumSulfateDose =>
      '50 mg/kg; dilute to 5 mL with NS and give over 3–5 min';

  @override
  String get medCardiacArrestMagnesiumSulfateNotes => 'Max 2 g';

  @override
  String get medCardiacArrestSodiumBicarb1M => 'Sodium bicarbonate 1 M';

  @override
  String get medCardiacArrestSodiumBicarb1MRange => '(Dilute 1:1 with NS)';

  @override
  String get medCardiacArrestSodiumBicarb1MDose => '(1 mEq/kg)';

  @override
  String get catSVT => 'Supraventricular tachycardia';

  @override
  String get catHco3Replacement => 'Bicarbonate (HCO₃⁻) replacement';

  @override
  String get catPotassiumReplacement => 'Potassium replacement';

  @override
  String get catRSI => 'Rapid sequence intubation';

  @override
  String get catShock => 'Shock';

  @override
  String get catStatusEpilepticus => 'Status epilepticus';

  @override
  String get catCentralLinesPleuralDrains => 'Central lines and pleural drains';

  @override
  String get medSvtAdenosineFirst => 'Adenosine (first)';

  @override
  String get medSvtAdenosineFirstRange => '3 mg/mL (First dose)';

  @override
  String get medSvtAdenosineFirstDose => '0.1 mg/kg';

  @override
  String get medSvtAdenosineFirstNotes => 'Max 2 mL';

  @override
  String get medSvtAdenosineSecond => 'Adenosine (second)';

  @override
  String get medSvtAdenosineSecondRange => '3 mg/mL (Second dose)';

  @override
  String get medSvtAdenosineSecondDose => '0.2 mg/kg';

  @override
  String get medSvtAdenosineSecondNotes => 'Max 4 mL';

  @override
  String get medSvtAdenosineThird => 'Adenosine (third)';

  @override
  String get medSvtAdenosineThirdRange => '3 mg/mL (Third dose)';

  @override
  String get medSvtAdenosineThirdDose => '0.3 mg/kg';

  @override
  String get medSvtAdenosineThirdNotes => 'Max 4 mL';

  @override
  String get medSvtAmiodarone => 'Amiodarone';

  @override
  String get medSvtAmiodaroneRange => '(50 mg/mL; 3 mL) (3 mL + 22 mL D5W)';

  @override
  String get medSvtAmiodaroneDose => '5 mg/kg over 30 min–1 h';

  @override
  String get medSvtAmiodaroneNotes => 'Max 300 mg';

  @override
  String get medHco3PatientValue => 'Patient HCO₃⁻';

  @override
  String get medHco3PatientValueNotes => 'Check Na and blood gases at the end';

  @override
  String get medHco3Deficit => 'HCO₃⁻ deficit';

  @override
  String get medHco3DeficitDose => 'of sodium bicarbonate 1M (1 mEq/mL)';

  @override
  String get medHco3Sg5Volume => 'D5W volume';

  @override
  String get medHco3Sg5VolumeRange => 'to dilute HCO₃⁻ deficit';

  @override
  String get medHco3Sg5VolumeDose => 'Run over 3 h';

  @override
  String get medHco3InfusionRate3h => 'Infusion rate (over 3 h)';

  @override
  String get medHco3InfusionRate3hRange => 'to dilute HCO₃⁻ deficit';

  @override
  String get medHco3InfusionRate3hDose => 'Run over 3 h';

  @override
  String get medKReplacementSfVolume => 'NS volume';

  @override
  String get medKReplacementSfVolumeRange => '500 mL + 10 mL KCl 2M';

  @override
  String get medKReplacementSfVolumeDose => 'Run over 2 h via peripheral line';

  @override
  String get medKReplacementSfVolumeNotes => 'Recheck potassium at the end';

  @override
  String get medRsiMidazolam => 'Midazolam';

  @override
  String get medRsiMidazolamRange => '(5 mg/mL; 3 mL)';

  @override
  String get medRsiMidazolamDose => '0.3 mg/kg';

  @override
  String get medShockNormalSaline => 'Normal saline';

  @override
  String get medShockNormalSalineRange => '0.9% (10 mL/kg bolus)';

  @override
  String get medShockNormalSalineDose =>
      '10–20 mL/kg every 5 min. Max 60 mL/kg.';

  @override
  String get medShockNormalSalineNotes => 'Consider inotropes';

  @override
  String get medSeizureDiazepamIv => 'Diazepam IV';

  @override
  String get medSeizureDiazepamIvRange => '(5 mg/mL; 2 mL)';

  @override
  String get medSeizureDiazepamIvDose => '0.3 mg/kg every 5 min ×3 doses';

  @override
  String get medSeizureDiazepamIvNotes => 'Max 2 mL';

  @override
  String get medSeizureDiazepamPr => 'Diazepam PR';

  @override
  String get medSeizureDiazepamPrRange => '(5 mg/mL; 2 mL)';

  @override
  String get medSeizureDiazepamPrDose =>
      '0.5 mg/kg; Insert rectal angiocath 5 cm';

  @override
  String get medSeizureDiazepamPrNotes => 'Max 2 mL';

  @override
  String get medSeizureMidazolamIvIm => 'Midazolam IV or IM';

  @override
  String get medSeizureMidazolamIvImRange => '(5 mg/mL; 3 mL)';

  @override
  String get medSeizureMidazolamIvImDose => '0.3 mg/kg every 5 min ×3 doses';

  @override
  String get medSeizureMidazolamIvImNotes => 'Max 2 mL';

  @override
  String get medSeizureMidazolamIn => 'Midazolam IN';

  @override
  String get medSeizureMidazolamInRange => '(5 mg/mL; 3 mL)';

  @override
  String get medSeizureMidazolamInDose =>
      '0.4 mg/kg every 5 min ×3 doses. Use nasal atomizer';

  @override
  String get medSeizureMidazolamInNotes => 'Max 2 mL';

  @override
  String get medSeizurePhenytoinIv => 'Phenytoin IV';

  @override
  String get medSeizurePhenytoinIvRange => '(50 mg/mL; 5 mL)';

  @override
  String get medSeizurePhenytoinIvDose =>
      '20 mg/kg; dilute 10× with NS and run over 30 min';

  @override
  String get medSeizurePhenytoinIvNotes => 'Dilute in NS, never in dextrose';

  @override
  String get medSeizurePhenobarbitalIv => 'Phenobarbital IV';

  @override
  String get medSeizurePhenobarbitalIvRange => '(50 mg/mL; 1 mL)';

  @override
  String get medSeizurePhenobarbitalIvDose =>
      '20 mg/kg; dilute 10× with sterile water and run over 15 min';

  @override
  String get medSeizurePhenobarbitalIvNotes =>
      'Dilute in water, never in dextrose';

  @override
  String get medCentralLinesFemoralDepth => 'Femoral catheter:';

  @override
  String get medCentralLinesFemoralDepthDose => 'Insertion depth';

  @override
  String get medCentralLinesFemoralDepthNotes => '13–30 cm';

  @override
  String get medCentralLinesJugularDepth => 'Jugular catheter:';

  @override
  String get medCentralLinesJugularDepthDose => 'Insertion depth';

  @override
  String get medCentralLinesJugularDepthNotes => '5–8 cm';

  @override
  String get medPleuralDrainCatheter => 'Pleural drain catheter:';

  @override
  String get medPleuralDrainCatheterDose => 'Preschool: 8–20F';

  @override
  String get medPleuralDrainCatheterNotes => 'Adolescents: 14–36F';
}
