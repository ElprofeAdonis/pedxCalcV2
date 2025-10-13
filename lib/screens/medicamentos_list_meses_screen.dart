import 'package:flutter/material.dart';
import 'package:mi_app/data/medicamento_data_meses.dart';
import 'package:mi_app/models/paciente.dart';
import 'package:mi_app/screens/medicamento_detail_meses_screen.dart';
import 'package:mi_app/screens/printable_patient_data_screen.dart';
import 'package:mi_app/utils/dosis_calculator_meses.dart';
import 'package:mi_app/models/medicamento.dart';
import 'package:mi_app/models/medicamento_calculado.dart';
import 'package:mi_app/screens/calculos_especiales_screen.dart';
import 'package:mi_app/screens/heart_rate_screen.dart';
import 'package:mi_app/screens/respiratory_rate_screen.dart';
import 'package:mi_app/screens/blood_pressure_screen.dart';
import 'package:mi_app/screens/temperature_screen.dart';
import 'package:mi_app/screens/oxygen_saturation_screen.dart';
import 'package:mi_app/screens/presion_arterial_mujeres_screen.dart';
import 'package:mi_app/screens/presion_arterial_hombres_screen.dart';

class MedicamentosListMesesScreen extends StatefulWidget {
  final Paciente paciente;

  const MedicamentosListMesesScreen({super.key, required this.paciente});

  @override
  // ignore: library_private_types_in_public_api
  _MedicamentosListMesesScreenState createState() =>
      _MedicamentosListMesesScreenState();
}

class _MedicamentosListMesesScreenState
    extends State<MedicamentosListMesesScreen> {
  final _searchController = TextEditingController();
  late Map<String, List<Medicamento>> _groupedMedicamentos;
  List<Medicamento> _filteredMedicamentos = [];
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _groupMedicamentos();
    _searchController.addListener(_filterMedicamentos);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterMedicamentos);
    _searchController.dispose();
    super.dispose();
  }

  void _groupMedicamentos() {
    _groupedMedicamentos = {};
    for (var medicamento in medicamentosMeses) {
      if (medicamento.categoria != 'LÍQUIDS IV' &&
          medicamento.categoria != 'Reposición de HCO3' &&
          medicamento.categoria != 'Reposición de Sodio') {
        if (!_groupedMedicamentos.containsKey(medicamento.categoria)) {
          _groupedMedicamentos[medicamento.categoria] = [];
        }
        _groupedMedicamentos[medicamento.categoria]!.add(medicamento);
      }
    }
  }

  void _filterMedicamentos() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _isSearching = query.isNotEmpty;
      if (_isSearching) {
        _filteredMedicamentos = medicamentosMeses.where((medicamento) {
          final isExcluded =
              medicamento.categoria == 'LÍQUIDS IV' ||
              medicamento.categoria == 'Reposición de HCO3' ||
              medicamento.categoria == 'Reposición de Sodio';

          if (isExcluded) return false;

          final nombreLower = medicamento.nombre.toLowerCase();
          final categoriaLower = medicamento.categoria.toLowerCase();
          final subcategoriaLower =
              medicamento.subcategoria?.toLowerCase() ?? '';
          final dosisLower = medicamento.dosisActualMG.toLowerCase();

          return nombreLower.contains(query) ||
              categoriaLower.contains(query) ||
              subcategoriaLower.contains(query) ||
              dosisLower.contains(query);
        }).toList();
      } else {
        _filteredMedicamentos = [];
      }
    });
  }

  String _getDosisDisplay(Medicamento medicamento, Paciente paciente) {
    final Map<String, dynamic> calculatedDoses =
        DosisCalculatorMeses.calculateDosis(paciente, medicamento);

    if (calculatedDoses.containsKey('display_string')) {
      return calculatedDoses['display_string'] as String;
    }

    final double dosisMl = (calculatedDoses['ml'] as double?) ?? 0.0;
    final double dosisMg = (calculatedDoses['mg'] as double?) ?? 0.0;
    final double dosisJulios = (calculatedDoses['julios'] as double?) ?? 0.0;

    final List<String> doses = [];
    if (dosisMl > 0.005) {
      doses.add('${DosisCalculatorMeses.formatDosis(dosisMl)} ml');
    }
    if (dosisMg > 0.005) {
      doses.add('${DosisCalculatorMeses.formatDosis(dosisMg)} mg');
    }
    if (dosisJulios > 0.005) {
      doses.add('${DosisCalculatorMeses.formatDosis(dosisJulios)} J');
    }

    return doses.isEmpty ? 'N/A' : doses.join(' / ');
  }

  List<MedicamentoCalculado> _calcularTodasLasDosis() {
    return medicamentosMeses.map((medicamento) {
      final Map<String, dynamic> calculatedDoses =
          DosisCalculatorMeses.calculateDosis(widget.paciente, medicamento);

      String dosisMlDisplay = 'N/A';
      String dosisMgDisplay = 'N/A';
      String dosisJuliosDisplay = 'N/A';

      if (calculatedDoses.containsKey('display_string')) {
        dosisMlDisplay = calculatedDoses['display_string'] as String;
        dosisMgDisplay = 'N/A';
        dosisJuliosDisplay = 'N/A';
      } else {
        final double dosisMl = (calculatedDoses['ml'] as double?) ?? 0.0;
        final double dosisMg = (calculatedDoses['mg'] as double?) ?? 0.0;
        final double dosisJulios =
            (calculatedDoses['julios'] as double?) ?? 0.0;

        if (dosisMl > 0.005) {
          dosisMlDisplay = '${DosisCalculatorMeses.formatDosis(dosisMl)} ml';
        }
        if (dosisMg > 0.005) {
          dosisMgDisplay = '${DosisCalculatorMeses.formatDosis(dosisMg)} mg';
        }
        if (dosisJulios > 0.005) {
          dosisJuliosDisplay =
              '${DosisCalculatorMeses.formatDosis(dosisJulios)} J';
        }
      }

      return MedicamentoCalculado(
        medicamentoOriginal: medicamento,
        dosisMlDisplay: dosisMlDisplay,
        dosisMgDisplay: dosisMgDisplay,
        dosisJuliosDisplay: dosisJuliosDisplay,
      );
    }).toList();
  }

  void _showSignosVitalesOptions(BuildContext context) {
    final Color highlightGreen = const Color.fromARGB(255, 83, 232, 103);
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: <Widget>[
              ListTile(
                title: Text(
                  'Signos Vitales',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: highlightGreen,
                  ),
                ),
              ),
              const Divider(),
              _buildModalListTile(context, 'Frecuencia Cardíaca'),
              _buildModalListTile(context, 'Frecuencia Respiratoria'),
              _buildModalListTile(context, 'Presión Arterial'),
              _buildModalListTile(context, 'Temperatura'),
              _buildModalListTile(context, 'Saturación de Oxígeno'),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  void _showPAMOptions(BuildContext context) {
    final Color highlightGreen = const Color.fromARGB(255, 83, 232, 103);

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text(
                  'Presión Arterial Media (PAM)',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: highlightGreen,
                  ),
                ),
              ),
              const Divider(),
              _buildModalListTile(context, 'Presión Arterial Mujeres'),
              _buildModalListTile(context, 'Presión Arterial Hombres'),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  Widget _buildModalListTile(BuildContext context, String title) {
    final Color primaryBlueDark = const Color.fromARGB(255, 14, 113, 194);
    final Color highlightGreen = const Color.fromARGB(255, 83, 232, 103);
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: primaryBlueDark,
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 18, color: highlightGreen),
      onTap: () {
        Navigator.pop(context);
        if (title == 'Frecuencia Cardíaca') {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const HeartRateScreen()),
          );
        } else if (title == 'Frecuencia Respiratoria') {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const RespiratoryRateScreen(),
            ),
          );
        } else if (title == 'Presión Arterial') {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const BloodPressureScreen(),
            ),
          );
        } else if (title == 'Temperatura') {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const TemperatureScreen()),
          );
        } else if (title == 'Saturación de Oxígeno') {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const OxygenSaturationScreen(),
            ),
          );
        } else if (title == 'Presión Arterial Mujeres') {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const PresionArterialMujeresScreen(),
            ),
          );
        } else if (title == 'Presión Arterial Hombres') {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const PresionArterialHombresScreen(),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Navegando a la pantalla de: $title')),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicamentos (1 - 11 meses)'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
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
                        },
                        color: Theme.of(context).colorScheme.onSurface,
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(60),
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 83, 232, 103),
                    width: 4.0,
                  ),
                ),
                filled: true,
                fillColor: const Color.fromARGB(255, 254, 254, 254),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
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
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.print),
            onPressed: () {
              final List<MedicamentoCalculado> medicamentosCalculados =
                  _calcularTodasLasDosis();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PrintablePatientDataScreen(
                    paciente: widget.paciente,
                    medicamentosCalculados: medicamentosCalculados,
                  ),
                ),
              );
            },
            tooltip: 'Imprimir reporte completo',
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 4.0,
              ),
              child: Card(
                margin: const EdgeInsets.symmetric(
                  horizontal: 0.0,
                  vertical: 2.0,
                ),
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
                      fontSize: 16.0,
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            CalculosEspecialesScreen(paciente: widget.paciente),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Paciente: ${widget.paciente.pesoKg} kg, ${widget.paciente.edadMeses} meses',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 120, 120, 120),
                  ),
                ),
              ),
            ),
            Expanded(
              child: _isSearching
                  ? ListView.builder(
                      itemCount: _filteredMedicamentos.length,
                      itemBuilder: (context, index) {
                        final medicamento = _filteredMedicamentos[index];
                        final String dosisDisplay = _getDosisDisplay(
                          medicamento,
                          widget.paciente,
                        );
                        return _buildMedicamentoListTile(
                          medicamento,
                          dosisDisplay,
                        );
                      },
                    )
                  : CustomScrollView(slivers: _buildCategorizedListSlivers()),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => _showSignosVitalesOptions(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                          255,
                          83,
                          232,
                          103,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'SING V',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => _showPAMOptions(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                          255,
                          14,
                          113,
                          194,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'PAM',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildCategorizedListSlivers() {
    final List<Widget> slivers = [];
    final Color primaryBlueDark = const Color.fromARGB(255, 14, 113, 194);

    _groupedMedicamentos.forEach((categoria, medicamentos) {
      slivers.add(
        SliverToBoxAdapter(
          key: ValueKey(categoria),
          child: Padding(
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
        ),
      );

      for (var medicamento in medicamentos) {
        final String dosisDisplay = _getDosisDisplay(
          medicamento,
          widget.paciente,
        );
        slivers.add(
          SliverToBoxAdapter(
            key: ValueKey('${medicamento.nombre}-${medicamento.categoria}'),
            child: _buildMedicamentoListTile(medicamento, dosisDisplay),
          ),
        );
      }
    });

    return slivers;
  }

  Widget _buildMedicamentoListTile(
    Medicamento medicamento,
    String dosisDisplay,
  ) {
    return Card(
      key: ValueKey('${medicamento.nombre}-${medicamento.categoria}'),
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 1.0),
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
            fontSize: 18.0,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16.0,
          color: Color.fromARGB(255, 14, 113, 194),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MedicamentoDetailMesesScreen(
                medicamento: medicamento,
                paciente: widget.paciente,
              ),
            ),
          );
        },
        tileColor: Colors.white,
        selectedTileColor: Theme.of(
          context,
          // ignore: deprecated_member_use
        ).colorScheme.primary.withOpacity(0.05),
        // ignore: deprecated_member_use
        splashColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
      ),
    );
  }
}
