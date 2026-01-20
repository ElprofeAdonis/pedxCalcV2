// lib/screens/medicamentos_list_meses_screen.dart
import 'package:flutter/material.dart';

import 'package:mi_app/data/medicamento_data_meses.dart';
import 'package:mi_app/models/paciente.dart';
import 'package:mi_app/screens/medicamento_detail_meses_screen.dart';
import 'package:mi_app/screens/printable_patient_data_screen.dart';
import 'package:mi_app/utils/dosis_calculator_meses.dart';
import 'package:mi_app/models/medicamento.dart';
import 'package:mi_app/models/medicamento_calculado.dart';
import 'package:mi_app/screens/calculos_especiales_screen.dart';

// ✅ Para botón Cambiar
import 'package:mi_app/screens/edad_selection_screen.dart';

// Pantallas
import 'package:mi_app/screens/heart_rate_screen.dart';
import 'package:mi_app/screens/respiratory_rate_screen.dart';
import 'package:mi_app/screens/blood_pressure_screen.dart';
import 'package:mi_app/screens/temperature_screen.dart';
import 'package:mi_app/screens/oxygen_saturation_screen.dart';
import 'package:mi_app/screens/presion_arterial_mujeres_screen.dart';
import 'package:mi_app/screens/presion_arterial_hombres_screen.dart';

import '../l10n/app_localizations.dart';
import '../i18n/med_i18n.dart';

class MedicamentosListMesesScreen extends StatefulWidget {
  final Paciente paciente;

  /// ✅ Nuevo: para mostrar chip “Estimado ⚠️” o “Peso real ✅”
  final bool esPesoEstimado;

  const MedicamentosListMesesScreen({
    super.key,
    required this.paciente,
    this.esPesoEstimado = false,
  });

  @override
  State<MedicamentosListMesesScreen> createState() =>
      _MedicamentosListMesesScreenState();
}

class _MedicamentosListMesesScreenState
    extends State<MedicamentosListMesesScreen> {
  // Colores base
  static const Color _primaryBlueDark = Color.fromARGB(255, 14, 113, 194);
  static const Color _highlightGreen = Color.fromARGB(255, 83, 232, 103);

  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  late Map<String, List<Medicamento>> _groupedMedicamentos;

  // ✅ Filtro por rango alfabético (categorías)
  String _alphaRange = 'TODAS';

  // ✅ Placeholder para favoritos
  bool _onlyFavorites = false;

  // Barra inferior fija
  static const double _buttonBarHeight = 72.0;

  bool _didLoadI18n = false;

  @override
  void initState() {
    super.initState();

    // ✅ NO usar AppLocalizations.of(context) aquí
    _groupedMedicamentos = _groupAndSortMedicamentosRaw(
      _getFilteredMedicamentos(),
    );

    _searchController.addListener(() {
      setState(() => _searchText = _searchController.text.toLowerCase().trim());
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // ✅ Aquí ya existe Localizations/Theme/etc
    if (_didLoadI18n) return;
    _didLoadI18n = true;

    final t = AppLocalizations.of(context);

    setState(() {
      _groupedMedicamentos = _groupAndSortMedicamentos(
        _getFilteredMedicamentos(),
        t,
      );
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // ============================
  // ✅ VITALES: ahora por KEY (no por texto UI)
  // ============================

  Future<void> _openVitalOptionKeyAndWait(String key) async {
    Widget? screen;

    if (key == 'HR') {
      screen = const HeartRateScreen();
    } else if (key == 'RR') {
      screen = const RespiratoryRateScreen();
    } else if (key == 'BP') {
      screen = const BloodPressureScreen();
    } else if (key == 'TEMP') {
      screen = const TemperatureScreen();
    } else if (key == 'O2') {
      screen = const OxygenSaturationScreen();
    } else if (key == 'BP_W') {
      screen = const PresionArterialMujeresScreen();
    } else if (key == 'BP_M') {
      screen = const PresionArterialHombresScreen();
    }

    if (screen == null) return;

    await Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => screen!));
  }

  // ============================
  // ✅ MODALES CENTRADOS (SING V / PAM)
  // ============================

  void _showSignosVitalesOptions(AppLocalizations t) {
    _showCenteredMenu(
      title: t.modalVitalsTitle,
      options: [
        _MenuOption(keyId: 'HR', label: t.vitalHeartRate),
        _MenuOption(keyId: 'RR', label: t.vitalRespRate),
        _MenuOption(keyId: 'BP', label: t.vitalBloodPressure),
        _MenuOption(keyId: 'TEMP', label: t.vitalTemperature),
        _MenuOption(keyId: 'O2', label: t.vitalOxygenSat),
      ],
      closeTooltip: t.modalClose,
      isPamMenu: false,
    );
  }

  void _showPAMOptions(AppLocalizations t) {
    _showCenteredMenu(
      title: t.modalPamTitle,
      options: [
        _MenuOption(keyId: 'BP_W', label: t.vitalBloodPressureWomen),
        _MenuOption(keyId: 'BP_M', label: t.vitalBloodPressureMen),
      ],
      closeTooltip: t.modalClose,
      isPamMenu: true,
    );
  }

  void _showCenteredMenu({
    required String title,
    required List<_MenuOption> options,
    required String closeTooltip,
    required bool isPamMenu,
  }) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (ctx) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 18,
          ),
          backgroundColor: const Color(0xFFF6F3FB),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26),
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18, 18, 18, 14),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(ctx),
                        icon: const Icon(Icons.close, color: Colors.black45),
                        tooltip: closeTooltip,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Divider(height: 1),
                  const SizedBox(height: 8),

                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: options.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 6),
                    itemBuilder: (_, i) {
                      final opt = options[i];
                      return _CenteredModalTile(
                        text: opt.label,
                        onTap: () async {
                          Navigator.pop(ctx);
                          await _openVitalOptionKeyAndWait(opt.keyId);

                          if (!mounted) return;
                          final t = AppLocalizations.of(context);

                          // ✅ Reabrir el mismo modal (PAM o Vitals)
                          if (isPamMenu) {
                            _showPAMOptions(t);
                          } else {
                            _showSignosVitalesOptions(t);
                          }
                        },
                      );
                    },
                  ),

                  const SizedBox(height: 6),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // ============================
  // DATA
  // ============================

  bool _isExcludedCategoria(String categoria) {
    final c = _normalize(categoria);
    return c == _normalize('LÍQUIDS IV') ||
        c == _normalize('Líquids IV') ||
        c == _normalize('Reposición de HCO3') ||
        c == _normalize('Reposición de Sodio');
  }

  List<Medicamento> _getFilteredMedicamentos() {
    return medicamentosMeses
        .where((m) => !_isExcludedCategoria(m.categoria))
        .toList();
  }

  // ✅ RAW (sin i18n) para initState
  Map<String, List<Medicamento>> _groupAndSortMedicamentosRaw(
    List<Medicamento> medicamentos,
  ) {
    final Map<String, List<Medicamento>> grouped = {};
    for (var med in medicamentos) {
      grouped.putIfAbsent(med.categoria, () => []);
      grouped[med.categoria]!.add(med);
    }

    grouped.forEach((key, value) {
      value.sort((a, b) => a.nombre.compareTo(b.nombre));
    });

    return Map.fromEntries(
      grouped.entries.toList()..sort((e1, e2) => e1.key.compareTo(e2.key)),
    );
  }

  // ✅ i18n (EN/ES) para didChangeDependencies
  Map<String, List<Medicamento>> _groupAndSortMedicamentos(
    List<Medicamento> medicamentos,
    AppLocalizations t,
  ) {
    final Map<String, List<Medicamento>> grouped = {};
    for (var med in medicamentos) {
      grouped.putIfAbsent(med.categoria, () => []);
      grouped[med.categoria]!.add(med);
    }

    grouped.forEach((key, value) {
      value.sort((a, b) => MedI18n.name(a, t).compareTo(MedI18n.name(b, t)));
    });

    return Map.fromEntries(
      grouped.entries.toList()..sort((e1, e2) => e1.key.compareTo(e2.key)),
    );
  }

  List<Medicamento> _getSearchResults(AppLocalizations t) {
    if (_searchText.isEmpty) return [];

    return _getFilteredMedicamentos().where((m) {
      final nombre = MedI18n.name(m, t).toLowerCase();
      final categoria = MedI18n.category(m.categoria, t).toLowerCase();
      final dosisActual = MedI18n.currentDose(m, t).toLowerCase();
      final rango = MedI18n.rangeDose(m, t).toLowerCase();
      final obs = MedI18n.notes(m, t).toLowerCase();
      final sub = (m.subcategoria ?? '').toLowerCase();

      return nombre.contains(_searchText) ||
          categoria.contains(_searchText) ||
          sub.contains(_searchText) ||
          dosisActual.contains(_searchText) ||
          rango.contains(_searchText) ||
          obs.contains(_searchText);
    }).toList();
  }

  // ============================
  // ✅ Normalizar (acentos / ñ)
  // ============================
  String _normalize(String s) {
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

  String _firstLetterOfCategory(String categoria) {
    final n = _normalize(categoria);
    if (n.isEmpty) return '#';
    final c = n[0].toUpperCase();
    final isLetter = RegExp(r'[A-Z]').hasMatch(c);
    return isLetter ? c : '#';
  }

  bool _categoryInAlphaRange(String categoria) {
    if (_alphaRange == 'TODAS') return true;

    final letter = _firstLetterOfCategory(categoria);

    switch (_alphaRange) {
      case 'A-C':
        return ['A', 'B', 'C'].contains(letter);
      case 'D-F':
        return ['D', 'E', 'F'].contains(letter);
      case 'G-I':
        return ['G', 'H', 'I'].contains(letter);
      case 'J-L':
        return ['J', 'K', 'L'].contains(letter);
      case 'M-O':
        return ['M', 'N', 'O'].contains(letter);
      case 'P-R':
        return ['P', 'Q', 'R'].contains(letter);
      case 'S-U':
        return ['S', 'T', 'U'].contains(letter);
      case 'V-Z':
        return ['V', 'W', 'X', 'Y', 'Z'].contains(letter);
      default:
        return true;
    }
  }

  bool _passesFavoriteFilter(Medicamento med) {
    if (!_onlyFavorites) return true;
    return false;
  }

  // ============================
  // Dosis display (Meses)
  // ============================
  String _getDosisDisplay(Medicamento medicamento) {
    final Map<String, dynamic> calculated = DosisCalculatorMeses.calculateDosis(
      widget.paciente,
      medicamento,
    );

    if (calculated.containsKey('display_string')) {
      return (calculated['display_string'] as String).trim();
    }

    final double dosisMl = (calculated['ml'] as double?) ?? 0.0;
    final double dosisMg = (calculated['mg'] as double?) ?? 0.0;
    final double dosisJ = (calculated['julios'] as double?) ?? 0.0;

    final List<String> doses = [];
    if (dosisMl > 0.005)
      doses.add('${DosisCalculatorMeses.formatDosis(dosisMl)} ml');
    if (dosisMg > 0.005)
      doses.add('${DosisCalculatorMeses.formatDosis(dosisMg)} mg');
    if (dosisJ > 0.005)
      doses.add('${DosisCalculatorMeses.formatDosis(dosisJ)} J');

    return doses.isEmpty ? 'N/A' : doses.join(' / ');
  }

  // ============================
  // Tile medicamento
  // ============================
  Widget _buildMedicamentoListTile(
    Medicamento medicamento,
    AppLocalizations t,
  ) {
    final dosisDisplay = _getDosisDisplay(medicamento);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Material(
        color: const Color(0xFFF6F3FB),
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          hoverColor: _primaryBlueDark.withAlpha((0.05 * 255).round()),
          splashColor: _primaryBlueDark.withAlpha((0.15 * 255).round()),
          mouseCursor: SystemMouseCursors.click,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => MedicamentoDetailMesesScreen(
                  medicamento: medicamento,
                  paciente: widget.paciente,
                ),
              ),
            );
          },
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 2,
            ),
            title: Text(
              MedI18n.name(medicamento, t),
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
            subtitle: Text(
              t.viewDetails,
              style: const TextStyle(fontSize: 12, color: Colors.black45),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 140,
                  ), // ajusta 120-180
                  child: Text(
                    dosisDisplay,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: _highlightGreen,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.chevron_right,
                  size: 26,
                  color: _primaryBlueDark,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ============================
  // Header paciente
  // ============================
  Widget _patientHeader(AppLocalizations t) {
    final peso = widget.paciente.pesoKg;
    final meses = widget.paciente.edadMeses;

    return Card(
      elevation: 0,
      margin: const EdgeInsets.fromLTRB(16, 10, 16, 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            const Icon(Icons.person, color: _primaryBlueDark),
            const SizedBox(width: 10),
            Expanded(
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 10,
                children: [
                  Text(
                    '${peso.toStringAsFixed(1)} kg · $meses ${t.patientHeaderMonthsUnit}',
                    style: const TextStyle(fontWeight: FontWeight.w900),
                  ),
                  Chip(
                    label: Text(
                      widget.esPesoEstimado
                          ? t.chipEstimated
                          : t.chipRealWeight,
                    ),
                    visualDensity: VisualDensity.compact,
                    backgroundColor: widget.esPesoEstimado
                        ? const Color(0xFFFFF7E6)
                        : const Color(0xFFE9F7EF),
                    side: BorderSide(
                      color: widget.esPesoEstimado
                          ? const Color(0xFFFFE0B2)
                          : const Color(0xFFB7E4C7),
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const EdadSelectionScreen(),
                  ),
                );
              },
              child: Text(t.btnChange),
            ),
          ],
        ),
      ),
    );
  }

  // ============================
  // Chips filtros
  // ============================
  Widget _categoryAlphabetFilters(AppLocalizations t) {
    Widget choice(String label) {
      final selected = _alphaRange == label;
      return ChoiceChip(
        label: Text(label),
        selected: selected,
        onSelected: (_) => setState(() => _alphaRange = label),
        selectedColor: _primaryBlueDark.withAlpha((0.15 * 255).round()),
        labelStyle: TextStyle(
          fontWeight: FontWeight.w900,
          color: selected ? _primaryBlueDark : Colors.black87,
        ),
        side: BorderSide(
          color: _primaryBlueDark.withOpacity(selected ? 0.65 : 0.25),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          choice(t.filterAll), // TODAS / ALL
          choice('A-C'),
          choice('D-F'),
          choice('G-I'),
          choice('J-L'),
          choice('M-O'),
          choice('P-R'),
          choice('S-U'),
          choice('V-Z'),
          FilterChip(
            label: Text(t.filterFavorites),
            selected: _onlyFavorites,
            onSelected: (v) => setState(() => _onlyFavorites = v),
            selectedColor: _highlightGreen.withAlpha((0.20 * 255).round()),
            labelStyle: TextStyle(
              fontWeight: FontWeight.w900,
              color: _onlyFavorites ? const Color(0xFF1B5E20) : Colors.black87,
            ),
            side: BorderSide(
              color: _highlightGreen.withOpacity(_onlyFavorites ? 0.7 : 0.25),
            ),
          ),
        ],
      ),
    );
  }

  // ============================
  // Cálculos especiales
  // ============================
  Widget _specialCalculationsCard(AppLocalizations t) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) =>
                  CalculosEspecialesScreen(paciente: widget.paciente),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xFFEAF3FF),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _primaryBlueDark.withAlpha((0.25 * 255).round()),
            ),
          ),
          child: Row(
            children: [
              const Icon(Icons.calculate, color: _primaryBlueDark),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  t.specialCalculations,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    color: _primaryBlueDark,
                  ),
                ),
              ),
              const Icon(Icons.chevron_right, color: _primaryBlueDark),
            ],
          ),
        ),
      ),
    );
  }

  // ============================
  // Search bar
  // ============================
  PreferredSizeWidget _buildSearchBar(AppLocalizations t) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(54.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: t.searchMedicationHint,
            prefixIcon: Icon(
              Icons.search,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            suffixIcon: _searchController.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _searchController.clear();
                      setState(() {});
                    },
                  )
                : null,
            filled: true,
            fillColor: const Color.fromARGB(255, 254, 254, 254),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 143, 143, 143),
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: _highlightGreen, width: 3.0),
            ),
          ),
        ),
      ),
    );
  }

  // ============================
  // Print
  // ============================
  List<MedicamentoCalculado> _calcularTodasLasDosis() {
    return medicamentosMeses.map((medicamento) {
      final Map<String, dynamic> calculated =
          DosisCalculatorMeses.calculateDosis(widget.paciente, medicamento);

      String ml = 'N/A', mg = 'N/A', j = 'N/A';

      if (calculated.containsKey('display_string')) {
        ml = (calculated['display_string'] as String).trim();
      } else {
        final double dosisMl = (calculated['ml'] as double?) ?? 0.0;
        final double dosisMg = (calculated['mg'] as double?) ?? 0.0;
        final double dosisJ = (calculated['julios'] as double?) ?? 0.0;

        if (dosisMl > 0.005)
          ml = '${DosisCalculatorMeses.formatDosis(dosisMl)} ml';
        if (dosisMg > 0.005)
          mg = '${DosisCalculatorMeses.formatDosis(dosisMg)} mg';
        if (dosisJ > 0.005) j = '${DosisCalculatorMeses.formatDosis(dosisJ)} J';
      }

      return MedicamentoCalculado(
        medicamentoOriginal: medicamento,
        dosisMlDisplay: ml,
        dosisMgDisplay: mg,
        dosisJuliosDisplay: j,
      );
    }).toList();
  }

  void _onPrintAll() {
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
  }

  // ============================
  // BUILD
  // ============================
  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    final searchResults = _getSearchResults(t);
    final List<Widget> items = [];

    if (_searchText.isNotEmpty) {
      for (final med in searchResults) {
        if (_categoryInAlphaRange(med.categoria) &&
            _passesFavoriteFilter(med)) {
          items.add(_buildMedicamentoListTile(med, t));
        }
      }
    } else {
      items.add(_patientHeader(t));
      items.add(_categoryAlphabetFilters(t));
      items.add(_specialCalculationsCard(t));

      _groupedMedicamentos.forEach((categoria, medicamentos) {
        if (!_categoryInAlphaRange(categoria)) return;

        items.add(
          Padding(
            key: ValueKey(categoria),
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 10.0,
            ),
            child: Text(
              MedI18n.category(categoria, t),
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: _primaryBlueDark,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        );

        for (final med in medicamentos) {
          if (_passesFavoriteFilter(med)) {
            items.add(_buildMedicamentoListTile(med, t));
          }
        }
      });
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(t.medsMonthsAppBarTitle),
          bottom: _buildSearchBar(t),
          actions: [
            IconButton(
              icon: const Icon(Icons.print),
              onPressed: _onPrintAll,
              tooltip: t.printFullReport,
            ),
          ],
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: _buttonBarHeight + 20),
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => items[index],
                      childCount: items.length,
                    ),
                  ),
                ],
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(14, 0, 14, 12),
                  child: Container(
                    height: _buttonBarHeight,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 18,
                          offset: Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: _BottomActionButton(
                            label: t.bottomVitals, // ✅ i18n
                            icon: Icons.monitor_heart_outlined,
                            background: _highlightGreen,
                            onTap: () => _showSignosVitalesOptions(t),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _BottomActionButton(
                            label: t.bottomPam, // ✅ i18n
                            icon: Icons.favorite_outline,
                            background: _primaryBlueDark,
                            onTap: () => _showPAMOptions(t),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ===============================
// Helpers
// ===============================

class _MenuOption {
  final String keyId; // HR, RR, BP...
  final String label; // i18n label
  const _MenuOption({required this.keyId, required this.label});
}

/// ===============================
/// ✅ Tile bonito para el modal centrado
/// ===============================
class _CenteredModalTile extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const _CenteredModalTile({required this.text, required this.onTap});

  static const Color _primaryBlueDark = Color.fromARGB(255, 14, 113, 194);
  static const Color _highlightGreen = Color.fromARGB(255, 83, 232, 103);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          decoration: BoxDecoration(
            color: Colors.white.withAlpha((0.65 * 255).round()),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _primaryBlueDark.withAlpha((0.15 * 255).round()),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(
                    color: _primaryBlueDark,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Icon(Icons.chevron_right, size: 26, color: _highlightGreen),
            ],
          ),
        ),
      ),
    );
  }
}

/// ===============================
/// ✅ Botón inferior más pro
/// ===============================
class _BottomActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color background;
  final VoidCallback onTap;

  const _BottomActionButton({
    required this.label,
    required this.icon,
    required this.background,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: background,
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 22),
          const SizedBox(width: 10),
          Text(
            label,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
