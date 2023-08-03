import 'package:app_c20785/provider/provider.dart';
import 'package:app_c20785/ui/theme.dart';
import 'package:app_c20785/ui/widgets.dart';
import 'package:flutter/material.dart';

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
                      onPressed: () async {},
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
                      onPressed: () async {},
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
