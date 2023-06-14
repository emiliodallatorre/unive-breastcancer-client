import 'package:flutter/material.dart';
import 'package:unive_breastcancer_client/interface/screen/home_screen.dart';
import 'package:unive_breastcancer_client/references.dart';

void main() {
  runApp(const BreastCancerClassifierClient());
}

class BreastCancerClassifierClient extends StatelessWidget {
  const BreastCancerClassifierClient({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: References.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: HomeScreen.route,
      routes: <String, Widget Function(BuildContext)>{
        HomeScreen.route: (BuildContext context) => HomeScreen(),
      },
    );
  }
}
