
import 'package:flutter/material.dart';
import 'package:note_app/theme/theme.dart';

class ThemeProvider extends ChangeNotifier {
  final ThemeData _themeData = lightMode;
  ThemeData get themeData => _themeData;
}