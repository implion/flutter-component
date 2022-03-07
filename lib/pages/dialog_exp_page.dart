import 'package:flutter/material.dart';
import 'package:flutter_component/component/component_app_bar.dart';

class DialogExpPage extends StatelessWidget {
  const DialogExpPage({Key? key}) : super(key: key);

  Widget alertDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('提示'),
      content: const Text('你确定要删除该文件吗'),
      actions: [
        TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('取消')),
        TextButton(
            onPressed: () => {
                  // 删除。。。
                  Navigator.of(context).pop()
                },
            child: const Text('确定'))
      ],
    );
  }

  Widget animationDialog(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return AlertDialog(
      title: const Text("提示"),
      content: const Text("您确定要删除当前文件吗?"),
      actions: <Widget>[
        TextButton(
          child: const Text("取消"),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
          child: const Text("删除"),
          onPressed: () {
            // 执行删除操作
            Navigator.of(context).pop(true);
          },
        ),
      ],
    );
  }

  Widget _buildMaterialDialogTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return ScaleTransition(
      scale: CurvedAnimation(parent: animation, curve: Curves.easeOut),
      child: child,
    );
  }

  Future<int?> showModalSheet(BuildContext context) {
    return showModalBottomSheet<int>(
        context: context,
        builder: (BuildContext context) {
          return ListView.builder(
              itemBuilder: (BuildContext context, int index) =>
                  ListTile(title: Text('${index}')),
              itemCount: 30);
        });
  }

  showLoadingDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return UnconstrainedBox(
            child: SizedBox(
              width: 240,
              child: AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      CircularProgressIndicator(),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text('正在加载...'),
                      ),
                    ],
                  )),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ComponentAppBar(
        title: 'dialog',
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return alertDialog(context);
                      });
                },
                child: const Text('alertDialog')),
            ElevatedButton(
                onPressed: () {
                  showGeneralDialog(
                      context: context,
                      pageBuilder: animationDialog,
                      barrierDismissible: true,
                      barrierLabel: MaterialLocalizations.of(context)
                          .modalBarrierDismissLabel,
                      barrierColor: Colors.black26,
                      transitionDuration: const Duration(milliseconds: 200),
                      transitionBuilder: _buildMaterialDialogTransitions);
                },
                child: const Text('animation Dialog')),
            ElevatedButton(
                onPressed: () {
                  showModalSheet(context);
                },
                child: const Text('bottom modal Dialog')),
            ElevatedButton(
                onPressed: () {
                  showLoadingDialog(context);
                },
                child: const Text('bottom modal Dialog')),
          ],
        ),
      ),
    );
  }
}
