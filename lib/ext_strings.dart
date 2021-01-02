import 'package:flutter/material.dart';
import 'package:localization/app_localizations.dart';

extension Translation on String {
  String translate(BuildContext context) =>
      AppLocalizations.of(context).translate(this) ?? this;
}
