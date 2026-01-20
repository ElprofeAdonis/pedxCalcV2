import 'package:flutter/material.dart';
import 'package:mi_app/screens/paciente_data_screen.dart';
import 'package:mi_app/screens/paciente_data_meses_screen.dart';
import 'package:mi_app/l10n/app_localizations.dart';

// ✅ Recomendado: usa un archivo de estilos (abajo te doy uno)
import 'package:mi_app/theme/app_ui.dart';

class EdadSelectionScreen extends StatefulWidget {
  const EdadSelectionScreen({super.key});

  @override
  State<EdadSelectionScreen> createState() => _EdadSelectionScreenState();
}

class _EdadSelectionScreenState extends State<EdadSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(t.ageSelectTitle), // ✅
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 520),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      t.ageSelectQuestion, // ✅
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            color: AppUI.primaryBlue, // ✅
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      t.ageSelectSubtitle, // ✅
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.black.withAlpha((0.65 * 255).round()),
                      ),
                    ),
                    const SizedBox(height: 28),

                    _OptionCard(
                      icon: Icons.child_care,
                      title: t.ageYearsTitle, // ✅
                      subtitle: t.ageYearsSubtitle, // ✅
                      badgeText: t.commonBadge, // ✅
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const PacienteDataScreen(isEdadAniosMode: true),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 16),

                    _OptionCard(
                      icon: Icons.baby_changing_station,
                      title: t.ageMonthsTitle, // ✅
                      subtitle: t.ageMonthsSubtitle, // ✅
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const PacienteDataMesesScreen(),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 24),

                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEAF3FF),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppUI.primaryBlue.withAlpha(
                            (0.20 * 255).round(),
                          ), // ✅
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.info_outline,
                            color: AppUI.primaryBlue,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              t.ageSelectNote, // ✅
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _OptionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final String? badgeText;

  const _OptionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.badgeText,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppUI.primaryBlue.withAlpha((0.25 * 255).round()),
          ), // ✅
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha((0.06 * 255).round()),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: const Color(0xFFEAF3FF),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: AppUI.primaryBlue), // ✅
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      if (badgeText != null) ...[
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE9F7EF),
                            borderRadius: BorderRadius.circular(999),
                            border: Border.all(color: const Color(0xFFB7E4C7)),
                          ),
                          child: Text(
                            badgeText!,
                            style: Theme.of(context).textTheme.labelSmall
                                ?.copyWith(
                                  color: const Color(0xFF1B5E20),
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.black.withAlpha((0.65 * 255).round()),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.chevron_right, color: AppUI.primaryBlue),
          ],
        ),
      ),
    );
  }
}
