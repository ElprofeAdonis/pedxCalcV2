import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class TemperatureScreenJ extends StatelessWidget {
  const TemperatureScreenJ({super.key});

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
        _HeaderCell(t.tempTableHeaderMethod),
        _HeaderCell(t.tempTableHeaderNormal),
      ],
    );
  }

  TableRow _buildDataRow(
    String method,
    String normalRange, {
    bool alt = false,
  }) {
    return TableRow(
      decoration: BoxDecoration(
        color: alt ? const Color(0xFFF9FAFF) : Colors.white,
        border: const Border(
          bottom: BorderSide(color: Color(0xFFE6E6E6), width: 0.8),
        ),
      ),
      children: [
        _DataCell(method, fontWeight: FontWeight.w800),
        _DataCell(normalRange),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(t.tempAppBarTitleByMethod),
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
                            Icons.thermostat_outlined,
                            color: _primaryBlueDark,
                            size: 22,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              t.tempCardTitleNormalRangesByMethod,
                              style: _titleStyle,
                            ),
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
                              0: FlexColumnWidth(1.45),
                              1: FlexColumnWidth(1.0),
                            },
                            children: [
                              _buildHeaderRow(t),
                              _buildDataRow(
                                t.tempMethodRectal,
                                '36.6 - 38.0',
                                alt: false,
                              ),
                              _buildDataRow(
                                t.tempMethodTympanic,
                                '35.8 - 38.0',
                                alt: true,
                              ),
                              _buildDataRow(
                                t.tempMethodOral,
                                '35.5 - 37.5',
                                alt: false,
                              ),
                              _buildDataRow(
                                t.tempMethodAxillary,
                                '36.5 - 37.5',
                                alt: true,
                              ),
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
              // ✅ NOTAS / GUÍA (bonito)
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      t.tempNoteRangesDoNotVary,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                        color: _primaryBlueDark,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Bloque tipo “guía”
                    RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style.copyWith(
                          fontSize: 14,
                          height: 1.4,
                          color: scheme.onSurface.withAlpha(
                            (0.85 * 255).round(),
                          ),
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '${t.tempGuideScreeningLabel} ',
                            style: const TextStyle(fontWeight: FontWeight.w900),
                          ),
                          TextSpan(text: '${t.tempGuideScreeningText}\n'),
                          TextSpan(
                            text: '${t.tempGuideDefinitiveLabel} ',
                            style: const TextStyle(fontWeight: FontWeight.w900),
                          ),
                          TextSpan(text: '${t.tempGuideDefinitiveText}\n\n'),
                          TextSpan(
                            text: t.tempReferenceCps2015,
                            style: const TextStyle(
                              fontSize: 12.5,
                              fontStyle: FontStyle.italic,
                              color: Color.fromARGB(255, 95, 95, 95),
                            ),
                          ),
                        ],
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
