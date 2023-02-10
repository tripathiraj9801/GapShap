import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

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
            nextScreen: const MyHomePage(),
            splashTransition: SplashTransition.scaleTransition,
            backgroundColor: const Color.fromARGB(255, 255, 255, 255)));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GapShap"),
      ),
      body: const Center(child: Text("Shruti Vats Chutiya Hai")),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print("Yamete Kudasai"),
      ),
    );
  }
}
