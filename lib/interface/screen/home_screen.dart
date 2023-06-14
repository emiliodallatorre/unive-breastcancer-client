import 'package:flutter/material.dart';
import 'package:unive_breastcancer_client/references.dart';

class HomeScreen extends StatefulWidget {
  static const String route = "/homeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(References.appName)),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Column(

    );
  }
}
