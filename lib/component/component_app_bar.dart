import 'package:flutter/material.dart';

class ButtonItem {
  late void Function()? onTap;

  Widget? child;

  // String? title;
  //
  // Image? image;
  //
  // Icons? icon;

  // ButtonItem({this.title, this.image, this.onTap});

  ButtonItem({this.child});
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
  Size get preferredSize => const Size.fromHeight(44);
}

class _ComponentAppBarState extends State<ComponentAppBar> {
  Widget? leftButton() {
    // var child = widget.leftButtonItem?.image ??
    //     (widget.leftButtonItem?.title != null ? Text(widget.leftButtonItem!.title!) : null);
    if (widget.leftButtonItem?.child != null) {
      return ElevatedButton(
          onPressed: () {
            if (widget.leftButtonItem?.onTap != null) {
              widget.leftButtonItem?.onTap!();
            }
          },
          child: widget.leftButtonItem?.child);
    } else {
      return null;
    }
  }

  Widget? rightButton() {
    // var child = widget.rightButtonItem?.image ??
    //     (widget.rightButtonItem?.title != null ? Text(widget.rightButtonItem!.title!) : null);
    if (widget.rightButtonItem?.child != null) {
      return widget.rightButtonItem?.child;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    var titleLabel = (widget.title != null
        ? Expanded(
            child: Text(
            widget.title!,
            textAlign: TextAlign.center,
            style: Theme.of(context).appBarTheme.titleTextStyle,
          ))
        : Container());
    return SafeArea(
        child: Container(
      height: widget.preferredSize.height,
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black38, blurRadius: 10.0, offset: Offset(1.0, 4.0))
      ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            color: Theme.of(context).primaryColor,
            height: 44,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                    width: 60,
                    height: 30,
                    child: leftButton()),
                titleLabel,
                Container(
                    width: 60,
                    height: 30,
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    child: rightButton()),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
