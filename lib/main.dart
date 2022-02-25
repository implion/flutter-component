import 'package:flutter/material.dart';
import 'package:flutter_component/appearce/app_theme.dart';
import 'package:flutter_component/pages/list_exp_page.dart';
import 'package:flutter_component/view_model/data_exp.dart';
import 'package:provider/provider.dart';
import 'home.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(
    MultiProvider(providers: [
      Provider<DataExp>(create: (_) => DataExp())
    ],
    child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: ListExpPage(),
      theme: ThemeManager.light,
    );
  }
}


