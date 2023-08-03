import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

double tsfMin = 0.5;
double tsfMax = 1.5;

class AppSettings extends ChangeNotifier {
  ThemeMode _uiMode = ThemeMode.system;
  ThemeMode get uiMode => _uiMode;
  double _tsf = 1.0;
  double get tsf => _tsf;

  Future<void> updateTSF(double newTSF) async {
    assert(tsfMin <= tsf && tsf <= tsfMax);
    _tsf = newTSF;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setDouble("tsf", newTSF);
    notifyListeners();
  }

  Future<void> updateUiMode(ThemeMode newUiMode) async {
    _uiMode = newUiMode;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("uiMode", newUiMode.name);
    notifyListeners();
  }

  AppSettings({required ThemeMode uiMode, required double tsf}) {
    _uiMode = uiMode;
    _tsf = tsf;
  }
}

AppSettings defaultProvider(BuildContext context) => Provider.of<AppSettings>(context);