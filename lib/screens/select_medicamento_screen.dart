// lib/screens/select_medicamento_screen.dart
import 'package:flutter/material.dart';
import 'package:mi_app/models/medicamento.dart';
import 'package:mi_app/models/paciente.dart';
import 'package:mi_app/data/medicamento_data.dart';
import 'package:mi_app/screens/medicamento_detail_screen.dart';
import 'package:mi_app/screens/printable_patient_data_screen.dart';
import 'package:mi_app/models/medicamento_calculado.dart';
import 'package:mi_app/utils/dosis_calculator.dart';
import 'package:mi_app/screens/calculos_especiales_jovenes_screen.dart';
import 'package:mi_app/screens/edad_selection_screen.dart';

import 'package:mi_app/screens/heart_rate_screen_jovenes.dart';
import 'package:mi_app/screens/respiratory_rate_screen_jovenes.dart';
import 'package:mi_app/screens/blood_pressure_screen_jovenes.dart';
import 'package:mi_app/screens/temperature_screen_jovenes.dart';
import 'package:mi_app/screens/oxygen_saturation_screen_jovenes.dart';
import 'package:mi_app/screens/presion_arterial_mujeres_screen_jovenes.dart';
import 'package:mi_app/screens/presion_arterial_hombres_screen_jovenes.dart';

import '../l10n/app_localizations.dart';
import '../i18n/med_i18n.dart';

class SelectMedicamentoScreen extends StatefulWidget {
  final Paciente paciente;
  final bool esPesoEstimado;

  const SelectMedicamentoScreen({
    super.key,
    required this.paciente,
    this.esPesoEstimado = false,
  });

  @override
  State<SelectMedicamentoScreen> createState() =>
      _SelectMedicamentoScreenState();
}

enum _VitalOption {
  heartRate,
  respRate,
  bloodPressure,
  temperature,
  oxygenSat,
  bpWomen,
  bpMen,
}

class _SelectMedicamentoScreenState extends State<SelectMedicamentoScreen> {
  // Colores base de tu app
  static const Color _primaryBlueDark = Color.fromARGB(255, 14, 113, 194);
  static const Color _highlightGreen = Color.fromARGB(255, 83, 232, 103);

  // ✅ OJO: lo recalculamos en build() porque t no existe en initState
  Map<String, List<Medicamento>> _groupedMedicamentos = {};

  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  // ✅ Interno se queda 'TODAS' siempre (aunque el label muestre ALL)
  String _alphaRange = 'TODAS';

  // ✅ Placeholder para favoritos
  bool _onlyFavorites = false;

  static const double _buttonBarHeight = 72.0;

  @override
  void initState() {
    super.initState();

    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text.toLowerCase().trim();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _openVitalOption(_VitalOption opt) async {
    Widget? screen;

    switch (opt) {
      case _VitalOption.heartRate:
        screen = const HeartRateScreenJ();
        break;
      case _VitalOption.respRate:
        screen = const RespiratoryRateScreenJ();
        break;
      case _VitalOption.bloodPressure:
        screen = const BloodPressureScreenJ();
        break;
      case _VitalOption.temperature:
        screen = const TemperatureScreenJ();
        break;
      case _VitalOption.oxygenSat:
        screen = const OxygenSaturationScreenJ();
        break;
      case _VitalOption.bpWomen:
        screen = const PresionArterialMujeresScreenJ();
        break;
      case _VitalOption.bpMen:
        screen = const PresionArterialHombresScreenJ();
        break;
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
      title: t.medsVitalsTitle,
      options: [
        (_VitalOption.heartRate, t.medsOptionHeartRate),
        (_VitalOption.respRate, t.medsOptionRespRate),
        (_VitalOption.bloodPressure, t.medsOptionBloodPressure),
        (_VitalOption.temperature, t.medsOptionTemperature),
        (_VitalOption.oxygenSat, t.medsOptionOxygenSat),
      ],
      t: t,
    );
  }

  void _showPAMOptions(AppLocalizations t) {
    _showCenteredMenu(
      title: t.medsPamTitle,
      options: [
        (_VitalOption.bpWomen, t.medsOptionBloodPressureWomen),
        (_VitalOption.bpMen, t.medsOptionBloodPressureMen),
      ],
      t: t,
    );
  }

  void _showCenteredMenu({
    required String title,
    required List<(_VitalOption, String)> options,
    required AppLocalizations t,
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
                        tooltip: t.medsModalClose,
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
                      final opt = options[i].$1;
                      final label = options[i].$2;

                      return _CenteredModalTile(
                        text: label,
                        onTap: () async {
                          Navigator.pop(ctx);
                          await _openVitalOption(opt);
                          if (!mounted) return;

                          if (title == t.medsPamTitle) {
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
  // Data / agrupación / búsqueda
  // ============================
  List<Medicamento> _getFilteredMedicamentos() {
    return allMedicamentos
        .where(
          (med) =>
              med.categoria != 'REPOSICION DE SODIO (Na <130mEq/L)' &&
              med.categoria != 'Reposición de HCO3',
        )
        .toList();
  }

  Map<String, List<Medicamento>> _groupAndSortMedicamentos(
    List<Medicamento> medicamentos,
    AppLocalizations t,
  ) {
    final Map<String, List<Medicamento>> grouped = {};

    for (var med in medicamentos) {
      grouped.putIfAbsent(med.categoria, () => []);
      grouped[med.categoria]!.add(med);
    }

    // ✅ Orden por nombre mostrado (EN/ES)
    grouped.forEach((key, value) {
      value.sort((a, b) => MedI18n.name(a, t).compareTo(MedI18n.name(b, t)));
    });

    // Categorías se ordenan por key original (estable y no rompe tu alpha range)
    return Map.fromEntries(
      grouped.entries.toList()..sort((e1, e2) => e1.key.compareTo(e2.key)),
    );
  }

  /// ✅ Búsqueda en EN/ES usando texto UI (traducción)
  List<Medicamento> _getFilteredMedicamentosForSearch(AppLocalizations t) {
    if (_searchText.isEmpty) return [];

    final q = _searchText.trim().toLowerCase();

    return _getFilteredMedicamentos().where((med) {
      final nombreUi = MedI18n.name(med, t).toLowerCase();
      final categoriaUi = MedI18n.category(med.categoria, t).toLowerCase();
      final sub = (med.subcategoria ?? '').toLowerCase();

      return nombreUi.contains(q) || categoriaUi.contains(q) || sub.contains(q);
    }).toList();
  }

  // ============================
  // ✅ Normalizar letras (acentos / ñ)
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
    return false; // placeholder
  }

  // ============================
  // Cálculo de dosis display
  // ============================
  String _formatDosis(double dosis) {
    final roundedDosis = double.parse(dosis.toStringAsFixed(2));
    if (roundedDosis == roundedDosis.toInt()) {
      return roundedDosis.toInt().toString();
    }
    return roundedDosis.toString();
  }

  String _getDosisDisplay(Medicamento medicamento) {
    final Map<String, dynamic> calculatedDoses = DosisCalculator.calculateDosis(
      widget.paciente,
      medicamento,
    );

    if (calculatedDoses.containsKey('display_string')) {
      return (calculatedDoses['display_string'] as String).trim();
    }

    final double dosisMl = calculatedDoses['ml'] ?? 0.0;
    final double dosisMg = calculatedDoses['mg'] ?? 0.0;
    final double dosisJulios = calculatedDoses['julios'] ?? 0.0;

    String display = '';
    if (dosisMl > 0.005) display += '${_formatDosis(dosisMl)} ml ';
    if (dosisMg > 0.005) display += '${_formatDosis(dosisMg)} mg ';
    if (dosisJulios > 0.005) display += '${_formatDosis(dosisJulios)} J';

    return display.trim().isEmpty ? 'N/A' : display.trim();
  }

  // ============================
  // UI: Tile del medicamento
  // ============================
  Widget _buildMedicamentoListTile(
    Medicamento medicamento,
    AppLocalizations t,
  ) {
    final String dosisDisplay = _getDosisDisplay(medicamento);

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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => MedicamentoDetailScreen(
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
              MedI18n.name(medicamento, t), // ✅ traducido
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
            subtitle: Text(
              t.medsSubtitleViewDetails,
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
  // UI: Header paciente
  // ============================
  Widget _patientHeader(AppLocalizations t) {
    final peso = widget.paciente.pesoKg;
    final edad = widget.paciente.edadAnios;

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
                    t.patientHeaderSummaryYears(
                      peso.toStringAsFixed(1),
                      edad.toString(),
                    ),
                    style: const TextStyle(fontWeight: FontWeight.w900),
                  ),
                  Chip(
                    label: Text(
                      widget.esPesoEstimado
                          ? t.medsChipEstimated
                          : t.medsChipRealWeight,
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
              child: Text(t.medsBtnChange),
            ),
          ],
        ),
      ),
    );
  }

  // ============================
  // UI: Buscador
  // ============================
  PreferredSizeWidget _buildSearchBar(AppLocalizations t) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(54.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: t.medsSearchHint,
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
  // Chips categorías (con ALL/Favorites)
  // ============================
  void _setAlphaRangeFromLabel(String label, AppLocalizations t) {
    // ✅ si tocan ALL (en inglés), internamente guardamos 'TODAS'
    if (label == t.medsAlphaAll) {
      setState(() => _alphaRange = 'TODAS');
    } else {
      setState(() => _alphaRange = label);
    }
  }

  Widget _categoryAlphabetFilters(AppLocalizations t) {
    Widget choice(String label) {
      final selected =
          (_alphaRange == 'TODAS' && label == t.medsAlphaAll) ||
          (_alphaRange == label);

      return ChoiceChip(
        label: Text(label),
        selected: selected,
        onSelected: (_) => _setAlphaRangeFromLabel(label, t), // ✅ aquí
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

    final allLabel = t.medsAlphaAll; // "TODAS" o "ALL"
    final favLabel = t.medsAlphaFavs; // "Favoritos" o "Favorites"

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          choice(allLabel),
          choice('A-C'),
          choice('D-F'),
          choice('G-I'),
          choice('J-L'),
          choice('M-O'),
          choice('P-R'),
          choice('S-U'),
          choice('V-Z'),
          FilterChip(
            label: Text(favLabel),
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

  // Tarjeta cálculos especiales
  Widget _specialCalculationsCard(AppLocalizations t) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) =>
                  CalculosEspecialesJovenesScreen(paciente: widget.paciente),
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
                  t.medsSpecialCalculations,
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
  // Imprimir (sin cambios de lógica)
  // ============================
  void _onPrintAll() {
    final List<MedicamentoCalculado> allCalculatedMeds = [];

    for (var med in _getFilteredMedicamentos()) {
      final Map<String, dynamic> calculatedDoses =
          DosisCalculator.calculateDosis(widget.paciente, med);

      if (calculatedDoses.containsKey('display_string')) {
        allCalculatedMeds.add(
          MedicamentoCalculado(
            medicamentoOriginal: med,
            dosisMlDisplay: calculatedDoses['display_string'] as String,
            dosisMgDisplay: 'N/A',
            dosisJuliosDisplay: 'N/A',
          ),
        );
      } else {
        final double dosisMl = (calculatedDoses['ml'] as double?) ?? 0.0;
        final double dosisMg = (calculatedDoses['mg'] as double?) ?? 0.0;
        final double dosisJulios =
            (calculatedDoses['julios'] as double?) ?? 0.0;

        allCalculatedMeds.add(
          MedicamentoCalculado(
            medicamentoOriginal: med,
            dosisMlDisplay: dosisMl > 0.005
                ? '${_formatDosis(dosisMl)} ml'
                : 'N/A',
            dosisMgDisplay: dosisMg > 0.005
                ? '${_formatDosis(dosisMg)} mg'
                : 'N/A',
            dosisJuliosDisplay: dosisJulios > 0.005
                ? '${_formatDosis(dosisJulios)} J'
                : 'N/A',
          ),
        );
      }
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PrintablePatientDataScreen(
          paciente: widget.paciente,
          medicamentosCalculados: allCalculatedMeds,
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

    // ✅ Recalcular agrupado aquí (porque t SOLO existe en build)
    _groupedMedicamentos = _groupAndSortMedicamentos(
      _getFilteredMedicamentos(),
      t,
    );

    final List<Medicamento> searchResults = _getFilteredMedicamentosForSearch(
      t,
    );
    final List<Widget> displayedListItems = [];

    if (_searchText.isNotEmpty) {
      for (var medicamento in searchResults) {
        if (_categoryInAlphaRange(medicamento.categoria) &&
            _passesFavoriteFilter(medicamento)) {
          displayedListItems.add(_buildMedicamentoListTile(medicamento, t));
        }
      }
    } else {
      displayedListItems.add(_patientHeader(t));
      displayedListItems.add(_categoryAlphabetFilters(t));
      displayedListItems.add(_specialCalculationsCard(t));

      _groupedMedicamentos.forEach((categoria, medicamentos) {
        if (!_categoryInAlphaRange(categoria)) return;

        displayedListItems.add(
          Padding(
            key: ValueKey(categoria),
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 10.0,
            ),
            child: Text(
              MedI18n.category(categoria, t), // ✅ traducida
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: _primaryBlueDark,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        );

        for (var medicamento in medicamentos) {
          if (_passesFavoriteFilter(medicamento)) {
            displayedListItems.add(_buildMedicamentoListTile(medicamento, t));
          }
        }
      });
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(t.medsTitleYears),
          bottom: _buildSearchBar(t),
          actions: [
            IconButton(
              icon: const Icon(Icons.print),
              onPressed: _onPrintAll,
              tooltip: t.medsPrintTooltip,
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
                      (BuildContext context, int index) =>
                          displayedListItems[index],
                      childCount: displayedListItems.length,
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
                            label: t.medsBottomSINGV,
                            icon: Icons.monitor_heart_outlined,
                            background: _highlightGreen,
                            onTap: () => _showSignosVitalesOptions(t),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _BottomActionButton(
                            label: t.medsBottomPAM,
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
