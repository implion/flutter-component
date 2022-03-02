import 'package:flutter/material.dart';
import 'package:flutter_component/component/component_app_bar.dart';
import 'package:flutter_component/pages/button_exp_page.dart';
import 'package:flutter_component/pages/chart_exp_page.dart';
import 'package:flutter_component/pages/login_page.dart';
import 'package:flutter_component/view_model/data_exp.dart';
import 'package:provider/provider.dart';

class ListExpPage extends StatelessWidget {
  const ListExpPage({Key? key}) : super(key: key);

  void pushNextPage(int index, BuildContext context) {
    Widget? page;
    switch (index) {
      case 1:
        page = const ButtonExpPage();
        break;
      case 2:
        page = ChartExpPage();
        break;
      case 3:
        page = const LoginPage();
        break;
    }

    if (page != null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => page!));
    }
  }

  Widget itemBuilder(BuildContext context, int index, String item) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
      width: double.infinity,
      child: InkWell(
        hoverColor: Theme.of(context).primaryColor.withOpacity(0.6),
        highlightColor: Theme.of(context).primaryColor,
        focusColor: Theme.of(context).primaryColor,
        child: SizedBox(
            width: double.infinity,
            height: 44,
            child: Center(child: Text(item, textAlign: TextAlign.center))),
        onTap: () {
          pushNextPage(index, context);
        },
        borderRadius: BorderRadius.circular(8),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  Widget buildList(BuildContext context) {
    return Consumer<DataExp>(
        builder: (innerContext, data, _) => ListView.builder(
            itemBuilder: (itemContext, index) =>
                itemBuilder(itemContext, index, data.items[index]),
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
