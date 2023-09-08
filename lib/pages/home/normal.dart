import 'package:flutter/material.dart';

class NormalHomePage extends StatefulWidget {
  const NormalHomePage({super.key});

  @override
  State<NormalHomePage> createState() => _NormalHomePageState();
}

class _NormalHomePageState extends State<NormalHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Normal Home Page"),
    );
  }
}
