import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_component/component/component_app_bar.dart';
import 'package:flutter_component/view_model/login_view_model.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginViewModel>(builder: (context, viewModel, widget) {
      return Scaffold(
        appBar: const ComponentAppBar(title: '登录'),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Divider(height: 100, color: Colors.white),
              const Image(image: AssetImage('assets/images/login_logo.png')),
              Container(
                  padding: const EdgeInsets.only(left: 40, right: 40, top: 40),
                  child: phoneTextField(context, viewModel)),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: codeTextField(context, viewModel))
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 40, right: 40, top: 40),
                width: double.infinity,
                child: loginButton(context, viewModel),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(22)),
              )
            ],
          ),
        ),
      );
    });
  }

  Widget phoneTextField(BuildContext context, LoginViewModel viewModel) {
    var themeData = Theme.of(context);
    var clear = viewModel.clearPhone;
    var clearButton = viewModel.showClear
        ? Positioned(
            child: IconButton(
              onPressed: clear,
              padding: const EdgeInsets.all(0),
              color: themeData.disabledColor,
              icon: const Icon(Icons.clear, size: 18.0),
            ),
            bottom: -6,
            right: -8)
        : Container();
    return Stack(children: [
      TextFormField(
        onChanged: (value) => viewModel.onPhoneChanged(value),
        controller: viewModel.phoneController,
        cursorColor: themeData.primaryColor,
        decoration: InputDecoration(
            alignLabelWithHint: true,
            label: const Text('手机号'),
            contentPadding: EdgeInsets.zero,
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: themeData.primaryColor),
            ),
            errorText: null),
      ),
      clearButton
    ]);
  }

  Widget codeTextField(BuildContext context, LoginViewModel viewModel) {
    var themeData = Theme.of(context);
    var onPress = viewModel.canGetCode
        ? () {
            viewModel.startTimer();
          }
        : null;
    var textColor =
        viewModel.canGetCode ? themeData.primaryColor : themeData.disabledColor;
    var verifyCodeBtn = Positioned(
        right: -16,
        bottom: -8,
        child: CupertinoButton(
            onPressed: onPress,
            child: Text(viewModel.getCodeText,
                style: TextStyle(color: textColor, fontSize: 12))));
    return Stack(
      children: [
        TextFormField(
          onChanged: (value) => viewModel.onCodeChanged(value),
          controller: viewModel.codeController,
          cursorColor: themeData.primaryColor,
          decoration: InputDecoration(
              alignLabelWithHint: true,
              label: const Padding(
                  padding: EdgeInsets.zero,
                  child: Text(
                    '验证码',
                    textAlign: TextAlign.end,
                  )),
              contentPadding: EdgeInsets.zero,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: themeData.primaryColor),
              ),
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              errorText: null),
        ),
        verifyCodeBtn
      ],
    );
  }

  Widget loginButton(BuildContext context, LoginViewModel viewModel) {
    var onPress = viewModel.loginBtnDisable ? null : () {};
    return ElevatedButton(
      onPressed: onPress,
      child: const Text('登 录', style: TextStyle(color: Colors.white)),
      style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
    );
  }
}
