import 'package:flutter/material.dart';
import 'package:flutter_component/component/component_app_bar.dart';

class MyHomePage extends StatefulWidget {

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ComponentAppBar(
        title: "Component AppBar",
        rightButtonItem: ButtonItem(child: const Icon(Icons.add, size: 30)),
      ),
    );
  }
}