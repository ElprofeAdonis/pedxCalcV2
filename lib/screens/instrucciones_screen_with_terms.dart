import 'package:flutter/material.dart';
import 'package:mi_app/screens/edad_selection_screen.dart';
import 'package:mi_app/screens/about_screen.dart';
import '../l10n/app_localizations.dart';
import 'package:mi_app/main.dart'; // para usar localeController

enum _TermsMenu { about, language }

class InstruccionesScreenWithTerms extends StatefulWidget {
  const InstruccionesScreenWithTerms({super.key});

  @override
  State<InstruccionesScreenWithTerms> createState() =>
      _InstruccionesScreenWithTermsState();
}

class _InstruccionesScreenWithTermsState
    extends State<InstruccionesScreenWithTerms> {
  bool _termsAccepted = false;
  static const _primaryBlue = Color.fromARGB(255, 14, 113, 194);

  void _showLanguageDialog() {
    final t = AppLocalizations.of(context);

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (ctx) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    // puedes traducir esto también si quieres
                    'Seleccionar idioma',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Divider(),

                  ListTile(
                    leading: const Icon(Icons.language),
                    title: const Text('Español'),
                    onTap: () {
                      // ✅ Cambia a Español
                      AppLocaleController.set(const Locale('es'));
                      Navigator.pop(ctx);
                    },
                  ),

                  ListTile(
                    leading: const Icon(Icons.language_outlined),
                    title: const Text('English'),
                    onTap: () {
                      // ✅ Cambia a Inglés
                      AppLocaleController.set(const Locale('en'));
                      Navigator.pop(ctx);
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

  AppBar _buildAppBar() {
    final t = AppLocalizations.of(context);

    return AppBar(
      title: Text(t.termsTitle),
      actions: [
        PopupMenuButton<_TermsMenu>(
          icon: const Icon(Icons.more_vert),
          onSelected: (value) {
            switch (value) {
              case _TermsMenu.about:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AboutScreen()),
                );
                break;

              case _TermsMenu.language:
                _showLanguageDialog();
                break;
            }
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              value: _TermsMenu.about,
              child: ListTile(
                dense: true,
                leading: const Icon(Icons.info_outline),
                title: Text(t.menuAbout),
              ),
            ),
            PopupMenuItem(
              value: _TermsMenu.language,
              child: ListTile(
                dense: true,
                leading: const Icon(Icons.language),
                title: Text(t.menuLanguage),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Resumen rápido
                      Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(bottom: 14),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEAF3FF),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: _primaryBlue.withAlpha((0.25 * 255).round()),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.info_outline, color: _primaryBlue),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                '${t.quickSummaryTitle}\n${t.quickSummaryBody}',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      ),

                      InstructionAccordion(
                        title: t.accordion1Title,
                        content: t.accordion1Body,
                      ),
                      InstructionAccordion(
                        title: t.accordion2Title,
                        content: t.accordion2Body,
                      ),
                      InstructionAccordion(
                        title: t.accordion3Title,
                        content: t.accordion3Body,
                      ),
                      InstructionAccordion(
                        title: t.accordion4Title,
                        content: t.accordion4Body,
                      ),
                      InstructionAccordion(
                        title: t.accordion5Title,
                        content: t.accordion5Body,
                      ),
                      InstructionAccordion(
                        title: t.accordion6Title,
                        content: t.accordion6Body,
                      ),
                      InstructionAccordion(
                        title: t.accordion7Title,
                        content: t.accordion7Body,
                      ),
                      InstructionAccordion(
                        title: t.accordion8Title,
                        content: t.accordion8Body,
                      ),
                      InstructionAccordion(
                        title: t.accordion9Title,
                        content: t.accordion9Body,
                        isImportant: true,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Column(
                  children: [
                    CheckboxListTile(
                      value: _termsAccepted,
                      onChanged: (v) =>
                          setState(() => _termsAccepted = v ?? false),
                      activeColor: _primaryBlue,
                      title: Text(
                        t.termsAccept,
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium!.copyWith(color: _primaryBlue),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _termsAccepted
                            ? () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const EdadSelectionScreen(),
                                  ),
                                );
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          backgroundColor: _primaryBlue,
                          foregroundColor: Colors.white,
                          disabledBackgroundColor: _primaryBlue.withAlpha(
                            (0.35 * 255).round(),
                          ),
                          disabledForegroundColor: Colors.white70,
                        ),
                        child: Text(
                          t.btnContinue,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LanguageTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _LanguageTile({
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  static const Color _primaryBlue = Color.fromARGB(255, 14, 113, 194);

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
            color: Colors.white.withAlpha((0.70 * 255).round()),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _primaryBlue.withAlpha((0.15 * 255).round()),
            ),
          ),
          child: Row(
            children: [
              const Icon(Icons.language, color: _primaryBlue),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.black38),
            ],
          ),
        ),
      ),
    );
  }
}

class InstructionAccordion extends StatefulWidget {
  final String title;
  final String content;
  final bool isImportant;

  const InstructionAccordion({
    super.key,
    required this.title,
    required this.content,
    this.isImportant = false,
  });

  @override
  State<InstructionAccordion> createState() => _InstructionAccordionState();
}

class _InstructionAccordionState extends State<InstructionAccordion> {
  bool _isExpanded = false;
  static const _primaryBlue = Color.fromARGB(255, 14, 113, 194);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10.0),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          ListTile(
            title: Text(
              widget.title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: widget.isImportant ? Colors.red.shade700 : Colors.black,
              ),
            ),
            trailing: Icon(
              _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: widget.isImportant ? Colors.red.shade700 : _primaryBlue,
              size: 32,
            ),
            onTap: () => setState(() => _isExpanded = !_isExpanded),
          ),
          if (_isExpanded)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: widget.isImportant
                  ? Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFEBEE),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.red.shade200),
                      ),
                      child: Text(
                        widget.content,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 13,
                          color: Colors.red.shade900,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  : Text(
                      widget.content,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 13,
                        color: Colors.black.withAlpha((0.75 * 255).round()),
                      ),
                    ),
            ),
        ],
      ),
    );
  }
}
