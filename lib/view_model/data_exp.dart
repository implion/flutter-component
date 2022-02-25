import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class DataExp extends ChangeNotifier {

  List<int> data = [1, 2];

  List<int> get items => data;

}