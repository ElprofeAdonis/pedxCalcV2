import 'package:flutter/material.dart';

class LocaleController extends ChangeNotifier {
  Locale? _locale;

  Locale? get locale => _locale;

  void setLocale(Locale locale) {
    if (_locale == locale) return;
    _locale = locale;
    notifyListeners();
  }

  void clear() {
    _locale = null; // vuelve al idioma del sistema
    notifyListeners();
  }
}
