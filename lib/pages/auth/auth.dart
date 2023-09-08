// ignore_for_file: use_build_context_synchronously

import 'package:app_c20785/apis/firebase.dart';
import 'package:app_c20785/pages/home/admin.dart';
import 'package:app_c20785/pages/home/normal.dart';
import 'package:app_c20785/provider/provider.dart';
import 'package:app_c20785/ui/theme.dart';
import 'package:app_c20785/ui/widgets.dart';
import 'package:app_c20785/util/regex.dart';
import 'package:app_c20785/util/values.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  int index = 0;
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  TextEditingController loginTeamNumber = TextEditingController();
  TextEditingController loginPassword = TextEditingController();
  bool obscureLoginPassword = true;
  GlobalKey<FormState> signUpKey = GlobalKey<FormState>();
  TextEditingController signUpTeamNumber = TextEditingController();
  TextEditingController signUpPassword = TextEditingController();
  bool obscureSignUpPassword = true;

  @override
  void dispose() {
    super.dispose();
    loginTeamNumber.clear();
    loginTeamNumber.dispose();
    loginPassword.clear();
    loginPassword.dispose();
    signUpTeamNumber.clear();
    signUpTeamNumber.dispose();
    signUpTeamNumber.clear();
    signUpPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      Center(
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 500.0,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: Form(
                key: loginKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    logo(radius: 90.0, padding: 16.0, border: 5.0),
                    Text(
                      "Login",
                      textScaleFactor: defaultProvider(context).tsf,
                      style: const TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    TextFormField(
                      controller: loginTeamNumber,
                      validator: (String? teamNumber) {
                        if (teamNumber == null || teamNumber.isEmpty) return "Team number is required";
                        if (!teamNumberRegex.hasMatch(teamNumber)) return "Team number format is invalid";
                        return null;
                      },
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(Icons.numbers),
                        label: Text(
                          "Enter your team number",
                          textScaleFactor: defaultProvider(context).tsf,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    TextFormField(
                      controller: loginPassword,
                      obscureText: obscureLoginPassword,
                      validator: (String? password) {
                        if (password == null || password.isEmpty) return "Password is required";
                        if (password.length < 10) return "Password must be at least 10 characters long";
                        return null;
                      },
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(Icons.lock),
                        label: Text(
                          "Enter your password",
                          textScaleFactor: defaultProvider(context).tsf,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscureLoginPassword = !obscureLoginPassword;
                            });
                          },
                          icon: !obscureLoginPassword ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                          tooltip: !obscureLoginPassword ? "Hide password" : "Show password",
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    ElevatedButton(
                      onPressed: () async {
                        if (!loginKey.currentState!.validate()) return;
                        http.Response res = await http.post(Uri.parse("$apiUrl/auth/login"), headers: jsonContentHeader, body: {
                          "teamNumber": loginTeamNumber.text,
                          "password": loginPassword.text,
                        });
                        if (res.statusCode.toString().substring(0, 1) == "2") {
                          try {
                            await auth.signInWithCustomToken(res.body);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => loginTeamNumber.text == "20785C" ? const AdminHomePage() : const NormalHomePage(),
                              ),
                            );
                          } on FirebaseException catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  e.message!,
                                  textScaleFactor: defaultProvider(context).tsf,
                                ),
                              ),
                            );
                          }
                        } else if (res.statusCode.toString().substring(0, 1) == "4") {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                res.body,
                                textScaleFactor: defaultProvider(context).tsf,
                              ),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.primary.colour,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Login",
                          textScaleFactor: defaultProvider(context).tsf,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      Center(
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 500.0,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: Form(
                key: signUpKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    logo(radius: 90.0, padding: 16.0, border: 5.0),
                    Text(
                      "Sign Up",
                      textScaleFactor: defaultProvider(context).tsf,
                      style: const TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    TextFormField(
                      controller: signUpTeamNumber,
                      validator: (String? teamNumber) {
                        if (teamNumber == null || teamNumber.isEmpty) return "Team number is required";
                        if (!teamNumberRegex.hasMatch(teamNumber)) return "Team number format is invalid";
                        return null;
                      },
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(Icons.numbers),
                        label: Text(
                          "Enter your team number",
                          textScaleFactor: defaultProvider(context).tsf,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    TextFormField(
                      controller: signUpPassword,
                      obscureText: obscureSignUpPassword,
                      validator: (String? password) {
                        if (password == null || password.isEmpty) return "Password is required";
                        if (password.length < 10) return "Password must be at least 10 characters long";
                        return null;
                      },
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(Icons.lock),
                        label: Text(
                          "Enter your password",
                          textScaleFactor: defaultProvider(context).tsf,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscureSignUpPassword = !obscureSignUpPassword;
                            });
                          },
                          icon: !obscureSignUpPassword ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                          tooltip: !obscureSignUpPassword ? "Hide password" : "Show password",
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    ElevatedButton(
                      onPressed: () async {
                        http.Response res = await http.put(
                          Uri.parse("$apiUrl/auth/signup"),
                          headers: {
                            "Content-Type": "application/json",
                          },
                          body: {
                            "teamNumber": signUpTeamNumber.text,
                            "password": signUpPassword.text,
                          },
                        );
                        if (res.statusCode.toString().substring(0, 1) == "2") {
                          try {
                            await auth.signInWithCustomToken(res.body);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => signUpTeamNumber.text == "20785C" ? const AdminHomePage() : const NormalHomePage(),
                              ),
                            );
                          } on FirebaseException catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  e.message!,
                                  textScaleFactor: defaultProvider(context).tsf,
                                ),
                              ),
                            );
                          }
                        } else if (res.statusCode.toString().substring(0, 1) == "4") {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                res.body,
                                textScaleFactor: defaultProvider(context).tsf,
                              ),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.primary.colour,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Sign Up",
                          textScaleFactor: defaultProvider(context).tsf,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ];
    return DefaultTabController(
      length: pages.length,
      initialIndex: index,
      child: Scaffold(
        appBar: AppBar(
          elevation: 10.0,
          title: Row(
            children: [
              Text(
                "20785C App",
                textScaleFactor: defaultProvider(context).tsf,
              ),
              const Spacer(),
              logo(),
            ],
          ),
          bottom: TabBar(
            indicatorColor: Theme.of(context).colorScheme.brightness == Brightness.dark ? theme.primary.colour : theme.secondary.colour,
            onTap: (index) {
              setState(() {
                this.index = index;
              });
            },
            tabs: [
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.person),
                    const SizedBox(width: 8.0),
                    Text(
                      "Login",
                      textScaleFactor: defaultProvider(context).tsf,
                    ),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.person_add),
                    const SizedBox(width: 8.0),
                    Text(
                      "Sign Up",
                      textScaleFactor: defaultProvider(context).tsf,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: pages,
        ),
      ),
    );
  }
}
