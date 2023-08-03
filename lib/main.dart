import 'package:app_c20785/apis/firebase.dart';
import 'package:app_c20785/firebase_options.dart';
import 'package:app_c20785/pages/auth/auth.dart';
import 'package:app_c20785/provider/provider.dart';
import 'package:app_c20785/ui/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await auth.signOut();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  ThemeMode uiMode = ThemeMode.values.where((e) => e.name == (preferences.getString("uiMode") ?? "system")).single;
  double tsf = preferences.getDouble("tsf") ?? 1.0;
  runApp(
    ChangeNotifierProvider<AppSettings>(
      create: (_) => AppSettings(uiMode: uiMode, tsf: tsf),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppSettings>(
      builder: (context, appSettings, child) => MaterialApp(
        title: '20785C App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: theme.primary.colour,
            primary: theme.primary.colour,
            brightness: Brightness.light,
          ),
          fontFamily: "Roboto Mono",
        ),
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: theme.darkAppBar.colour,
            primary: theme.primary.colour,
            brightness: Brightness.dark,
            background: theme.darkSurface.colour,
            surface: theme.darkSurface.colour,
          ),
          fontFamily: "Roboto Mono",
          scaffoldBackgroundColor: theme.darkSurface.colour,
        ),
        themeMode: appSettings.uiMode,
        home: const AuthPage(),
      ),
    );
  }
}
