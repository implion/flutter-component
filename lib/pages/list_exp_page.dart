import 'package:flutter/material.dart';
import 'package:flutter_component/component/component_app_bar.dart';
import 'package:flutter_component/view_model/data_exp.dart';
import 'package:provider/provider.dart';

class ListExpPage extends StatelessWidget {
  Widget itemBuilder(BuildContext context, int index, int item) {
    return ListTile(title: Text(item.toString()));
  }

  Widget buildList(BuildContext context) {
    return Consumer<DataExp>(
        builder: (innerContext, data, _) => ListView.builder(
            itemBuilder: (itemContext, index) => itemBuilder(
                itemContext, index, data.items[index]),
            itemCount: data.items.length));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: const ComponentAppBar(title: 'flutter_component'),
      body: buildList(context),
    );
  }
}
