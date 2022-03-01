import 'package:flutter/material.dart';
import 'package:flutter_component/appearance/app_theme.dart';
import 'package:flutter_component/pages/list_exp_page.dart';
import 'package:flutter_component/view_model/data_exp.dart';
import 'package:provider/provider.dart';

void main() {
  final previousCheck = Provider.debugCheckInvalidValueType;
  Provider.debugCheckInvalidValueType = <T>(T value) {
    if (value is DataExp) return;
    previousCheck!<T>(value);
  };
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
      home: const ListExpPage(),
      theme: ThemeManager.light,
    );
  }
}


