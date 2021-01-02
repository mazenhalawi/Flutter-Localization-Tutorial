import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Step 5: Create AppLocalizations to handle custom localization in the app
class AppLocalizations {
  // Step A: Add locale property for the class
  final Locale locale;
  static const delegate = const _AppLocalizations();

  // Step B: Add constructor to initialize the locale
  AppLocalizations(this.locale);

  // Step C: Supply the _localization map that holds all the translation for the
  // locale which will be populated using the load() function below
  Map<String, String> _localizations;

  // Step D: Create the load function that will load the translation from the
  // respective json file into the _localizations Map<String, String> above.
  Future<void> load() async {
    final jsonString =
        await rootBundle.loadString('lang/${locale.languageCode}.json');
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizations =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));
  }

  // Step E: Create a function that will translate the text by searching the _localizations
  // map above.
  String translate(String key) => _localizations[key];

  // Step F: Create an inherited-widget-type-like helper function to use in the app
  // for the string values that need to be translated. For example:
  // Text(AppLocalizations.of(context).translate('Hello World'));
  static AppLocalizations of(context) =>
      Localizations.of(context, AppLocalizations);
}

// Step 6: Create the LocalizationsDelegate which will present the delegate used in MaterialApp AppLocalizations.Delegate
class _AppLocalizations extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizations();

  // Step A: Implement first override method to check if locale is supported.
  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  // Step B: Implement second override method to load and return custom AppLocalizations above
  @override
  Future<AppLocalizations> load(Locale locale) async {
    final AppLocalizations _appLocalizations = AppLocalizations(locale);
    await _appLocalizations.load();
    return _appLocalizations;
  }

  // Step C: Always return False.
  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
      false;
}
