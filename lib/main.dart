import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mi_app/screens/splash_screen.dart';

// Si usas flutter gen-l10n (lo normal)
import 'package:mi_app/l10n/app_localizations.dart';

/// ✅ Control global del idioma
class AppLocaleController {
  static final ValueNotifier<Locale?> locale = ValueNotifier<Locale?>(null);

  static void set(Locale? newLocale) {
    locale.value = newLocale;
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const Color _blue = Color.fromARGB(255, 14, 113, 194);
  static const Color _green = Color.fromARGB(255, 83, 232, 103);

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: _blue,
      primary: _blue,
      secondary: _green,
      surface: const Color(0xFFF8F8F8),
    );

    return ValueListenableBuilder<Locale?>(
      valueListenable: AppLocaleController.locale,
      builder: (context, currentLocale, _) {
        return MaterialApp(
          title: 'Pedx Calc',
          debugShowCheckedModeBanner: false,

          // ✅ Usa el controlador si existe, si no: inglés por defecto
          locale: currentLocale ?? const Locale('en'),

          // ✅ Idiomas soportados
          supportedLocales: const [Locale('en'), Locale('es')],

          // ✅ Delegates de localización
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],

          theme: ThemeData(
            useMaterial3: true,
            colorScheme: colorScheme,
            scaffoldBackgroundColor: colorScheme.surface,

            appBarTheme: AppBarTheme(
              backgroundColor: colorScheme.primary,
              foregroundColor: Colors.white,
              elevation: 0,
              centerTitle: true,
              titleTextStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),

            textTheme: const TextTheme(
              headlineLarge: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
              ),
              headlineMedium: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
              titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
              bodyLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              bodyMedium: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Color(0xFF666666),
              ),
            ),

            cardTheme: CardThemeData(
              elevation: 1,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),

            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 12,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.black.withAlpha((0.15 * 255).round()),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.black.withAlpha((0.15 * 255).round()),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: colorScheme.secondary,
                  width: 2.5,
                ),
              ),
            ),

            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: colorScheme.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.3,
                ),
              ),
            ),
          ),

          home: const SplashScreen(),
        );
      },
    );
  }
}
