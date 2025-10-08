// lib/screens/select_medicamento_screen.dart

import 'package:flutter/material.dart';
import 'package:mi_app/models/medicamento.dart';
import 'package:mi_app/models/paciente.dart';
import 'package:mi_app/data/medicamento_data.dart'; // Asegúrate de que este archivo exista y esté correcto
import 'package:mi_app/screens/medicamento_detail_screen.dart';
import 'package:mi_app/screens/printable_patient_data_screen.dart';
import 'package:mi_app/models/medicamento_calculado.dart';
import 'package:mi_app/utils/dosis_calculator.dart'; // Tu clase DosisCalculator
import 'package:mi_app/screens/calculos_especiales_jovenes_screen.dart';

class SelectMedicamentoScreen extends StatefulWidget {
  final Paciente paciente;

  const SelectMedicamentoScreen({Key? key, required this.paciente})
    : super(key: key);

  @override
  State<SelectMedicamentoScreen> createState() =>
      _SelectMedicamentoScreenState();
}

class _SelectMedicamentoScreenState extends State<SelectMedicamentoScreen> {
  late Map<String, List<Medicamento>> _groupedMedicamentos;
  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  @override
  void initState() {
    super.initState();
    _groupedMedicamentos = _groupAndSortMedicamentos(
      _getFilteredMedicamentos(),
    );
    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text.toLowerCase();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

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
  ) {
    final Map<String, List<Medicamento>> grouped = {};
    for (var med in medicamentos) {
      if (!grouped.containsKey(med.categoria)) {
        grouped[med.categoria] = [];
      }
      grouped[med.categoria]!.add(med);
    }
    grouped.forEach((key, value) {
      value.sort((a, b) => a.nombre.compareTo(b.nombre));
    });
    return Map.fromEntries(
      grouped.entries.toList()..sort((e1, e2) => e1.key.compareTo(e2.key)),
    );
  }

  List<Medicamento> _getFilteredMedicamentosForSearch() {
    if (_searchText.isEmpty) {
      return [];
    }
    return _getFilteredMedicamentos()
        .where(
          (med) =>
              med.nombre.toLowerCase().contains(_searchText) ||
              med.categoria.toLowerCase().contains(_searchText),
        )
        .toList();
  }

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
      return calculatedDoses['display_string'] as String;
    }

    final double dosisMl = calculatedDoses['ml']!;
    final double dosisMg = calculatedDoses['mg']!;
    final double dosisJulios = calculatedDoses['julios']!;

    String display = '';

    if (dosisMl > 0.005) {
      display += '${_formatDosis(dosisMl)} ml ';
    }
    if (dosisMg > 0.005) {
      display += '${_formatDosis(dosisMg)} mg ';
    }
    if (dosisJulios > 0.005) {
      display += '${_formatDosis(dosisJulios)} J';
    }
    return display.trim().isEmpty ? 'N/A' : display.trim();
  }

  Widget _buildMedicamentoListTile(Medicamento medicamento) {
    final String dosisDisplay = _getDosisDisplay(medicamento);
    return Card(
      key: ValueKey(medicamento.nombre),
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      elevation: 0.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: ListTile(
        title: Text(
          medicamento.nombre,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        subtitle: Text(
          dosisDisplay,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: const Color.fromARGB(255, 83, 232, 103),
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16.0,
          color: Color.fromARGB(255, 14, 113, 194),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MedicamentoDetailScreen(
                medicamento: medicamento,
                paciente: widget.paciente,
              ),
            ),
          );
        },
        tileColor: Colors.white,
        selectedTileColor: Theme.of(
          context,
        ).colorScheme.primary.withOpacity(0.05),
        splashColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Medicamento> searchResults = _getFilteredMedicamentosForSearch();
    final Color primaryBlueDark = const Color.fromARGB(255, 14, 113, 194);

    final List<Widget> displayedListItems = [];

    if (_searchText.isNotEmpty) {
      for (var medicamento in searchResults) {
        displayedListItems.add(_buildMedicamentoListTile(medicamento));
      }
    } else {
      displayedListItems.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
          child: Card(
            elevation: 0.5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ListTile(
              title: const Text(
                'Cálculos especiales',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 83, 232, 103),
                  fontSize: 16,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CalculosEspecialesJovenesScreen(
                      paciente: widget.paciente,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      );

      _groupedMedicamentos.forEach((categoria, medicamentos) {
        displayedListItems.add(
          Padding(
            key: ValueKey(categoria),
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Text(
              categoria,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: primaryBlueDark,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        );
        for (var medicamento in medicamentos) {
          displayedListItems.add(_buildMedicamentoListTile(medicamento));
        }
      });
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Medicamentos (1 - 14 años) '),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Buscar medicamento...',
                  hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
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
                          color: Theme.of(context).colorScheme.onSurface,
                        )
                      : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 83, 232, 103),
                      width: 4.0,
                    ),
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 254, 254, 254),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 143, 143, 143),
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 83, 232, 103),
                      width: 3.0,
                    ),
                  ),
                ),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.print),
              onPressed: () {
                final List<MedicamentoCalculado> allCalculatedMeds = [];
                for (var med in _getFilteredMedicamentos()) {
                  final Map<String, dynamic> calculatedDoses =
                      DosisCalculator.calculateDosis(widget.paciente, med);
                  if (calculatedDoses.containsKey('display_string')) {
                    allCalculatedMeds.add(
                      MedicamentoCalculado(
                        medicamentoOriginal: med,
                        dosisMlDisplay:
                            calculatedDoses['display_string'] as String,
                        dosisMgDisplay: 'N/A',
                        dosisJuliosDisplay: 'N/A',
                      ),
                    );
                  } else {
                    final double dosisMl =
                        (calculatedDoses['ml'] as double?) ?? 0.0;
                    final double dosisMg =
                        (calculatedDoses['mg'] as double?) ?? 0.0;
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
                    builder: (context) => PrintablePatientDataScreen(
                      paciente: widget.paciente,
                      medicamentosCalculados: allCalculatedMeds,
                    ),
                  ),
                );
              },
              tooltip: 'Imprimir todos los medicamentos calculados',
            ),
          ],
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Paciente: ${widget.paciente.pesoKg.toStringAsFixed(1)} Kg, ${widget.paciente.edadAnios} Años',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((
                BuildContext context,
                int index,
              ) {
                return displayedListItems[index];
              }, childCount: displayedListItems.length),
            ),
          ],
        ),
      ),
    );
  }
}
