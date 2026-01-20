import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class BloodPressureScreen extends StatelessWidget {
  const BloodPressureScreen({super.key});

  // 🎨 Colores base (igual que tu app)
  static const Color _primaryBlueDark = Color.fromARGB(255, 14, 113, 194);
  static const Color _highlightGreen = Color.fromARGB(255, 83, 232, 103);

  static const TextStyle _headerTextStyle = TextStyle(
    fontWeight: FontWeight.w900,
    color: _primaryBlueDark,
    fontSize: 13.5,
  );

  static const TextStyle _cellTextStyle = TextStyle(fontSize: 13);
  static const TextStyle _cellBoldStyle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w800,
  );

  DataColumn _col(String text, double w, {int maxLines = 2}) {
    return DataColumn(
      label: SizedBox(
        width: w,
        child: Text(
          text,
          textAlign: TextAlign.center,
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
          style: _headerTextStyle,
        ),
      ),
    );
  }

  DataCell _cell(String text, double w, {bool bold = false}) {
    return DataCell(
      SizedBox(
        width: w,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: bold ? _cellBoldStyle : _cellTextStyle,
        ),
      ),
    );
  }

  DataRow _row(
    double w0,
    double w1,
    double w2,
    double w3,
    String age,
    String systolic,
    String diastolic,
    String hypotension, {
    required Color bg,
  }) {
    return DataRow(
      color: WidgetStateProperty.all(bg),
      cells: [
        _cell(age, w0, bold: true),
        _cell(systolic, w1),
        _cell(diastolic, w2),
        _cell(hypotension, w3),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final t = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.bpNeoAppBarTitle),
        backgroundColor: _primaryBlueDark,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // =======================
              // 📊 TABLA EN CARD
              // =======================
              Card(
                elevation: 1,
                color: const Color(0xFFF6F3FB),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      // ancho mínimo para que no se aplaste
                      const minWidth = 820.0;
                      final tableWidth = constraints.maxWidth < minWidth
                          ? minWidth
                          : constraints.maxWidth;

                      // Column widths
                      final w0 = tableWidth * 0.38; // Edad
                      final w1 = tableWidth * 0.18; // Sistólico
                      final w2 = tableWidth * 0.18; // Diastólico
                      final w3 = tableWidth * 0.26; // Hipotensión

                      return Scrollbar(
                        thumbVisibility: true,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: ConstrainedBox(
                            constraints: BoxConstraints(minWidth: tableWidth),
                            child: DataTable(
                              headingRowHeight: 56,
                              dataRowMinHeight: 58,
                              dataRowMaxHeight: 72,
                              columnSpacing: 0,
                              horizontalMargin: 0,
                              border: TableBorder.all(
                                color: _highlightGreen.withAlpha(
                                  (0.55 * 255).round(),
                                ),
                                width: 1,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              headingRowColor: WidgetStateProperty.all(
                                Colors.white.withAlpha((0.85 * 255).round()),
                              ),
                              columns: [
                                _col(t.bpNeoColAge, w0),
                                _col(t.bpNeoColSystolic, w1),
                                _col(t.bpNeoColDiastolic, w2),
                                _col(t.bpNeoColHypotensionSystolic, w3),
                              ],
                              rows: [
                                _row(
                                  w0,
                                  w1,
                                  w2,
                                  w3,
                                  t.bpNeoRowBirth12hLt1kg,
                                  '39-59',
                                  '16-36',
                                  '<40-50',
                                  bg: Colors.white.withAlpha(
                                    (0.75 * 255).round(),
                                  ),
                                ),
                                _row(
                                  w0,
                                  w1,
                                  w2,
                                  w3,
                                  t.bpNeoRowBirth12h3kg,
                                  '60-76',
                                  '31-45',
                                  '<50',
                                  bg: Colors.white.withAlpha(
                                    (0.45 * 255).round(),
                                  ),
                                ),
                                _row(
                                  w0,
                                  w1,
                                  w2,
                                  w3,
                                  t.bpNeoRowNeonate96h,
                                  '67-84',
                                  '35-53',
                                  '<60',
                                  bg: Colors.white.withAlpha(
                                    (0.75 * 255).round(),
                                  ),
                                ),
                                _row(
                                  w0,
                                  w1,
                                  w2,
                                  w3,
                                  t.bpNeoRowInfant1to12mo,
                                  '72-104',
                                  '37-56',
                                  '<70',
                                  bg: Colors.white.withAlpha(
                                    (0.45 * 255).round(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 14),

              // =======================
              // 📝 NOTA EN CARD
              // =======================
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: _primaryBlueDark.withAlpha((0.18 * 255).round()),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.info_outline, color: _highlightGreen, size: 20),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        t.bpNeoNote,
                        style: _cellTextStyle.copyWith(
                          fontStyle: FontStyle.italic,
                          color: scheme.onSurface.withAlpha(
                            (0.85 * 255).round(),
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
      ),
    );
  }
}
