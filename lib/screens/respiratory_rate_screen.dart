import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class RespiratoryRateScreen extends StatelessWidget {
  const RespiratoryRateScreen({super.key});

  // 🎨 Colores base (igual que tu app)
  static const Color _primaryBlueDark = Color.fromARGB(255, 14, 113, 194);
  static const Color _highlightGreen = Color.fromARGB(255, 83, 232, 103);

  static const TextStyle _titleStyle = TextStyle(
    fontWeight: FontWeight.w900,
    color: _primaryBlueDark,
    fontSize: 18,
  );

  TableRow _buildHeaderRow(AppLocalizations t) {
    return TableRow(
      decoration: const BoxDecoration(color: _primaryBlueDark),
      children: [
        _HeaderCell(t.rrTableHeaderAge),
        _HeaderCell(t.rrTableHeaderNormal),
      ],
    );
  }

  TableRow _buildDataRow(String age, String normalRate, {bool alt = false}) {
    return TableRow(
      decoration: BoxDecoration(
        color: alt ? const Color(0xFFF9FAFF) : Colors.white,
        border: const Border(
          bottom: BorderSide(color: Color(0xFFE6E6E6), width: 0.8),
        ),
      ),
      children: [
        _DataCell(age, fontWeight: FontWeight.w800),
        _DataCell(normalRate),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(t.rrAppBarTitleWithUnit),
        backgroundColor: _primaryBlueDark,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // =======================
              // ✅ CARD PRINCIPAL
              // =======================
              Card(
                elevation: 1,
                color: const Color(0xFFF6F3FB),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      Row(
                        children: [
                          const Icon(
                            Icons.air,
                            color: _primaryBlueDark,
                            size: 22,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(t.rrCardTitle, style: _titleStyle),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Divider(
                        height: 1,
                        color: _primaryBlueDark.withAlpha((0.12 * 255).round()),
                      ),
                      const SizedBox(height: 12),

                      // Tabla con borde verde
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha((0.75 * 255).round()),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: _highlightGreen.withAlpha(
                              (0.55 * 255).round(),
                            ),
                            width: 1,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Table(
                            border: TableBorder.symmetric(
                              inside: BorderSide(
                                color: _primaryBlueDark.withAlpha(
                                  (0.08 * 255).round(),
                                ),
                                width: 1,
                              ),
                            ),
                            columnWidths: const {
                              0: FlexColumnWidth(1.6),
                              1: FlexColumnWidth(1.0),
                            },
                            children: [
                              _buildHeaderRow(t),
                              _buildDataRow(t.rrAgeInfant, '30-53', alt: false),
                              _buildDataRow(t.rrAgeToddler, '22-37', alt: true),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 14),

              // =======================
              // ✅ NOTA / FUENTE
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
                    const Icon(
                      Icons.menu_book_outlined,
                      color: _highlightGreen,
                      size: 20,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        t.rrSourceNote,
                        style: TextStyle(
                          fontSize: 13.5,
                          height: 1.45,
                          fontStyle: FontStyle.italic,
                          color: scheme.onSurface.withAlpha(
                            (0.78 * 255).round(),
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

/// ===============================
/// ✅ Header cell reusable
/// ===============================
class _HeaderCell extends StatelessWidget {
  final String text;
  const _HeaderCell(this.text);

  static const TextStyle _headerStyle = TextStyle(
    fontWeight: FontWeight.w900,
    color: Colors.white,
    fontSize: 14,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      alignment: Alignment.center,
      child: Text(
        text,
        style: _headerStyle,
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

/// ===============================
/// ✅ Data cell reusable
/// ===============================
class _DataCell extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;

  const _DataCell(this.text, {this.fontWeight = FontWeight.w600});

  static const TextStyle _baseStyle = TextStyle(fontSize: 14.5, height: 1.25);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: _baseStyle.copyWith(fontWeight: fontWeight),
        textAlign: TextAlign.left,
        softWrap: true,
      ),
    );
  }
}
