import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Gapshap',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AnimatedSplashScreen(
            duration: 2000,
            splash: Image.asset('assets/images/Gapshap.png'),
            nextScreen: const LoginView(),
            splashTransition: SplashTransition.scaleTransition,
            backgroundColor: const Color.fromARGB(255, 255, 255, 255)));
  }
}

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GapShap"),
      ),
      body: FutureBuilder(
        future: Firebase.initializeApp(
          //options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return Column(
                children: [
                  TextField(
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    controller: _email,
                    decoration: const InputDecoration(hintText: "Email>>"),
                  ),
                  TextField(
                    obscureText: true,
                    autocorrect: false,
                    controller: _password,
                    decoration: const InputDecoration(hintText: "Password>>"),
                  ),
                  TextButton(
                    onPressed: () async {
                      Firebase.initializeApp(
                       // options: DefaultFirebaseOptions.currentPlatform,
                      );
                      final email = _email.text;
                      final password = _password.text;

                      final userCredential = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: email, password: password);

                      print(userCredential);
                    },
                    child: const Text("Register"),
                  ),
                ],
              );

            default:
              return const Text("Loding...");
          }
        },
      ),
    );
  }
}
