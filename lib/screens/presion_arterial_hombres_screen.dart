import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class PresionArterialHombresScreen extends StatelessWidget {
  const PresionArterialHombresScreen({super.key});

  // Colores consistentes con tu app
  static const Color _primaryBlueDark = Color.fromARGB(255, 14, 113, 194);
  static const Color _highlightGreen = Color.fromARGB(255, 83, 232, 103);

  static const TextStyle _cellTextStyle = TextStyle(fontSize: 12.5);
  static const TextStyle _cellBoldTextStyle = TextStyle(
    fontSize: 12.5,
    fontWeight: FontWeight.w800,
  );

  DataColumn _buildDataColumn(String label, double colWidth) {
    return DataColumn(
      label: SizedBox(
        width: colWidth,
        child: Text(
          label,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.w900,
            color: _primaryBlueDark,
            fontSize: 13.5,
          ),
        ),
      ),
    );
  }

  DataCell _buildDataCell(
    String text,
    double colWidth, {
    bool bold = false,
    Color? color,
  }) {
    return DataCell(
      SizedBox(
        width: colWidth,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: (bold ? _cellBoldTextStyle : _cellTextStyle).copyWith(
            color: color,
          ),
        ),
      ),
    );
  }

  DataRow _row(
    double colW,
    String edad,
    String sDMin,
    String sDMed,
    String sDMax,
    String pamMin,
    String pamMed,
    String pamMax, {
    required Color? bg,
  }) {
    return DataRow(
      color: WidgetStateProperty.all(bg),
      cells: [
        _buildDataCell(edad, colW, bold: true),
        _buildDataCell(sDMin, colW),
        _buildDataCell(sDMed, colW),
        _buildDataCell(sDMax, colW),
        _buildDataCell(pamMin, colW),
        _buildDataCell(pamMed, colW),
        _buildDataCell(pamMax, colW),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(t.bpMenTitle), // ✅ i18n
        backgroundColor: _primaryBlueDark,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ===== Tabla en Card =====
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
                      final available = constraints.maxWidth;
                      final minTableWidth = 820.0;
                      final tableWidth = available < minTableWidth
                          ? minTableWidth
                          : available;

                      final colWidth = tableWidth / 7;

                      return Scrollbar(
                        thumbVisibility: true,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: ConstrainedBox(
                            constraints: BoxConstraints(minWidth: tableWidth),
                            child: DataTable(
                              headingRowHeight: 56,
                              dataRowMinHeight: 62,
                              dataRowMaxHeight: 78,
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
                                Colors.white.withAlpha((0.75 * 255).round()),
                              ),
                              columns: [
                                _buildDataColumn(
                                  t.bpColAge.toUpperCase(),
                                  colWidth,
                                ),
                                _buildDataColumn(t.bpColMin, colWidth),
                                _buildDataColumn(t.bpColMean, colWidth),
                                _buildDataColumn(t.bpColMax, colWidth),
                                _buildDataColumn(t.bpColMin, colWidth),
                                _buildDataColumn(t.bpColMean, colWidth),
                                _buildDataColumn(t.bpColMax, colWidth),
                              ],
                              rows: [
                                // Subheader (agrupación)
                                DataRow(
                                  color: WidgetStateProperty.all(
                                    Colors.black.withAlpha(
                                      (0.05 * 255).round(),
                                    ),
                                  ),
                                  cells: [
                                    _buildDataCell('', colWidth, bold: true),
                                    _buildDataCell(
                                      t.bpGroupSystolicDiastolic,
                                      colWidth,
                                      bold: true,
                                      color: Colors.black54,
                                    ),
                                    _buildDataCell('', colWidth, bold: true),
                                    _buildDataCell('', colWidth, bold: true),
                                    _buildDataCell(
                                      t.bpGroupMeanArterialPressure,
                                      colWidth,
                                      bold: true,
                                      color: Colors.black54,
                                    ),
                                    _buildDataCell('', colWidth, bold: true),
                                    _buildDataCell('', colWidth, bold: true),
                                  ],
                                ),

                                // Filas zebra (✅ datos igual)
                                _row(
                                  colWidth,
                                  t.bpAgeLt7Days,
                                  '63.1 / 42.2',
                                  '72.5 / 51.1',
                                  '82.3 / 60.0',
                                  '49.2',
                                  '58.3',
                                  '67.4',
                                  bg: Colors.white.withAlpha(
                                    (0.75 * 255).round(),
                                  ),
                                ),
                                _row(
                                  colWidth,
                                  t.bpAge8To30Days,
                                  '79.9 / 39.1',
                                  '82.0 / 50.3',
                                  '93.1 / 61.5',
                                  '52.7',
                                  '60.9',
                                  '72.1',
                                  bg: Colors.white.withAlpha(
                                    (0.45 * 255).round(),
                                  ),
                                ),
                                _row(
                                  colWidth,
                                  t.bpAge1To5Months,
                                  '81.8 / 36.6',
                                  '93.0 / 47.8',
                                  '105.9 / 59.0',
                                  '51.1',
                                  '62.9',
                                  '74.6',
                                  bg: Colors.white.withAlpha(
                                    (0.75 * 255).round(),
                                  ),
                                ),
                                _row(
                                  colWidth,
                                  t.bpAge6To11Months,
                                  '80.6 / 43.3',
                                  '95.4 / 53.3',
                                  '110.2 / 63.2',
                                  '55.8',
                                  '67.3',
                                  '78.9',
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

              // ===== Nota en Card informativa =====
              Card(
                elevation: 0,
                color: scheme.surface,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                  side: BorderSide(
                    color: _primaryBlueDark.withAlpha((0.15 * 255).round()),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.info_outline, color: _primaryBlueDark),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          t.bpMenNote, // ✅ i18n
                          style: TextStyle(
                            fontSize: 12.5,
                            color: scheme.onSurface.withAlpha(
                              (0.75 * 255).round(),
                            ),
                            height: 1.35,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 14),

              // ===== Fórmulas =====
              Text(
                t.bpFormulasTitle, // ✅ i18n
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                  color: scheme.onSurface.withAlpha((0.85 * 255).round()),
                ),
              ),
              const SizedBox(height: 8),
              Text(t.bpFormulaLine1, style: _cellTextStyle),
              const SizedBox(height: 4),
              Text(
                t.bpFormulaLine2,
                style: _cellTextStyle.copyWith(color: scheme.onSurface),
              ),
              const SizedBox(height: 4),
              Text(
                t.bpFormulaLine3,
                style: _cellTextStyle.copyWith(color: scheme.onSurface),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
