import 'package:flutter/material.dart';
import 'package:flutter_component/component/component_app_bar.dart';
import 'package:flutter_component/pages/button_exp_page.dart';
import 'package:flutter_component/pages/chart_exp_page.dart';
import 'package:flutter_component/pages/dialog_exp_page.dart';
import 'package:flutter_component/pages/list_exp_page.dart';
import 'package:flutter_component/pages/login_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var pages = <Widget>[
      const ListExpPage(),
      const LoginPage(),
      ChartExpPage(),
      const ButtonExpPage(),
      const DialogExpPage()
    ];

    var tabBarItems = <Widget>[
      IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            setState(() {
              currentIndex = 0;
            });
          }),
      IconButton(
          icon: const Icon(Icons.seven_mp),
          onPressed: () {
            setState(() {
              currentIndex = 1;
            });
          }),
      const SizedBox(),
      IconButton(
          icon: const Icon(Icons.business),
          onPressed: () {
            setState(() {
              currentIndex = 2;
            });
          }),
      IconButton(
          icon: const Icon(Icons.account_balance),
          onPressed: () {
            setState(() {
              currentIndex = 3;
            });
          }),
    ];

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: tabBarItems,
        ),
      ),
      body: pages[currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          setState(() {
            currentIndex = 4;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
