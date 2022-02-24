import 'package:flutter/material.dart';

class ButtonItem {
  late void Function()? onTap;

  String? title;

  Image? image;

  ButtonItem({this.title, this.image, this.onTap});
}

class ComponentAppBar extends StatefulWidget with PreferredSizeWidget {
  final String? title;

  final ButtonItem? leftButtonItem;

  final ButtonItem? rightButtonItem;

  const ComponentAppBar(
      {Key? key, this.title, this.leftButtonItem, this.rightButtonItem})
      : super(key: key);

  @override
  State<ComponentAppBar> createState() => _ComponentAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(128);
}

class _ComponentAppBarState extends State<ComponentAppBar> {
  Widget? leftButton() {
    var child = widget.leftButtonItem?.image ??
        (widget.leftButtonItem?.title != null ? Text(widget.leftButtonItem!.title!) : null);
    return ElevatedButton(
        onPressed: () {
          widget.leftButtonItem?.onTap();
        },
        child: child);
  }

  Widget? rightButton() {
    var child = widget.rightButtonItem?.image ??
        (widget.rightButtonItem?.title != null ? Text(widget.rightButtonItem!.title!) : null);
    return ElevatedButton(
        onPressed: () {
          widget.rightButtonItem?.onTap();
        },
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    var titleLabel =
        (widget.title != null ? Expanded(child: Text(widget.title!), flex: 1) : Container());
    return Column(
      children: <Widget>[
        Expanded(child: Container(), flex: 1),
        SizedBox(
          height: 44,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: leftButton()),
              titleLabel,
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: leftButton()),
            ],
          ),
        )
      ],
    );
  }
}
