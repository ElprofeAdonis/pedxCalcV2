import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class OxygenSaturationScreenJ extends StatelessWidget {
  const OxygenSaturationScreenJ({super.key});

  // 🎨 Colores base (igual que tu app)
  static const Color _primaryBlueDark = Color.fromARGB(255, 14, 113, 194);
  static const Color _highlightGreen = Color.fromARGB(255, 83, 232, 103);

  static const TextStyle _titleStyle = TextStyle(
    fontWeight: FontWeight.w900,
    color: _primaryBlueDark,
    fontSize: 18,
  );

  static const TextStyle _bodyStyle = TextStyle(fontSize: 15.5, height: 1.55);

  static const TextStyle _boldBodyStyle = TextStyle(
    fontSize: 15.5,
    height: 1.55,
    fontWeight: FontWeight.w800,
    color: _primaryBlueDark,
  );

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(t.o2AppBarTitle),
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
                            child: Text(t.o2CardTitle, style: _titleStyle),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Divider(
                        height: 1,
                        color: _primaryBlueDark.withAlpha((0.12 * 255).round()),
                      ),
                      const SizedBox(height: 12),

                      // Contenido
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(14),
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
                        child: RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style.copyWith(
                              color: scheme.onSurface.withAlpha(
                                (0.92 * 255).round(),
                              ),
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: '${t.o2Paragraph1}\n\n',
                                style: _bodyStyle,
                              ),
                              TextSpan(
                                text: t.o2Paragraph2Part1,
                                style: _bodyStyle,
                              ),
                              TextSpan(
                                text: t.o2ThresholdBold,
                                style: _boldBodyStyle,
                              ),
                              TextSpan(
                                text: t.o2Paragraph2Part2,
                                style: _bodyStyle,
                              ),
                              TextSpan(
                                text: t.o2RespConditionBold,
                                style: _boldBodyStyle,
                              ),
                              TextSpan(text: t.o2Or, style: _bodyStyle),
                              TextSpan(
                                text: t.o2CyanoticHeartBold,
                                style: _boldBodyStyle,
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
              // ✅ NOTA EN TARJETA
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
                      Icons.info_outline,
                      color: _highlightGreen,
                      size: 20,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        t.o2Note,
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
