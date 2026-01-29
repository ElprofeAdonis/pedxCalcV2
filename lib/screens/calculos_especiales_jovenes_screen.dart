// lib/screens/calculos_especiales_jovenes_screen.dart
import 'package:flutter/material.dart';
import 'package:mi_app/models/paciente.dart';
import 'package:mi_app/utils/dosis_calculator_jovenes.dart';
import 'package:mi_app/models/medicamento.dart';
import 'package:mi_app/screens/printable_patient_data_screen.dart';
import 'package:mi_app/models/medicamento_calculado.dart';
import 'package:mi_app/screens/calculos_jovenes_detail_screen.dart';
import '../l10n/app_localizations.dart';

// ====== WRAPPER interno (ID estable + med) ======
class _SpecMed {
  final String id; // ID estable para i18n
  final Medicamento med;
  const _SpecMed(this.id, this.med);
}

// ====== IDS (estables) ======
// sodio
const _sidPaciente = 'sodio_paciente';
const _sidDeficit = 'sodio_deficit';
const _sidVolSG5 = 'sodio_vol_sg5';
const _sidConSf = 'sodio_con_sf';
const _sidVelInf = 'sodio_vel_inf';

// hco3
const _hidPaciente = 'hco3_paciente';
const _hidDeficit = 'hco3_deficit';
const _hidVolSG5 = 'hco3_vol_sg5';
const _hidVelInf = 'hco3_vel_inf';

// líquidos IV
const _lidSolMixta = 'liq_sol_mixta';
const _lidPorcentajeInfo = 'liq_porcentaje_info';
const _lidResultado = 'liq_resultado';
const _lidGoteo = 'liq_goteo';
const _lidGoteoAj = 'liq_goteo_aj';

// ====== DATA (id estable EN el Medicamento también) ======

final List<_SpecMed> sodioMedicamentos = [
  _SpecMed(
    _sidPaciente,
    Medicamento(
      id: _sidPaciente,
      nombre: 'Sodio del paciente',
      categoria: 'REPOSICION DE SODIO (Na <130mEq/L)',
      observaciones: 'Control de Na y Osm al finalizar',
    ),
  ),
  _SpecMed(
    _sidDeficit,
    Medicamento(
      id: _sidDeficit,
      nombre: 'Déficit de Sodio',
      categoria: 'REPOSICION DE SODIO (Na <130mEq/L)',
      observaciones: 'de NaCl4M (4mEq/mL)',
    ),
  ),
  _SpecMed(
    _sidVolSG5,
    Medicamento(
      id: _sidVolSG5,
      nombre: 'Volumen de SG5%',
      categoria: 'REPOSICION DE SODIO (Na <130mEq/L)',
      observaciones: 'Pasar en 3h',
    ),
  ),
  _SpecMed(
    _sidConSf,
    Medicamento(
      id: _sidConSf,
      nombre: 'Con SF',
      categoria: 'REPOSICION DE SODIO (Na <130mEq/L)',
      observaciones: 'Pasar en 3h',
    ),
  ),
  _SpecMed(
    _sidVelInf,
    Medicamento(
      id: _sidVelInf,
      nombre: 'Velocidad de Infusión',
      categoria: 'REPOSICION DE SODIO (Na <130mEq/L)',
      observaciones: 'Pasar en 3h (ml/h)',
    ),
  ),
];

final List<_SpecMed> hco3Medicamentos = [
  _SpecMed(
    _hidPaciente,
    Medicamento(
      id: _hidPaciente,
      nombre: 'HCO3 del paciente',
      categoria: 'Reposición de HCO3',
      subcategoria: '(pH < 7,2; HCO3 < 8); Nunca mezclar con Calcio',
    ),
  ),
  _SpecMed(
    _hidDeficit,
    Medicamento(
      id: _hidDeficit,
      nombre: 'Déficit de HCO3',
      categoria: 'Reposición de HCO3',
      subcategoria: '(pH < 7,2; HCO3 < 8); Nunca mezclar con Calcio',
      dosisActualMG: 'de Bicarbonato de Sodio al 1M (1mEq/mL)',
    ),
  ),
  _SpecMed(
    _hidVolSG5,
    Medicamento(
      id: _hidVolSG5,
      nombre: 'Volumen de SG5% a diluir déficit de HCO3',
      categoria: 'Reposición de HCO3',
      subcategoria: '(pH < 7,2; HCO3 < 8); Nunca mezclar con Calcio',
      rangoDosisOriginal: 'a diluir déficit de HCO3',
      dosisActualMG: 'Pasar en 3h',
    ),
  ),
  _SpecMed(
    _hidVelInf,
    Medicamento(
      id: _hidVelInf,
      nombre: 'Velocidad de Infusión.',
      categoria: 'Reposición de HCO3',
      subcategoria: '(pH < 7,2; HCO3 < 8); Nunca mezclar con Calcio',
      rangoDosisOriginal: 'a diluir déficit de HCO3',
      dosisActualMG: 'Pasar en 3h',
    ),
  ),
];

final List<_SpecMed> liquidosIVMedicamentos = [
  _SpecMed(
    _lidSolMixta,
    Medicamento(
      id: _lidSolMixta,
      nombre: 'Solución mixta mantenimiento',
      categoria: 'LÍQUIDOS IV',
      observaciones:
          '< 10 kg (100cc/kg), 10-20 kg (50cc/kg), > 20 kg (20cc/kg)',
    ),
  ),
  _SpecMed(
    _lidPorcentajeInfo,
    Medicamento(
      id: _lidPorcentajeInfo,
      nombre: 'Calculo de Porcentaje',
      categoria: 'LÍQUIDOS IV',
      SituacionesEspeciales:
          'Riesgo SIADH: 80%, CAF/VMA:60-70%, LRA + NVO: 45%, LRA + VO: 30%',
    ),
  ),
  _SpecMed(
    _lidResultado,
    Medicamento(
      id: _lidResultado,
      nombre: 'Resultado',
      categoria: 'LÍQUIDOS IV',
    ),
  ),
  _SpecMed(
    _lidGoteo,
    Medicamento(id: _lidGoteo, nombre: 'Goteo', categoria: 'LÍQUIDOS IV'),
  ),
  _SpecMed(
    _lidGoteoAj,
    Medicamento(id: _lidGoteoAj, nombre: 'Goteo.', categoria: 'LÍQUIDOS IV'),
  ),
];

// ====== SCREEN ======

class CalculosEspecialesJovenesScreen extends StatefulWidget {
  final Paciente paciente;

  const CalculosEspecialesJovenesScreen({super.key, required this.paciente});

  @override
  State<CalculosEspecialesJovenesScreen> createState() =>
      _CalculosEspecialesJovenesScreenState();
}

class _CalculosEspecialesJovenesScreenState
    extends State<CalculosEspecialesJovenesScreen> {
  static const Color _primaryBlue = Color.fromARGB(255, 14, 113, 194);
  static const Color _green = Color.fromARGB(255, 83, 232, 103);
  static const Color _tileBg = Color(0xFFF6F3FB);

  final TextEditingController _sodioController = TextEditingController();
  final TextEditingController _hco3Controller = TextEditingController();
  final TextEditingController _liquidosIvController = TextEditingController();

  double _sodioValor = 120.0;
  double _hco3Valor = 7.0;
  double _liquidosIvValor = 100.0;

  @override
  void initState() {
    super.initState();

    _sodioController.text = _sodioValor.toString();
    _hco3Controller.text = _hco3Valor.toString();
    _liquidosIvController.text = _liquidosIvValor.toString();

    _sodioController.addListener(() {
      setState(() => _sodioValor = double.tryParse(_sodioController.text) ?? 0);
    });
    _hco3Controller.addListener(() {
      setState(() => _hco3Valor = double.tryParse(_hco3Controller.text) ?? 0);
    });
    _liquidosIvController.addListener(() {
      setState(() {
        _liquidosIvValor = double.tryParse(_liquidosIvController.text) ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _sodioController.dispose();
    _hco3Controller.dispose();
    _liquidosIvController.dispose();
    super.dispose();
  }

  // ====== i18n label por ID (UI) ======
  // Si no existe la key, regresa el nombre original en español.
  String _uiLabelForId(_SpecMed item, AppLocalizations t) {
    try {
      switch (item.id) {
        // sodio
        case _sidPaciente:
          return t.specNaPatient;
        case _sidDeficit:
          return t.specNaDeficit;
        case _sidVolSG5:
          return t.specNaSg5Volume;
        case _sidConSf:
          return t.specNaWithNs;
        case _sidVelInf:
          return t.specNaInfusionRate;

        // hco3
        case _hidPaciente:
          return t.specHco3Patient;
        case _hidDeficit:
          return t.specHco3Deficit;
        case _hidVolSG5:
          return t.specHco3Sg5Volume;
        case _hidVelInf:
          return t.specHco3InfusionRate;

        // líquidos
        case _lidSolMixta:
          return t.specIvMixedSolution;
        case _lidPorcentajeInfo:
          return t.specIvPercentInfoTitle;
        case _lidResultado:
          return t.specIvResult;
        case _lidGoteo:
          return t.specIvDrip;
        case _lidGoteoAj:
          return t.specIvDripAdjusted;

        default:
          return item.med.nombre;
      }
    } catch (_) {
      return item.med.nombre;
    }
  }

  // ====== DISPLAY HELPERS ======

  String _getLiquidosIvDisplay(_SpecMed item) {
    final liquidosIvDoses = DosisCalculatorJovenes.calculateLiquidosIvDosis(
      widget.paciente.pesoKg,
      _liquidosIvValor,
    );

    switch (item.id) {
      case _lidSolMixta:
        return liquidosIvDoses['solucion_mixta'] ?? 'N/A';
      case _lidResultado:
        return liquidosIvDoses['resultado'] ?? 'N/A';
      case _lidGoteo:
        return liquidosIvDoses['goteo_ml_h'] ?? 'N/A';
      case _lidGoteoAj:
        return liquidosIvDoses['goteo_ml_h_ajustado'] ?? 'N/A';
      default:
        return 'N/A';
    }
  }

  String _getSodioDisplay(_SpecMed item) {
    final sodioDoses = DosisCalculatorJovenes.calculateSodioDosis(
      widget.paciente.pesoKg,
      _sodioValor,
    );

    switch (item.id) {
      case _sidDeficit:
        return sodioDoses['deficit_display'] ?? 'N/A';
      case _sidVolSG5:
        return sodioDoses['volumen_display'] ?? 'N/A';
      case _sidConSf:
        return sodioDoses['con_sf_display'] ?? 'N/A';
      case _sidVelInf:
        return sodioDoses['velocidad_display'] ?? 'N/A';
      default:
        return 'N/A';
    }
  }

  String _getHco3Display(_SpecMed item) {
    final hco3Doses = DosisCalculatorJovenes.calculateHco3Dosis(
      widget.paciente.pesoKg,
      _hco3Valor,
    );

    switch (item.id) {
      case _hidDeficit:
        return hco3Doses['deficit_display'] ?? 'N/A';
      case _hidVolSG5:
        return hco3Doses['volumen_display'] ?? 'N/A';
      case _hidVelInf:
        return hco3Doses['velocidad_display'] ?? 'N/A';
      default:
        return 'N/A';
    }
  }

  // ====== “badge” de unidad ======
  Map<String, String> _splitValueAndUnit(String raw) {
    final v = raw.trim();
    if (v.isEmpty) return {'value': 'N/A', 'unit': ''};
    if (v.toUpperCase() == 'N/A') return {'value': 'N/A', 'unit': ''};

    final candidates = ['ml/h', 'mEq/L', '%', 'cc', 'ml', 'mg', 'J'];

    for (final u in candidates) {
      final idx = v.toLowerCase().lastIndexOf(u.toLowerCase());
      if (idx != -1) {
        final valuePart = v.substring(0, idx).trim();
        final unitPart = v.substring(idx).trim();
        return {'value': valuePart.isEmpty ? v : valuePart, 'unit': unitPart};
      }
    }

    return {'value': v, 'unit': ''};
  }

  // ====== PRINT ======

  List<MedicamentoCalculado> _calcularTodasLasDosis() {
    final List<MedicamentoCalculado> list = [];

    for (final item in liquidosIVMedicamentos) {
      if (item.id != _lidPorcentajeInfo) {
        list.add(
          MedicamentoCalculado(
            medicamentoOriginal: item.med,
            dosisDisplayString: _getLiquidosIvDisplay(item),
          ),
        );
      }
    }

    for (final item in hco3Medicamentos.skip(1)) {
      list.add(
        MedicamentoCalculado(
          medicamentoOriginal: item.med,
          dosisDisplayString: _getHco3Display(item),
        ),
      );
    }

    for (final item in sodioMedicamentos.skip(1)) {
      list.add(
        MedicamentoCalculado(
          medicamentoOriginal: item.med,
          dosisDisplayString: _getSodioDisplay(item),
        ),
      );
    }

    return list;
  }

  // ====== UI HELPERS ======

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 6),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          fontWeight: FontWeight.w900,
          color: _primaryBlue,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _patientHeader(AppLocalizations t) {
    final weight = widget.paciente.pesoKg.toStringAsFixed(1);
    final isYears = widget.paciente.edadAnios > 0;
    final ageValue = isYears
        ? widget.paciente.edadAnios.toString()
        : widget.paciente.edadMeses.toString();
    final ageUnit = isYears ? t.specialCalcYearsUnit : t.specialCalcMonthsUnit;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
      child: Text(
        t.specialCalcPatientHeader(weight, ageValue, ageUnit),
        style: const TextStyle(
          fontWeight: FontWeight.w900,
          color: Colors.black54,
        ),
      ),
    );
  }

  Widget _infoCard({required String text}) {
    if (text.trim().isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFEAF3FF),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _primaryBlue.withAlpha((0.25 * 255).round()),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.info_outline, color: _primaryBlue),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(color: Colors.black87, fontSize: 13),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputRow({
    required String title,
    required TextEditingController controller,
    required String hint,
    required String helper,
    required String unitBadge,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 6, 16, 6),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF333333),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      helper,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              if (unitBadge.isNotEmpty)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: _primaryBlue.withAlpha((0.10 * 255).round()),
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(
                      color: _primaryBlue.withAlpha((0.25 * 255).round()),
                    ),
                  ),
                  child: Text(
                    unitBadge,
                    style: const TextStyle(
                      color: _primaryBlue,
                      fontWeight: FontWeight.w900,
                      fontSize: 12,
                    ),
                  ),
                ),
              const SizedBox(width: 10),
              SizedBox(
                width: 90,
                child: TextField(
                  controller: controller,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: _primaryBlue,
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: hint,
                    filled: true,
                    fillColor: const Color(0xFFF5F7FA),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: _primaryBlue.withAlpha((0.25 * 255).round()),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: _green, width: 2),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _resultTile({
    required _SpecMed item,
    required String rawValue,
    required VoidCallback onTap,
    required AppLocalizations t,
    bool isTotal = false,
  }) {
    final parts = _splitValueAndUnit(rawValue);
    final value = parts['value'] ?? rawValue;
    final unit = parts['unit'] ?? '';

    final bg = isTotal ? const Color(0xFFEAF3FF) : _tileBg;
    final border = isTotal
        ? _primaryBlue.withAlpha((0.35 * 255).round())
        : Colors.transparent;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 6, 16, 6),
      child: Material(
        color: bg,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          splashColor: _primaryBlue.withAlpha((0.12 * 255).round()),
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: border),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    isTotal ? t.specialCalcTotalLabel : _uiLabelForId(item, t),
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  value,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    color: _green,
                    fontSize: 16,
                  ),
                ),
                if (unit.isNotEmpty) ...[
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: _green.withAlpha((0.12 * 255).round()),
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(
                        color: _green.withAlpha((0.30 * 255).round()),
                      ),
                    ),
                    child: Text(
                      unit,
                      style: const TextStyle(
                        color: Color(0xFF1B5E20),
                        fontWeight: FontWeight.w900,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
                const SizedBox(width: 8),
                const Icon(Icons.chevron_right, color: _primaryBlue),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _infoCardForPercentage(AppLocalizations t) {
    final text =
        liquidosIVMedicamentos
            .firstWhere((e) => e.id == _lidPorcentajeInfo)
            .med
            .SituacionesEspeciales ??
        '';

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 6, 16, 6),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFEAF3FF),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _primaryBlue.withAlpha((0.25 * 255).round()),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.info_outline, color: _primaryBlue),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                text.isEmpty ? t.specialCalcPercentInfoFallback : text,
                style: const TextStyle(color: Colors.black87, fontSize: 13),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _resetDefaults() {
    setState(() {
      _liquidosIvValor = 100.0;
      _sodioValor = 120.0;
      _hco3Valor = 7.0;

      _liquidosIvController.text = _liquidosIvValor.toString();
      _sodioController.text = _sodioValor.toString();
      _hco3Controller.text = _hco3Valor.toString();
    });
  }

  // ====== BUILD ======

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(t.specialCalcTitle),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              tooltip: t.specialCalcResetTooltip,
              onPressed: _resetDefaults,
            ),
            IconButton(
              icon: const Icon(Icons.print),
              tooltip: t.specialCalcPrintTooltip,
              onPressed: () {
                final meds = _calcularTodasLasDosis();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PrintablePatientDataScreen(
                      paciente: widget.paciente,
                      medicamentosCalculados: meds,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _infoCard(text: t.accordion4Body), // ✅ tu texto i18n
            ),
            SliverToBoxAdapter(child: _patientHeader(t)),

            // INPUTS
            SliverToBoxAdapter(
              child: _inputRow(
                title: t.specialCalcInputPercentTitle,
                controller: _liquidosIvController,
                hint: t.specialCalcInputPercentHint,
                helper: t.specialCalcInputPercentHelper,
                unitBadge: '%',
              ),
            ),
            SliverToBoxAdapter(child: _infoCardForPercentage(t)),
            SliverToBoxAdapter(
              child: _inputRow(
                title: t.specialCalcInputSodiumTitle,
                controller: _sodioController,
                hint: t.specialCalcInputSodiumHint,
                helper: t.specialCalcInputSodiumHelper,
                unitBadge: 'mEq/L',
              ),
            ),
            SliverToBoxAdapter(
              child: _inputRow(
                title: t.specialCalcInputHco3Title,
                controller: _hco3Controller,
                hint: t.specialCalcInputHco3Hint,
                helper: t.specialCalcInputHco3Helper,
                unitBadge: 'mEq/L',
              ),
            ),

            // LÍQUIDOS IV
            SliverToBoxAdapter(
              child: _sectionTitle(t.specialCalcSectionLiquids),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final item = liquidosIVMedicamentos[index];
                if (item.id == _lidPorcentajeInfo)
                  return const SizedBox.shrink();

                final display = _getLiquidosIvDisplay(item);
                final isTotal = item.id == _lidResultado;

                return _resultTile(
                  item: item,
                  rawValue: display,
                  isTotal: isTotal,
                  t: t,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => CalculosJovenesDetailScreen(
                          paciente: widget.paciente,
                          medicamento: item.med,
                          sodioValor: _sodioValor,
                          hco3Valor: _hco3Valor,
                          liquidosIvValor: _liquidosIvValor,
                          calculoType: 'Liquidos IV', // interno
                        ),
                      ),
                    );
                  },
                );
              }, childCount: liquidosIVMedicamentos.length),
            ),

            // SODIO
            SliverToBoxAdapter(
              child: _sectionTitle(t.specialCalcSectionSodium),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final item = sodioMedicamentos[index + 1];
                final display = _getSodioDisplay(item);

                return _resultTile(
                  item: item,
                  rawValue: display,
                  t: t,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => CalculosJovenesDetailScreen(
                          paciente: widget.paciente,
                          medicamento: item.med,
                          sodioValor: _sodioValor,
                          hco3Valor: _hco3Valor,
                          liquidosIvValor: _liquidosIvValor,
                          calculoType: 'Sodio', // interno
                        ),
                      ),
                    );
                  },
                );
              }, childCount: sodioMedicamentos.length - 1),
            ),

            // HCO3
            SliverToBoxAdapter(child: _sectionTitle(t.specialCalcSectionHco3)),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final item = hco3Medicamentos[index + 1];
                final display = _getHco3Display(item);

                return _resultTile(
                  item: item,
                  rawValue: display,
                  t: t,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => CalculosJovenesDetailScreen(
                          paciente: widget.paciente,
                          medicamento: item.med,
                          sodioValor: _sodioValor,
                          hco3Valor: _hco3Valor,
                          liquidosIvValor: _liquidosIvValor,
                          calculoType: 'HCO3', // interno
                        ),
                      ),
                    );
                  },
                );
              }, childCount: hco3Medicamentos.length - 1),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 24)),
          ],
        ),
      ),
    );
  }
}
