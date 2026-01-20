// lib/i18n/med_i18n.dart
import '../l10n/app_localizations.dart';
import '../models/medicamento.dart';

/// Traducción ES/EN para:
/// - NOMBRE del medicamento (por id)
/// - CATEGORÍA (por texto)
/// - RANGO DOSIS ORIGINAL (por id)
/// - DOSIS ACTUAL (por id)
/// - OBSERVACIONES (por id)
///
/// ✅ Si un id no está mapeado, devuelve el texto original del modelo.
/// ✅ Si una categoría no está mapeada, devuelve la categoría original.
///
/// IMPORTANTE:
/// - Asegúrate de que en tus listas Medicamento(...) tengas `id: '...'`
/// - Y que en tus .arb existan las keys usadas abajo:
///   - cat...
///   - med... (name)
///   - med...Range, med...Dose, med...Notes (nuevas)
class MedI18n {
  MedI18n._();

  // ============================
  // CATEGORÍAS
  // ============================
  static String category(String categoria, AppLocalizations t) {
    final c = _norm(categoria);

    // Básicas (las que ya estás usando)
    if (c == _norm('Anafilaxia')) return t.catAnaphylaxis;
    if (c == _norm('Analgesia')) return t.catAnalgesia;
    if (c == _norm('Antibioticos') || c == _norm('Antibióticos')) {
      return t.catAntibiotics;
    }
    if (c == _norm('Antídotos') || c == _norm('Antidotos'))
      return t.catAntidotes;
    if (c == _norm('Asma')) return t.catAsthma;
    if (c == _norm('Bradiarritmias')) return t.catBradyarrhythmias;
    if (c == _norm('Cánulas de alto flujo') ||
        c == _norm('Canulas de alto flujo')) {
      return t.catHighFlowNasalCannula;
    }

    if (c == _norm('Calcio de mantenimiento')) return t.catCalciumMaintenance;
    if (c == _norm('Endocrino / Renal')) return t.catEndocrineRenal;
    if (c == _norm('Electrolitos')) return t.catElectrolytes;
    if (c == _norm('Fiebre/Dolor')) return t.catFeverPain;
    if (c == _norm('Hemorragia severa incontrolable'))
      return t.catUncontrolledSevereBleeding;
    if (c == _norm('Hipertension intracraneal') ||
        c == _norm('Hipertensión intracraneal')) {
      return t.catIntracranialHypertension;
    }
    if (c ==
            _norm(
              'Hipocalcemia severa, hipermagnesemia o intoxicacion con bloqueadores canales de calcio',
            ) ||
        c ==
            _norm(
              'Hipocalcemia severa, hipermagnesemia ó intoxicación con bloqueadores canales de calcio',
            )) {
      return t.catSevereHypocalcemiaHypermagCCB;
    }

    if (c == _norm('Hiponatremia aguda sintomatica (convulsiones)') ||
        c == _norm('Hiponatremia aguda sintomática (convulsiones)')) {
      return t.catAcuteSymptomaticHyponatremia;
    }

    if (c == _norm('Hipoglicemia')) return t.catHypoglycemia;
    if (c == _norm('Infusiones sedacion') || c == _norm('Infusiones sedación'))
      return t.catSedationInfusions;
    if (c == _norm('Inotropicos') || c == _norm('Inotrópicos'))
      return t.catInotropes;

    if (c == _norm('Liquids iv') || c == _norm('Líquids IV'))
      return t.catIVFluids;

    if (c == _norm('Medicacion especifica segun patologia respiratoria') ||
        c == _norm('Medicación específica según patología respiratoria')) {
      return t.catRespiratorySpecificMeds;
    }

    if (c == _norm('Paralisis muscular') || c == _norm('Parálisis muscular'))
      return t.catNeuromuscularParalysis;
    if (c == _norm('Paro cardiaco') || c == _norm('Paro cardíaco'))
      return t.catCardiacArrest;

    if (c == _norm('Taquicardia supraventricular')) return t.catSVT;

    if (c == _norm('Reposicion de hco3') || c == _norm('Reposición de HCO3')) {
      return t.catHco3Replacement;
    }

    if (c == _norm('Reposicion de k') || c == _norm('Reposición de K')) {
      return t.catPotassiumReplacement;
    }

    if (c == _norm('Secuencia rapida de intubacion') ||
        c == _norm('Secuencia rápida de intubación')) {
      return t.catRSI;
    }

    if (c == _norm('Shock')) return t.catShock;

    if (c == _norm('Status convulsivo')) return t.catStatusEpilepticus;

    if (c == _norm('Vias centrales y drenajes pleurales') ||
        c == _norm('Vías centrales y drenajes pleurales')) {
      return t.catCentralLinesPleuralDrains;
    }

    // Si no existe traducción, se deja igual
    return categoria;
  }

  // ============================
  // NOMBRE MEDICAMENTO (por id)
  // ============================
  static String name(Medicamento m, AppLocalizations t) {
    final id = (m.id ?? '').trim();
    if (id.isEmpty) return m.nombre;

    switch (id) {
      // ----------------------------
      // Anafilaxia
      // ----------------------------
      case 'med_ana_epi_im_standard':
        return t.medAnaEpiImStandard;
      case 'med_ana_epi_im_weight_based':
        return t.medAnaEpiImWeightBased;

      // ----------------------------
      // Analgesia
      // ----------------------------
      case 'med_analgesia_fentanyl':
        return t.medAnalgesiaFentanyl;
      case 'med_analgesia_morphine':
        return t.medAnalgesiaMorphine;
      case 'med_analgesia_ketamine':
        return t.medAnalgesiaKetamine;

      // ----------------------------
      // Antídotos
      // ----------------------------
      case 'med_antidote_naloxone':
        return t.medAntidoteNaloxone;
      case 'med_antidote_flumazenil':
        return t.medAntidoteFlumazenil;

      // ----------------------------
      // Asma
      // ----------------------------
      case 'med_asthma_salbutamol_1_5':
        return t.medAsthmaSalbutamol1to5;
      case 'med_asthma_salbutamol_gt_5':
        return t.medAsthmaSalbutamolOver5;
      case 'med_asthma_atrovent_2_5':
        return t.medAsthmaAtrovent2to5;
      case 'med_asthma_atrovent_gt_5':
        return t.medAsthmaAtroventOver5;
      case 'med_asthma_prednisone':
        return t.medAsthmaPrednisone;
      case 'med_asthma_dexamethasone_iv':
        return t.medAsthmaDexamethasoneIV;
      case 'med_asthma_hydrocortisone_iv':
        return t.medAsthmaHydrocortisoneIV;
      case 'med_asthma_methylprednisolone':
        return t.medAsthmaMethylprednisolone;
      case 'med_asthma_magnesium_sulfate':
        return t.medAsthmaMagnesiumSulfate;

      // ----------------------------
      // Bradiarritmias
      // ----------------------------
      case 'med_brady_epinephrine_iv':
        return t.medBradyEpinephrineIV;
      case 'med_brady_atropine':
        return t.medBradyAtropine;

      // ----------------------------
      // Cánulas alto flujo
      // ----------------------------
      case 'med_hfnc_flow':
        return t.medHfncFlow;
      case 'med_hfnc_cannula_size_by_weight':
        return t.medHfncCannulaSizeByWeight;

      // ----------------------------
      // Antibióticos
      // ----------------------------
      case 'med_abx_ampicillin':
        return t.medAbxAmpicillin;
      case 'med_abx_cefotaxime':
        return t.medAbxCefotaxime;
      case 'med_abx_ceftazidime':
        return t.medAbxCeftazidime;
      case 'med_abx_meropenem':
        return t.medAbxMeropenem;
      case 'med_abx_vancomycin':
        return t.medAbxVancomycin;
      case 'med_abx_acyclovir':
        return t.medAbxAcyclovir;
      case 'med_abx_pip_tazo':
        return t.medAbxPipTazo;
      case 'med_abx_amox_clav':
        return t.medAbxAmoxClav;
      case 'med_abx_amikacin':
        return t.medAbxAmikacin;
      case 'med_abx_clindamycin':
        return t.medAbxClindamycin;

      // Calcio mantenimiento
      case 'med_ca_maint_calcium_gluconate_10':
        return t.medCaMaintCalciumGluconate10;

      // Endocrino / Renal
      case 'med_endo_renal_regular_insulin_infusion':
        return t.medEndoRenalRegularInsulinInfusion;
      case 'med_endo_renal_furosemide':
        return t.medEndoRenalFurosemide;

      // Electrolitos (hiperkalemia)
      case 'med_electrolytes_calcium_gluconate_10_hyperk':
        return t.medElectrolytesCalciumGluconate10HyperK;
      case 'med_electrolytes_calcium_chloride_10_hyperk':
        return t.medElectrolytesCalciumChloride10HyperK;
      case 'med_electrolytes_neb_salbutamol_hyperk':
        return t.medElectrolytesNebSalbutamolHyperK;
      case 'med_electrolytes_d10w_plus_hyperk':
        return t.medElectrolytesD10WPlusHyperK;
      case 'med_electrolytes_regular_insulin_bolus_hyperk':
        return t.medElectrolytesRegularInsulinBolusHyperK;
      case 'med_electrolytes_sodium_bicarb_1m_hyperk':
        return t.medElectrolytesSodiumBicarb1MHyperK;

      // Fiebre/Dolor
      case 'med_fever_pain_paracetamol_po_iv':
        return t.medFeverPainParacetamolPoIv;
      case 'med_fever_pain_metamizole_iv':
        return t.medFeverPainMetamizoleIv;

      // Hemorragia severa incontrolable
      case 'med_massive_bleeding_tranexamic_acid':
        return t.medMassiveBleedingTranexamicAcid;
      case 'med_massive_bleeding_rbc_ffp':
        return t.medMassiveBleedingRbcFfp;
      case 'med_massive_bleeding_platelets':
        return t.medMassiveBleedingPlatelets;
      case 'med_massive_bleeding_cryo':
        return t.medMassiveBleedingCryo;

      // Hipertensión intracraneal
      case 'med_ich_hypertonic_saline_3':
        return t.medIchHypertonicSaline3;
      case 'med_ich_mannitol':
        return t.medIchMannitol;

      case 'med_hypocalcemia_calcium_gluconate_10':
        return t.medHypocalcemiaCalciumGluconate10;
      case 'med_hypocalcemia_calcium_chloride_10':
        return t.medHypocalcemiaCalciumChloride10;

      case 'med_symptomatic_hyponatremia_hypertonic_saline_3':
        return t.medHyponatremiaHypertonicSaline3;

      case 'med_hypoglycemia_dextrose_10':
        return t.medHypoglycemiaDextrose10;

      case 'med_sedation_infusion_morphine':
        return t.medSedationInfusionMorphine;
      case 'med_sedation_infusion_midazolam':
        return t.medSedationInfusionMidazolam;
      case 'med_sedation_infusion_fentanyl':
        return t.medSedationInfusionFentanyl;

      case 'med_inotropes_epi_norepi_infusion':
        return t.medInotropesEpiNorepiInfusion;
      case 'med_inotropes_dopamine_dobutamine_infusion':
        return t.medInotropesDopamineDobutamineInfusion;

      case 'med_liquids_iv_mixed_solution':
        return t.medIvFluidsMixedSolution;
      case 'med_liquids_iv_drip':
        return t.medIvFluidsDrip;
      case 'med_liquids_iv_result':
        return t.medIvFluidsResult;
      case 'med_liquids_iv_drip_adjusted':
        return t.medIvFluidsDripAdjusted;

      case 'med_resp_croup_dexamethasone_iv':
        return t.medRespCroupDexamethasoneIv;
      case 'med_resp_croup_neb_epinephrine':
        return t.medRespCroupNebEpinephrine;
      case 'med_resp_croup_neb_budesonide':
        return t.medRespCroupNebBudesonide;

      case 'med_paralysis_succinylcholine':
        return t.medParalysisSuccinylcholine;
      case 'med_paralysis_pancuronium':
        return t.medParalysisPancuronium;
      case 'med_paralysis_rocuronium':
        return t.medParalysisRocuronium;
      case 'med_paralysis_atracurium':
        return t.medParalysisAtracurium;
      case 'med_paralysis_ett_uncuffed':
        return t.medParalysisEttUncuffed;
      case 'med_paralysis_ett_cuffed':
        return t.medParalysisEttCuffed;
      case 'med_paralysis_ett_depth_lip':
        return t.medParalysisEttDepthLip;

      case 'med_cardiac_arrest_epinephrine_iv':
        return t.medCardiacArrestEpinephrineIv;
      case 'med_cardiac_arrest_epinephrine_et':
        return t.medCardiacArrestEpinephrineEt;
      case 'med_cardiac_arrest_first_shock':
        return t.medCardiacArrestFirstShock;
      case 'med_cardiac_arrest_second_shock':
        return t.medCardiacArrestSecondShock;
      case 'med_cardiac_arrest_amiodarone':
        return t.medCardiacArrestAmiodarone;
      case 'med_cardiac_arrest_magnesium_sulfate':
        return t.medCardiacArrestMagnesiumSulfate;
      case 'med_cardiac_arrest_sodium_bicarb_1m':
        return t.medCardiacArrestSodiumBicarb1M;

      case 'med_svt_adenosine_first':
        return t.medSvtAdenosineFirst;
      case 'med_svt_adenosine_second':
        return t.medSvtAdenosineSecond;
      case 'med_svt_adenosine_third':
        return t.medSvtAdenosineThird;
      case 'med_svt_amiodarone':
        return t.medSvtAmiodarone;

      case 'med_hco3_patient_value':
        return t.medHco3PatientValue;
      case 'med_hco3_deficit':
        return t.medHco3Deficit;
      case 'med_hco3_sg5_volume':
        return t.medHco3Sg5Volume;
      case 'med_hco3_infusion_rate_3h':
        return t.medHco3InfusionRate3h;

      case 'med_k_replacement_sf_volume':
        return t.medKReplacementSfVolume;

      case 'med_rsi_midazolam':
        return t.medRsiMidazolam;

      case 'med_shock_normal_saline':
        return t.medShockNormalSaline;

      case 'med_seizure_diazepam_iv':
        return t.medSeizureDiazepamIv;
      case 'med_seizure_diazepam_pr':
        return t.medSeizureDiazepamPr;
      case 'med_seizure_midazolam_iv_im':
        return t.medSeizureMidazolamIvIm;
      case 'med_seizure_midazolam_in':
        return t.medSeizureMidazolamIn;
      case 'med_seizure_phenytoin_iv':
        return t.medSeizurePhenytoinIv;
      case 'med_seizure_phenobarbital_iv':
        return t.medSeizurePhenobarbitalIv;

      case 'med_central_lines_femoral_depth':
        return t.medCentralLinesFemoralDepth;
      case 'med_central_lines_jugular_depth':
        return t.medCentralLinesJugularDepth;
      case 'med_pleural_drain_catheter':
        return t.medPleuralDrainCatheter;

      default:
        return m.nombre;
    }
  }

  // ============================
  // RANGO DOSIS ORIGINAL (por id)
  // ============================
  static String rangeDose(Medicamento m, AppLocalizations t) {
    final id = (m.id ?? '').trim();
    if (id.isEmpty) return m.rangoDosisOriginal;

    switch (id) {
      // ----------------------------
      // Anafilaxia
      // ----------------------------
      case 'med_ana_epi_im_standard':
        return t.medAnaEpiImStandardRange;
      case 'med_ana_epi_im_weight_based':
        return t.medAnaEpiImWeightBasedRange;

      // ----------------------------
      // Analgesia
      // ----------------------------
      case 'med_analgesia_fentanyl':
        return t.medAnalgesiaFentanylRange;
      case 'med_analgesia_morphine':
        return t.medAnalgesiaMorphineRange;
      case 'med_analgesia_ketamine':
        return t.medAnalgesiaKetamineRange;

      // ----------------------------
      // Antibióticos
      // ----------------------------
      case 'med_abx_ampicillin':
        return t.medAbxAmpicillinRange;
      case 'med_abx_cefotaxime':
        return t.medAbxCefotaximeRange;
      case 'med_abx_ceftazidime':
        return t.medAbxCeftazidimeRange;
      case 'med_abx_meropenem':
        return t.medAbxMeropenemRange;
      case 'med_abx_vancomycin':
        return t.medAbxVancomycinRange;
      case 'med_abx_acyclovir':
        return t.medAbxAcyclovirRange;
      case 'med_abx_pip_tazo':
        return t.medAbxPipTazoRange;
      case 'med_abx_amox_clav':
        return t.medAbxAmoxClavRange;
      case 'med_abx_amikacin':
        return t.medAbxAmikacinRange;
      case 'med_abx_clindamycin':
        return t.medAbxClindamycinRange;

      case 'med_antidote_naloxone':
        return t.medAntidoteNaloxoneRange;
      case 'med_antidote_flumazenil':
        return t.medAntidoteFlumazenilRange;

      case 'med_asthma_dexamethasone_iv':
        return t.medAsthmaDexamethasoneIVRange;
      case 'med_asthma_hydrocortisone_iv':
        return t.medAsthmaHydrocortisoneIVRange;
      case 'med_asthma_methylprednisolone':
        return t.medAsthmaMethylprednisoloneRange;
      case 'med_asthma_magnesium_sulfate':
        return t.medAsthmaMagnesiumSulfateRange;

      case 'med_brady_epinephrine_iv':
        return t.medBradyEpinephrineIVRange;
      case 'med_brady_atropine':
        return t.medBradyAtropineRange;

      case 'med_ca_maint_calcium_gluconate_10':
        return t.medCaMaintCalciumGluconate10Range;

      case 'med_endo_renal_regular_insulin_infusion':
        return t.medEndoRenalRegularInsulinInfusionRange;

      case 'med_electrolytes_calcium_gluconate_10_hyperk':
        return t.medElectrolytesCalciumGluconate10HyperKRange;
      case 'med_electrolytes_calcium_chloride_10_hyperk':
        return t.medElectrolytesCalciumChloride10HyperKRange;
      case 'med_electrolytes_regular_insulin_bolus_hyperk':
        return t.medElectrolytesRegularInsulinBolusHyperKRange;
      case 'med_electrolytes_sodium_bicarb_1m_hyperk':
        return t.medElectrolytesSodiumBicarb1MHyperKRange;

      case 'med_massive_bleeding_tranexamic_acid':
        return t.medMassiveBleedingTranexamicAcidRange;
      case 'med_massive_bleeding_rbc_ffp':
        return t.medMassiveBleedingRbcFfpRange;

      case 'med_ich_hypertonic_saline_3':
        return t.medIchHypertonicSaline3Range;
      case 'med_ich_mannitol':
        return t.medIchMannitolRange;

      case 'med_hypocalcemia_calcium_gluconate_10':
        return t.medHypocalcemiaCalciumGluconate10Range;
      case 'med_hypocalcemia_calcium_chloride_10':
        return t.medHypocalcemiaCalciumChloride10Range;

      case 'med_symptomatic_hyponatremia_hypertonic_saline_3':
        return t.medHyponatremiaHypertonicSaline3Range;

      case 'med_sedation_infusion_morphine':
        return t.medSedationInfusionMorphineRange;
      case 'med_sedation_infusion_midazolam':
        return t.medSedationInfusionMidazolamRange;
      case 'med_sedation_infusion_fentanyl':
        return t.medSedationInfusionFentanylRange;

      case 'med_liquids_iv_mixed_solution':
        return t.medIvFluidsMixedSolutionRange;

      case 'med_resp_croup_dexamethasone_iv':
        return t.medRespCroupDexamethasoneIvRange;
      case 'med_resp_croup_neb_epinephrine':
        return t.medRespCroupNebEpinephrineRange;
      case 'med_resp_croup_neb_budesonide':
        return t.medRespCroupNebBudesonideRange;

      case 'med_paralysis_succinylcholine':
        return t.medParalysisSuccinylcholineRange;
      case 'med_paralysis_pancuronium':
        return t.medParalysisPancuroniumRange;
      case 'med_paralysis_rocuronium':
        return t.medParalysisRocuroniumRange;
      case 'med_paralysis_atracurium':
        return t.medParalysisAtracuriumRange;

      case 'med_cardiac_arrest_epinephrine_iv':
        return t.medCardiacArrestEpinephrineIvRange;
      case 'med_cardiac_arrest_epinephrine_et':
        return t.medCardiacArrestEpinephrineEtRange;
      case 'med_cardiac_arrest_amiodarone':
        return t.medCardiacArrestAmiodaroneRange;
      case 'med_cardiac_arrest_magnesium_sulfate':
        return t.medCardiacArrestMagnesiumSulfateRange;
      case 'med_cardiac_arrest_sodium_bicarb_1m':
        return t.medCardiacArrestSodiumBicarb1MRange;

      case 'med_svt_adenosine_first':
        return t.medSvtAdenosineFirstRange;
      case 'med_svt_adenosine_second':
        return t.medSvtAdenosineSecondRange;
      case 'med_svt_adenosine_third':
        return t.medSvtAdenosineThirdRange;
      case 'med_svt_amiodarone':
        return t.medSvtAmiodaroneRange;

      case 'med_hco3_sg5_volume':
        return t.medHco3Sg5VolumeRange;
      case 'med_hco3_infusion_rate_3h':
        return t.medHco3InfusionRate3hRange;

      case 'med_k_replacement_sf_volume':
        return t.medKReplacementSfVolumeRange;

      case 'med_rsi_midazolam':
        return t.medRsiMidazolamRange;

      case 'med_shock_normal_saline':
        return t.medShockNormalSalineRange;

      case 'med_seizure_diazepam_iv':
        return t.medSeizureDiazepamIvRange;
      case 'med_seizure_diazepam_pr':
        return t.medSeizureDiazepamPrRange;
      case 'med_seizure_midazolam_iv_im':
        return t.medSeizureMidazolamIvImRange;
      case 'med_seizure_midazolam_in':
        return t.medSeizureMidazolamInRange;
      case 'med_seizure_phenytoin_iv':
        return t.medSeizurePhenytoinIvRange;
      case 'med_seizure_phenobarbital_iv':
        return t.medSeizurePhenobarbitalIvRange;

      default:
        return m.rangoDosisOriginal;
    }
  }

  // ============================
  // DOSIS ACTUAL (por id)
  // ============================
  static String currentDose(Medicamento m, AppLocalizations t) {
    final id = (m.id ?? '').trim();
    if (id.isEmpty) return m.dosisActualMG;

    switch (id) {
      // ----------------------------
      // Anafilaxia
      // ----------------------------
      case 'med_ana_epi_im_standard':
        return t.medAnaEpiImStandardDose;
      case 'med_ana_epi_im_weight_based':
        return t.medAnaEpiImWeightBasedDose;

      // ----------------------------
      // Analgesia
      // ----------------------------
      case 'med_analgesia_fentanyl':
        return t.medAnalgesiaFentanylDose;
      case 'med_analgesia_morphine':
        return t.medAnalgesiaMorphineDose;
      case 'med_analgesia_ketamine':
        return t.medAnalgesiaKetamineDose;

      // ----------------------------
      // Antibióticos
      // ----------------------------
      case 'med_abx_ampicillin':
        return t.medAbxAmpicillinDose;
      case 'med_abx_cefotaxime':
        return t.medAbxCefotaximeDose;
      case 'med_abx_ceftazidime':
        return t.medAbxCeftazidimeDose;
      case 'med_abx_meropenem':
        return t.medAbxMeropenemDose;
      case 'med_abx_vancomycin':
        return t.medAbxVancomycinDose;
      case 'med_abx_acyclovir':
        return t.medAbxAcyclovirDose;
      case 'med_abx_pip_tazo':
        return t.medAbxPipTazoDose;
      case 'med_abx_amox_clav':
        return t.medAbxAmoxClavDose;
      case 'med_abx_amikacin':
        return t.medAbxAmikacinDose;
      case 'med_abx_clindamycin':
        return t.medAbxClindamycinDose;
      case 'med_antidote_naloxone':
        return t.medAntidoteNaloxoneDose;
      case 'med_antidote_flumazenil':
        return t.medAntidoteFlumazenilDose;

      case 'med_asthma_prednisone':
        return t.medAsthmaPrednisoneDose;
      case 'med_asthma_dexamethasone_iv':
        return t.medAsthmaDexamethasoneIVDose;
      case 'med_asthma_hydrocortisone_iv':
        return t.medAsthmaHydrocortisoneIVDose;
      case 'med_asthma_methylprednisolone':
        return t.medAsthmaMethylprednisoloneDose;
      case 'med_asthma_magnesium_sulfate':
        return t.medAsthmaMagnesiumSulfateDose;

      case 'med_brady_epinephrine_iv':
        return t.medBradyEpinephrineIVDose;
      case 'med_brady_atropine':
        return t.medBradyAtropineDose;

      case 'med_hfnc_flow':
        return t.medHfncFlowDose;

      case 'med_ca_maint_calcium_gluconate_10':
        return t.medCaMaintCalciumGluconate10Dose;

      case 'med_endo_renal_regular_insulin_infusion':
        return t.medEndoRenalRegularInsulinInfusionDose;
      case 'med_endo_renal_furosemide':
        return t.medEndoRenalFurosemideDose;

      case 'med_electrolytes_calcium_gluconate_10_hyperk':
        return t.medElectrolytesCalciumGluconate10HyperKDose;
      case 'med_electrolytes_calcium_chloride_10_hyperk':
        return t.medElectrolytesCalciumChloride10HyperKDose;
      case 'med_electrolytes_neb_salbutamol_hyperk':
        return t.medElectrolytesNebSalbutamolHyperKDose;
      case 'med_electrolytes_d10w_plus_hyperk':
        return t.medElectrolytesD10WPlusHyperKDose;
      case 'med_electrolytes_regular_insulin_bolus_hyperk':
        return t.medElectrolytesRegularInsulinBolusHyperKDose;
      case 'med_electrolytes_sodium_bicarb_1m_hyperk':
        return t.medElectrolytesSodiumBicarb1MHyperKDose;

      case 'med_fever_pain_paracetamol_po_iv':
        return t.medFeverPainParacetamolPoIvDose;
      case 'med_fever_pain_metamizole_iv':
        return t.medFeverPainMetamizoleIvDose;

      case 'med_massive_bleeding_tranexamic_acid':
        return t.medMassiveBleedingTranexamicAcidDose;
      case 'med_massive_bleeding_rbc_ffp':
        return t.medMassiveBleedingRbcFfpDose;
      case 'med_massive_bleeding_platelets':
        return t.medMassiveBleedingPlateletsDose;
      case 'med_massive_bleeding_cryo':
        return t.medMassiveBleedingCryoDose;

      case 'med_ich_hypertonic_saline_3':
        return t.medIchHypertonicSaline3Dose;
      case 'med_ich_mannitol':
        return t.medIchMannitolDose;

      case 'med_hypocalcemia_calcium_gluconate_10':
        return t.medHypocalcemiaCalciumGluconate10Dose;
      case 'med_hypocalcemia_calcium_chloride_10':
        return t.medHypocalcemiaCalciumChloride10Dose;

      case 'med_symptomatic_hyponatremia_hypertonic_saline_3':
        return t.medHyponatremiaHypertonicSaline3Dose;

      case 'med_hypoglycemia_dextrose_10':
        return t.medHypoglycemiaDextrose10Dose;

      case 'med_sedation_infusion_morphine':
        return t.medSedationInfusionMorphineDose;
      case 'med_sedation_infusion_midazolam':
        return t.medSedationInfusionMidazolamDose;
      case 'med_sedation_infusion_fentanyl':
        return t.medSedationInfusionFentanylDose;

      case 'med_inotropes_epi_norepi_infusion':
        return t.medInotropesEpiNorepiInfusionDose;
      case 'med_inotropes_dopamine_dobutamine_infusion':
        return t.medInotropesDopamineDobutamineInfusionDose;

      case 'med_liquids_iv_mixed_solution':
        return t.medIvFluidsMixedSolutionDose;
      case 'med_liquids_iv_result':
        return t.medIvFluidsResultDose;
      case 'med_liquids_iv_drip_adjusted':
        return t.medIvFluidsDripAdjustedDose;

      case 'med_resp_croup_dexamethasone_iv':
        return t.medRespCroupDexamethasoneIvDose;
      case 'med_resp_croup_neb_epinephrine':
        return t.medRespCroupNebEpinephrineDose;

      case 'med_paralysis_succinylcholine':
        return t.medParalysisSuccinylcholineDose;
      case 'med_paralysis_pancuronium':
        return t.medParalysisPancuroniumDose;
      case 'med_paralysis_rocuronium':
        return t.medParalysisRocuroniumDose;
      case 'med_paralysis_atracurium':
        return t.medParalysisAtracuriumDose;
      case 'med_paralysis_ett_uncuffed':
        return t.medParalysisEttUncuffedDose;
      case 'med_paralysis_ett_cuffed':
        return t.medParalysisEttCuffedDose;
      case 'med_paralysis_ett_depth_lip':
        return t.medParalysisEttDepthLipDose;

      case 'med_cardiac_arrest_epinephrine_iv':
        return t.medCardiacArrestEpinephrineIvDose;
      case 'med_cardiac_arrest_epinephrine_et':
        return t.medCardiacArrestEpinephrineEtDose;
      case 'med_cardiac_arrest_first_shock':
        return t.medCardiacArrestFirstShockDose;
      case 'med_cardiac_arrest_second_shock':
        return t.medCardiacArrestSecondShockDose;
      case 'med_cardiac_arrest_amiodarone':
        return t.medCardiacArrestAmiodaroneDose;
      case 'med_cardiac_arrest_magnesium_sulfate':
        return t.medCardiacArrestMagnesiumSulfateDose;
      case 'med_cardiac_arrest_sodium_bicarb_1m':
        return t.medCardiacArrestSodiumBicarb1MDose;

      case 'med_svt_adenosine_first':
        return t.medSvtAdenosineFirstDose;
      case 'med_svt_adenosine_second':
        return t.medSvtAdenosineSecondDose;
      case 'med_svt_adenosine_third':
        return t.medSvtAdenosineThirdDose;
      case 'med_svt_amiodarone':
        return t.medSvtAmiodaroneDose;

      case 'med_hco3_deficit':
        return t.medHco3DeficitDose;
      case 'med_hco3_sg5_volume':
        return t.medHco3Sg5VolumeDose;
      case 'med_hco3_infusion_rate_3h':
        return t.medHco3InfusionRate3hDose;

      case 'med_k_replacement_sf_volume':
        return t.medKReplacementSfVolumeDose;

      case 'med_rsi_midazolam':
        return t.medRsiMidazolamDose;

      case 'med_shock_normal_saline':
        return t.medShockNormalSalineDose;

      case 'med_seizure_diazepam_iv':
        return t.medSeizureDiazepamIvDose;
      case 'med_seizure_diazepam_pr':
        return t.medSeizureDiazepamPrDose;
      case 'med_seizure_midazolam_iv_im':
        return t.medSeizureMidazolamIvImDose;
      case 'med_seizure_midazolam_in':
        return t.medSeizureMidazolamInDose;
      case 'med_seizure_phenytoin_iv':
        return t.medSeizurePhenytoinIvDose;
      case 'med_seizure_phenobarbital_iv':
        return t.medSeizurePhenobarbitalIvDose;

      case 'med_central_lines_femoral_depth':
        return t.medCentralLinesFemoralDepthDose;
      case 'med_central_lines_jugular_depth':
        return t.medCentralLinesJugularDepthDose;
      case 'med_pleural_drain_catheter':
        return t.medPleuralDrainCatheterDose;

      default:
        return m.dosisActualMG;
    }
  }

  // ============================
  // OBSERVACIONES (por id)
  // ============================
  static String notes(Medicamento m, AppLocalizations t) {
    final id = (m.id ?? '').trim();
    if (id.isEmpty) return m.observaciones;

    switch (id) {
      // ----------------------------
      // Anafilaxia
      // ----------------------------
      case 'med_ana_epi_im_standard':
        return t.medAnaEpiImStandardNotes;
      case 'med_ana_epi_im_weight_based':
        return t.medAnaEpiImWeightBasedNotes;

      // ----------------------------
      // Analgesia
      // ----------------------------
      case 'med_analgesia_fentanyl':
        return t.medAnalgesiaFentanylNotes;
      case 'med_analgesia_morphine':
        return t.medAnalgesiaMorphineNotes;
      case 'med_analgesia_ketamine':
        return t.medAnalgesiaKetamineNotes;

      // ----------------------------
      // Antibióticos
      // ----------------------------
      case 'med_abx_ampicillin':
        return t.medAbxAmpicillinNotes;
      case 'med_abx_cefotaxime':
        return t.medAbxCefotaximeNotes;
      case 'med_abx_ceftazidime':
        return t.medAbxCeftazidimeNotes;
      case 'med_abx_meropenem':
        return t.medAbxMeropenemNotes;
      case 'med_abx_vancomycin':
        return t.medAbxVancomycinNotes;
      case 'med_abx_acyclovir':
        return t.medAbxAcyclovirNotes;
      case 'med_abx_pip_tazo':
        return t.medAbxPipTazoNotes;
      case 'med_abx_amox_clav':
        return t.medAbxAmoxClavNotes;
      case 'med_abx_amikacin':
        return t.medAbxAmikacinNotes;
      case 'med_abx_clindamycin':
        return t.medAbxClindamycinNotes;

      case 'med_antidote_naloxone':
        return t.medAntidoteNaloxoneNotes;
      case 'med_antidote_flumazenil':
        return t.medAntidoteFlumazenilNotes;

      case 'med_asthma_salbutamol_1_5':
        return t.medAsthmaSalbutamol1to5Notes;
      case 'med_asthma_salbutamol_gt_5':
        return t.medAsthmaSalbutamolOver5Notes;
      case 'med_asthma_atrovent_2_5':
        return t.medAsthmaAtrovent2to5Notes;
      case 'med_asthma_atrovent_gt_5':
        return t.medAsthmaAtroventOver5Notes;
      case 'med_asthma_prednisone':
        return t.medAsthmaPrednisoneNotes;
      case 'med_asthma_magnesium_sulfate':
        return t.medAsthmaMagnesiumSulfateNotes;

      case 'med_brady_epinephrine_iv':
        return t.medBradyEpinephrineIVNotes;

      case 'med_hfnc_flow':
        return t.medHfncFlowNotes;
      case 'med_hfnc_cannula_size_by_weight':
        return t.medHfncCannulaSizeByWeightNotes;

      case 'med_ca_maint_calcium_gluconate_10':
        return t.medCaMaintCalciumGluconate10Notes;

      case 'med_electrolytes_calcium_gluconate_10_hyperk':
        return t.medElectrolytesCalciumGluconate10HyperKNotes;
      case 'med_electrolytes_calcium_chloride_10_hyperk':
        return t.medElectrolytesCalciumChloride10HyperKNotes;

      case 'med_fever_pain_metamizole_iv':
        return t.medFeverPainMetamizoleIvNotes;

      case 'med_massive_bleeding_tranexamic_acid':
        return t.medMassiveBleedingTranexamicAcidNotes;
      case 'med_massive_bleeding_rbc_ffp':
        return t.medMassiveBleedingRbcFfpNotes;
      case 'med_massive_bleeding_platelets':
        return t.medMassiveBleedingPlateletsNotes;
      case 'med_massive_bleeding_cryo':
        return t.medMassiveBleedingCryoNotes;

      case 'med_ich_hypertonic_saline_3':
        return t.medIchHypertonicSaline3Notes;
      case 'med_ich_mannitol':
        return t.medIchMannitolNotes;

      case 'med_hypocalcemia_calcium_gluconate_10':
        return t.medHypocalcemiaCalciumGluconate10Notes;
      case 'med_hypocalcemia_calcium_chloride_10':
        return t.medHypocalcemiaCalciumChloride10Notes;

      case 'med_symptomatic_hyponatremia_hypertonic_saline_3':
        return t.medHyponatremiaHypertonicSaline3Notes;

      case 'med_hypoglycemia_dextrose_10':
        return t.medHypoglycemiaDextrose10Notes;

      case 'med_inotropes_epi_norepi_infusion':
        return t.medInotropesEpiNorepiInfusionNotes;
      case 'med_inotropes_dopamine_dobutamine_infusion':
        return t.medInotropesDopamineDobutamineInfusionNotes;

      case 'med_liquids_iv_drip':
        return t.medIvFluidsDripNotes;
      case 'med_liquids_iv_drip_adjusted':
        return t.medIvFluidsDripAdjustedNotes;

      case 'med_resp_croup_neb_epinephrine':
        return t.medRespCroupNebEpinephrineNotes;

      case 'med_paralysis_succinylcholine':
        return t.medParalysisSuccinylcholineNotes;
      case 'med_paralysis_pancuronium':
        return t.medParalysisPancuroniumNotes;
      case 'med_paralysis_rocuronium':
        return t.medParalysisRocuroniumNotes;
      case 'med_paralysis_atracurium':
        return t.medParalysisAtracuriumNotes;

      case 'med_cardiac_arrest_epinephrine_iv':
        return t.medCardiacArrestEpinephrineIvNotes;
      case 'med_cardiac_arrest_epinephrine_et':
        return t.medCardiacArrestEpinephrineEtNotes;
      case 'med_cardiac_arrest_first_shock':
        return t.medCardiacArrestFirstShockNotes;
      case 'med_cardiac_arrest_second_shock':
        return t.medCardiacArrestSecondShockNotes;
      case 'med_cardiac_arrest_amiodarone':
        return t.medCardiacArrestAmiodaroneNotes;
      case 'med_cardiac_arrest_magnesium_sulfate':
        return t.medCardiacArrestMagnesiumSulfateNotes;

      case 'med_svt_adenosine_first':
        return t.medSvtAdenosineFirstNotes;
      case 'med_svt_adenosine_second':
        return t.medSvtAdenosineSecondNotes;
      case 'med_svt_adenosine_third':
        return t.medSvtAdenosineThirdNotes;
      case 'med_svt_amiodarone':
        return t.medSvtAmiodaroneNotes;

      case 'med_hco3_patient_value':
        return t.medHco3PatientValueNotes;

      case 'med_k_replacement_sf_volume':
        return t.medKReplacementSfVolumeNotes;

      case 'med_shock_normal_saline':
        return t.medShockNormalSalineNotes;

      case 'med_seizure_diazepam_iv':
        return t.medSeizureDiazepamIvNotes;
      case 'med_seizure_diazepam_pr':
        return t.medSeizureDiazepamPrNotes;
      case 'med_seizure_midazolam_iv_im':
        return t.medSeizureMidazolamIvImNotes;
      case 'med_seizure_midazolam_in':
        return t.medSeizureMidazolamInNotes;
      case 'med_seizure_phenytoin_iv':
        return t.medSeizurePhenytoinIvNotes;
      case 'med_seizure_phenobarbital_iv':
        return t.medSeizurePhenobarbitalIvNotes;

      case 'med_central_lines_femoral_depth':
        return t.medCentralLinesFemoralDepthNotes;
      case 'med_central_lines_jugular_depth':
        return t.medCentralLinesJugularDepthNotes;
      case 'med_pleural_drain_catheter':
        return t.medPleuralDrainCatheterNotes;

      default:
        return m.observaciones;
    }
  }

  // ============================
  // Helpers
  // ============================
  static String _norm(String s) {
    final t = s.trim().toLowerCase();
    return t
        .replaceAll('á', 'a')
        .replaceAll('à', 'a')
        .replaceAll('ä', 'a')
        .replaceAll('â', 'a')
        .replaceAll('é', 'e')
        .replaceAll('è', 'e')
        .replaceAll('ë', 'e')
        .replaceAll('ê', 'e')
        .replaceAll('í', 'i')
        .replaceAll('ì', 'i')
        .replaceAll('ï', 'i')
        .replaceAll('î', 'i')
        .replaceAll('ó', 'o')
        .replaceAll('ò', 'o')
        .replaceAll('ö', 'o')
        .replaceAll('ô', 'o')
        .replaceAll('ú', 'u')
        .replaceAll('ù', 'u')
        .replaceAll('ü', 'u')
        .replaceAll('û', 'u')
        .replaceAll('ñ', 'n');
  }
}
