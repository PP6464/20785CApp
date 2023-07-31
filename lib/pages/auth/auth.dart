import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10.0,
        title: const Row(
          children: [
            Text("20785C App"),
            Spacer(),
            CircleAvatar(
              foregroundImage: AssetImage("assets/logo-transparent.png"),
              backgroundColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
