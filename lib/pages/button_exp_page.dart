import 'package:flutter/material.dart';
import 'package:flutter_component/component/component_app_bar.dart';
import 'package:flutter/cupertino.dart';

class ButtonExpPage extends StatelessWidget {

  const ButtonExpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: const ComponentAppBar(
          title: 'Button'
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('text button'),
                TextButton(onPressed: () {  },
                    child: const Text('text button'))
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('Elevated button'),
                ElevatedButton(onPressed: () {  },
                    child: const Text('Elevated button'))
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('icon button'),
                IconButton(onPressed: () {  },
                    icon: const Icon(Icons.account_balance_rounded),)
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('cupertion button'),
                CupertinoButton(onPressed: () {  },
                  child: const Text('cupertion button'))
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('BackButton button'),
                BackButton(onPressed: () { })
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('CloseButton button'),
                  CloseButton(onPressed: () { })
              ],
            )
          ],
        ),
      ),
    );
  }

}