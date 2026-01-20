import 'package:flutter/material.dart';
import 'package:mi_app/models/paciente.dart';
import 'package:mi_app/utils/dosis_calculator_meses.dart';
import 'package:mi_app/models/medicamento.dart';
import 'package:mi_app/screens/liquid_iv_detail_screen.dart';
import 'package:mi_app/screens/printable_patient_data_screen.dart';
import 'package:mi_app/models/medicamento_calculado.dart';

import '../l10n/app_localizations.dart';
import '../i18n/med_i18n.dart';

// ====== DATA (IDs + categorías estables) ======

final List<Medicamento> hco3Medicamentos = [
  Medicamento(
    id: 'hco3_paciente',
    nombre: 'HCO3 del paciente',
    categoria: 'Reposición de HCO3',
    subcategoria: '(pH < 7,2; HCO3 < 8); Nunca mezclar con Calcio',
    observaciones: 'Control de Na y Gases al finalizar',
  ),
  Medicamento(
    id: 'hco3_deficit',
    nombre: 'Déficit de HCO3',
    categoria: 'Reposición de HCO3',
    subcategoria: '(pH < 7,2; HCO3 < 8); Nunca mezclar con Calcio',
    dosisActualMG: 'de Bicarbonato de Sodio al 1M (1mEq/mL)',
  ),
  Medicamento(
    id: 'hco3_vol_sg5',
    nombre: 'Volumen de SG5%',
    categoria: 'Reposición de HCO3',
    subcategoria: '(pH < 7,2; HCO3 < 8); Nunca mezclar con Calcio',
    rangoDosisOriginal: 'a diluir déficit de HCO3',
    dosisActualMG: 'Pasar en 3h',
  ),
  Medicamento(
    id: 'hco3_vel_3h',
    nombre: 'Velocidad de Infusión a pasar en 3h',
    categoria: 'Reposición de HCO3',
    subcategoria: '(pH < 7,2; HCO3 < 8); Nunca mezclar con Calcio',
    rangoDosisOriginal: 'a diluir déficit de HCO3',
    dosisActualMG: 'Pasar en 3h',
  ),
];

final List<Medicamento> sodioMedicamentos = [
  Medicamento(
    id: 'na_paciente',
    nombre: 'Sodio del paciente',
    categoria: 'Reposición de Sodio',
    subcategoria: '(Na < 130mEq/L)',
    observaciones: 'Control de Na y Osm al finalizar',
  ),
  Medicamento(
    id: 'na_deficit',
    nombre: 'Déficit de Sodio',
    categoria: 'Reposición de Sodio',
    subcategoria: '(Na < 130mEq/L)',
    dosisActualMG: 'de NaCl4M (4mEq/mL)',
  ),
  Medicamento(
    id: 'na_vol_sg5',
    nombre: 'Volumen de SG5%',
    categoria: 'Reposición de Sodio',
    subcategoria: '(Na < 130mEq/L)',
    dosisActualMG: 'Pasar en 3h',
  ),
  Medicamento(
    id: 'na_vel_3h',
    nombre: 'Velocidad de Infusión a pasar en 3h',
    categoria: 'Reposición de Sodio',
    subcategoria: '(Na < 130mEq/L)',
    dosisActualMG: 'Pasar en 3h',
  ),
  Medicamento(
    id: 'na_con_sf',
    nombre: 'Con SF',
    categoria: 'Reposición de Sodio',
    subcategoria: '(Na < 130mEq/L)',
    dosisActualMG: 'Pasar en 3h',
  ),
];

// ✅ Líquidos IV (meses) - categoría corregida y estable (sin typo)
final List<Medicamento> liquidosIVMedicamentos = [
  Medicamento(
    id: 'iv_sol_mixta',
    nombre: 'Solución mixta',
    categoria: 'Liquidos IV',
    rangoDosisOriginal: '(Requerimientos al 100%)',
    dosisActualMG: 'pasar en Bomba de Infusión continua en 24h IV',
    observaciones: '',
  ),
  Medicamento(
    id: 'iv_goteo',
    nombre: 'Goteo',
    categoria: 'Liquidos IV',
    observaciones: 'Requerimientos diarios',
    rangoDosisOriginal: '',
    dosisActualMG: '',
  ),
  Medicamento(
    id: 'iv_resultado',
    nombre: 'Resultado',
    categoria: 'Liquidos IV',
    dosisActualMG: 'Restar medicamentos',
    observaciones: '',
    rangoDosisOriginal: '',
  ),
  Medicamento(
    id: 'iv_goteo_aj',
    nombre: 'Goteo.',
    categoria: 'Liquidos IV',
    dosisActualMG: 'Restar infusiones',
    observaciones: 'Cálculo de líquidos por porcentaje',
    rangoDosisOriginal: '',
  ),
];

// ====== SCREEN ======

class CalculosEspecialesScreen extends StatefulWidget {
  final Paciente paciente;

  const CalculosEspecialesScreen({super.key, required this.paciente});

  @override
  State<CalculosEspecialesScreen> createState() =>
      _CalculosEspecialesScreenState();
}

class _CalculosEspecialesScreenState extends State<CalculosEspecialesScreen> {
  static const Color _primaryBlue = Color.fromARGB(255, 14, 113, 194);
  static const Color _green = Color.fromARGB(255, 83, 232, 103);
  static const Color _tileBg = Color(0xFFF6F3FB);

  final TextEditingController _porcentajeController = TextEditingController();
  final TextEditingController _hco3Controller = TextEditingController();
  final TextEditingController _sodioController = TextEditingController();

  // Defaults (tuyos)
  double _porcentaje = 40;
  double _hco3Valor = 7;
  double _sodioValor = 100;

  @override
  void initState() {
    super.initState();

    _porcentajeController.text = _porcentaje.toString();
    _hco3Controller.text = _hco3Valor.toString();
    _sodioController.text = _sodioValor.toString();

    _porcentajeController.addListener(() {
      setState(() {
        _porcentaje = double.tryParse(_porcentajeController.text) ?? 0.0;
      });
    });

    _hco3Controller.addListener(() {
      setState(() {
        _hco3Valor = double.tryParse(_hco3Controller.text) ?? 0.0;
      });
    });

    _sodioController.addListener(() {
      setState(() {
        _sodioValor = double.tryParse(_sodioController.text) ?? 0.0;
      });
    });
  }

  @override
  void dispose() {
    _porcentajeController.dispose();
    _hco3Controller.dispose();
    _sodioController.dispose();
    super.dispose();
  }

  // ====== DISPLAY (lógica intacta, usa med.nombre original) ======

  String _getHco3Display(Medicamento medicamento) {
    final hco3Doses = DosisCalculatorMeses.calculateHco3Dosis(
      widget.paciente,
      _hco3Valor,
    );

    switch (medicamento.nombre) {
      case 'Déficit de HCO3':
        return (hco3Doses['deficit_display'] ?? 'N/A').toString();
      case 'Volumen de SG5%':
        return (hco3Doses['volumen_display'] ?? 'N/A').toString();
      case 'Velocidad de Infusión a pasar en 3h':
        return (hco3Doses['velocidad_display'] ?? 'N/A').toString();
      default:
        return 'N/A';
    }
  }

  String _getSodioDisplay(Medicamento medicamento) {
    final sodioDoses = DosisCalculatorMeses.calculateSodioDosis(
      widget.paciente,
      _sodioValor,
    );

    switch (medicamento.nombre) {
      case 'Déficit de Sodio':
        return (sodioDoses['deficit_display'] ?? 'N/A').toString();
      case 'Volumen de SG5%':
        return (sodioDoses['volumen_display'] ?? 'N/A').toString();
      case 'Velocidad de Infusión a pasar en 3h':
        return (sodioDoses['velocidad_display'] ?? 'N/A').toString();
      case 'Con SF':
        return (sodioDoses['con_sf_display'] ?? 'N/A').toString();
      default:
        return 'N/A';
    }
  }

  String _getLiquidosIvDisplay(Medicamento medicamento) {
    final Map<String, dynamic> calculatedDoses =
        DosisCalculatorMeses.calculateDosis(
          widget.paciente,
          medicamento,
          porcentaje: _porcentaje,
        );

    if (calculatedDoses.containsKey('display_string')) {
      return (calculatedDoses['display_string'] ?? 'N/A').toString();
    }

    final double ml = (calculatedDoses['ml'] as double?) ?? 0.0;
    return '${DosisCalculatorMeses.formatDosis(ml)} ml';
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

  bool _isTotalRow(Medicamento med) {
    final n = med.nombre.trim().toLowerCase();
    return n == 'resultado';
  }

  // ====== PRINT ======

  List<MedicamentoCalculado> _calcularTodasLasDosis() {
    final List<MedicamentoCalculado> list = [];

    for (final med in liquidosIVMedicamentos) {
      list.add(
        MedicamentoCalculado(
          medicamentoOriginal: med,
          dosisDisplayString: _getLiquidosIvDisplay(med),
        ),
      );
    }

    for (final med in hco3Medicamentos.skip(1)) {
      list.add(
        MedicamentoCalculado(
          medicamentoOriginal: med,
          dosisDisplayString: _getHco3Display(med),
        ),
      );
    }

    for (final med in sodioMedicamentos.skip(1)) {
      list.add(
        MedicamentoCalculado(
          medicamentoOriginal: med,
          dosisDisplayString: _getSodioDisplay(med),
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
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
      child: Text(
        '${t.patientHeaderPrefix}: ${widget.paciente.pesoKg.toStringAsFixed(1)} kg · ${widget.paciente.edadMeses} ${t.patientHeaderMonthsUnit}',
        style: const TextStyle(
          fontWeight: FontWeight.w900,
          color: Colors.black54,
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
    required AppLocalizations t,
    required String totalLabelText,
    required Medicamento medicamento,
    required String rawValue,
    required VoidCallback onTap,
    bool isTotal = false,
  }) {
    final parts = _splitValueAndUnit(rawValue);
    final value = parts['value'] ?? rawValue;
    final unit = parts['unit'] ?? '';

    final bg = isTotal ? const Color(0xFFEAF3FF) : _tileBg;
    final border = isTotal
        ? _primaryBlue.withAlpha((0.35 * 255).round())
        : Colors.transparent;

    // ✅ UI traducida sin romper la lógica
    final title = isTotal ? totalLabelText : MedI18n.name(medicamento, t);

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
                    title,
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

  void _resetDefaults() {
    setState(() {
      _porcentaje = 40;
      _hco3Valor = 7;
      _sodioValor = 100;

      _porcentajeController.text = _porcentaje.toString();
      _hco3Controller.text = _hco3Valor.toString();
      _sodioController.text = _sodioValor.toString();
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
          title: Text(t.specialCalcMonthsTitle),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              tooltip: t.restoreValues,
              onPressed: _resetDefaults,
            ),
            IconButton(
              icon: const Icon(Icons.print),
              tooltip: t.printFullReport,
              onPressed: () {
                final meds = _calcularTodasLasDosis();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PrintablePatientDataScreen(
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
            SliverToBoxAdapter(child: _patientHeader(t)),

            // INPUTS
            SliverToBoxAdapter(
              child: _inputRow(
                title: t.inputLiquidsPercentTitle,
                controller: _porcentajeController,
                hint: '40',
                helper: t.inputLiquidsPercentHelper,
                unitBadge: '%',
              ),
            ),
            SliverToBoxAdapter(
              child: _inputRow(
                title: t.inputHco3Title,
                controller: _hco3Controller,
                hint: '7',
                helper: t.inputHco3Helper,
                unitBadge: 'mEq/L',
              ),
            ),
            SliverToBoxAdapter(
              child: _inputRow(
                title: t.inputSodiumTitle,
                controller: _sodioController,
                hint: '100',
                helper: t.inputSodiumHelper,
                unitBadge: 'mEq/L',
              ),
            ),

            // LÍQUIDOS IV
            SliverToBoxAdapter(child: _sectionTitle(t.sectionLiquidsIV)),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final med = liquidosIVMedicamentos[index];
                final display = _getLiquidosIvDisplay(med);
                final isTotal = _isTotalRow(med);

                return _resultTile(
                  t: t,
                  totalLabelText: t.resultTotalFinal,
                  medicamento: med,
                  rawValue: display,
                  isTotal: isTotal,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LiquidIVDetailScreen(
                          medicamento: med,
                          paciente: widget.paciente,
                          porcentajeLiquidos: _porcentaje,
                        ),
                      ),
                    );
                  },
                );
              }, childCount: liquidosIVMedicamentos.length),
            ),

            // HCO3
            SliverToBoxAdapter(child: _sectionTitle(t.sectionHco3)),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final med = hco3Medicamentos[index + 1];
                final display = _getHco3Display(med);

                return _resultTile(
                  t: t,
                  totalLabelText: t.resultTotalFinal,
                  medicamento: med,
                  rawValue: display,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LiquidIVDetailScreen(
                          paciente: widget.paciente,
                          medicamento: med,
                          porcentajeLiquidos: 0.0,
                          hco3Valor: _hco3Valor,
                        ),
                      ),
                    );
                  },
                );
              }, childCount: hco3Medicamentos.length - 1),
            ),

            // SODIO
            SliverToBoxAdapter(child: _sectionTitle(t.sectionSodium)),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final med = sodioMedicamentos[index + 1];
                final display = _getSodioDisplay(med);

                return _resultTile(
                  t: t,
                  totalLabelText: t.resultTotalFinal,
                  medicamento: med,
                  rawValue: display,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LiquidIVDetailScreen(
                          paciente: widget.paciente,
                          medicamento: med,
                          porcentajeLiquidos: 0.0,
                          sodioValor: _sodioValor,
                        ),
                      ),
                    );
                  },
                );
              }, childCount: sodioMedicamentos.length - 1),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 24)),
          ],
        ),
      ),
    );
  }
}
