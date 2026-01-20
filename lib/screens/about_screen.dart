import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  // ✅ Ajusta aquí tu versión (manual)
  static const String appVersion = 'v2.0.0';

  // ✅ Tu marca
  static const String companyName = 'A.P.D. Software Solutions';

  // ✅ Colores
  static const Color primaryBlue = Color.fromARGB(255, 14, 113, 194);
  static const Color highlightGreen = Color.fromARGB(255, 83, 232, 103);

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final year = DateTime.now().year;

    return Scaffold(
      appBar: AppBar(
        title: Text(t.aboutTitle),
        backgroundColor: primaryBlue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ===== Header: Logo + Nombre =====
              Container(
                padding: const EdgeInsets.all(16),
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
                  border: Border.all(
                    color: primaryBlue.withAlpha((0.12 * 255).round()),
                  ),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.asset(
                        'assets/images/pedx.png',
                        width: 64,
                        height: 64,
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Pedx Calc',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w900,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            appVersion,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: primaryBlue.withAlpha(
                                (0.90 * 255).round(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: highlightGreen.withAlpha((0.12 * 255).round()),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: highlightGreen.withAlpha((0.35 * 255).round()),
                        ),
                      ),
                      child: Text(
                        t.proTag,
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF1B5E20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              _InfoCard(
                title: t.developedBy,
                icon: Icons.verified_rounded,
                child: Text(
                  companyName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Colors.black87,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              _InfoCard(
                title: t.purpose,
                icon: Icons.favorite_rounded,
                child: Text(
                  t.aboutPurposeText,
                  style: const TextStyle(fontSize: 15, height: 1.35),
                ),
              ),

              const SizedBox(height: 10),

              _InfoCard(
                title: t.support,
                icon: Icons.support_agent_rounded,
                child: Text(
                  t.aboutSupportText,
                  style: const TextStyle(fontSize: 15, height: 1.35),
                ),
              ),

              const SizedBox(height: 16),

              // ===== Footer =====
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFFF6F3FB),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: primaryBlue.withAlpha((0.10 * 255).round()),
                  ),
                ),
                child: Text(
                  '© $year $companyName. ${t.rightsReserved}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12.5,
                    color: Color.fromARGB(255, 90, 90, 90),
                    height: 1.4,
                  ),
                ),
              ),

              const SizedBox(height: 14),

              ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_rounded),
                label: Text(t.back),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget child;

  const _InfoCard({
    required this.title,
    required this.icon,
    required this.child,
  });

  static const Color primaryBlue = Color.fromARGB(255, 14, 113, 194);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 14,
            offset: Offset(0, 7),
          ),
        ],
        border: Border.all(color: primaryBlue.withAlpha((0.08 * 255).round())),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: primaryBlue.withAlpha((0.10 * 255).round()),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: primaryBlue),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.black87,
                    fontSize: 14.5,
                  ),
                ),
                const SizedBox(height: 6),
                child,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
