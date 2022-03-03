import 'package:flutter/material.dart';
import 'package:flutter_component/appearance/app_theme.dart';
import 'package:flutter_component/home.dart';
import 'package:flutter_component/pages/list_exp_page.dart';
import 'package:flutter_component/view_model/data_exp.dart';
import 'package:flutter_component/view_model/login_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  final previousCheck = Provider.debugCheckInvalidValueType;
  Provider.debugCheckInvalidValueType = <T>(T value) {
    if (value is DataExp) return;
    if (value is LoginViewModel) return;
    previousCheck!<T>(value);
  };
  runApp(
    MultiProvider(providers: [
      Provider<DataExp>(create: (_) => DataExp()),
      ChangeNotifierProvider<LoginViewModel>(create: (_) => LoginViewModel())
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
      home: const MyHomePage(title: 'home'),
      theme: ThemeManager.light,
    );
  }
}


