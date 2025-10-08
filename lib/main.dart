import 'package:flutter/material.dart';
import 'package:mi_app/screens/splash_screen.dart'; // Importa la nueva SplashScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pedx Calc',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue, // Puedes usar el azul de tu logo aquí
        primaryColor: const Color.fromARGB(255, 14, 113, 194), // Azul de tu logo
        hintColor: const Color(0xFF4CAF50), // Verde de acento (para Pedx)
        scaffoldBackgroundColor: const Color(0xFFF8F8F8),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 14, 113, 194), // Azul de tu logo para AppBar
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF333333),
          ),
          headlineMedium: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ), // Texto blanco en AppBar
          bodyLarge: TextStyle(fontSize: 14.0, color: Color(0xFF333333)),
          bodyMedium: TextStyle(fontSize: 14.0, color: Color(0xFF757575)),
        ),
        cardTheme: CardThemeData(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      home:
          const SplashScreen(), // Ahora la primera pantalla es la Splash Screen
    );
  }
}