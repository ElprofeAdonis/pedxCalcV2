import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mi_app/screens/instrucciones_screen_with_terms.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  static const Color _blue = Color.fromARGB(255, 14, 113, 194);

  late Timer _typingTimer;
  late AnimationController _fadeController;

  final String _fullText = 'PEDx Calc';
  String _visibleText = '';

  bool _showLogo = false;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _startTypingEffect();

    Future.delayed(const Duration(seconds: 4), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const InstruccionesScreenWithTerms()),
      );
    });
  }

  void _startTypingEffect() {
    int index = 0;
    _typingTimer = Timer.periodic(const Duration(milliseconds: 140), (timer) {
      if (index < _fullText.length) {
        setState(() {
          _visibleText += _fullText[index];
          index++;
        });
      } else {
        timer.cancel();
        _fadeController.forward();
        setState(() => _showLogo = true);
      }
    });
  }

  @override
  void dispose() {
    _typingTimer.cancel();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      // ✅ IMPORTANTE: usamos AnimatedContainer para que el cambio azul -> blanco
      // sea suave y no se note como “pantalla extra”.
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        color: _showLogo ? scheme.surface : _blue,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          child: _showLogo ? _buildLogoStage() : _buildTypingStage(),
        ),
      ),
    );
  }

  /// 🔹 ETAPA 1 — TEXTO
  Widget _buildTypingStage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _visibleText,
            style: const TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Pediatric Emergency Calculator',
            style: TextStyle(fontSize: 14, color: Colors.white70),
          ),
        ],
      ),
    );
  }

  /// 🔹 ETAPA 2 — LOGO + MARCA
  Widget _buildLogoStage() {
    return SafeArea(
      child: Stack(
        children: [
          // Centro: Logo + Loader
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FadeTransition(
                  opacity: _fadeController,
                  child: Image.asset('assets/images/pedx.png', width: 180),
                ),
                const SizedBox(height: 20),
                const CircularProgressIndicator(),
              ],
            ),
          ),

          // Abajo: marca centrada
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 18),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    'from',
                    style: TextStyle(fontSize: 12, color: Colors.black45),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'A.P.D. Software Solutions',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
