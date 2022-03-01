import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class DataExp extends ChangeNotifier {

  List<String> data = ["flutter component appbar", "button", "Chart"];

  List<String> get items => data;

}