import 'package:app_c20785/firebase_options.dart';
import 'package:app_c20785/pages/auth/auth.dart';
import 'package:app_c20785/ui/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '20785C App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: theme.primary.colour),
        useMaterial3: true,
      ),
      home: const AuthPage(),
    );
  }
}
