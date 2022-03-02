import 'dart:async';

import 'package:flutter/cupertino.dart';

class LoginViewModel extends ChangeNotifier {
  String _phoneNum = '';
  final String _pwd = '';
  String _code = '';
  bool timerIdle = true;
  Timer? timer;
  int count = 5;
  String _getCodeText = '获取验证码';

  bool get loginBtnDisable => !verifyPhone(_phoneNum) ||_code.isEmpty;
  bool get isPhone => verifyPhone(_phoneNum);
  bool get canGetCode => verifyPhone(_phoneNum) && timerIdle;

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  String get phoneNum => _phoneNum;
  String get pwd => _pwd;
  String get code => _code;
  TextEditingController get phoneController => _phoneController;
  TextEditingController get codeController => _codeController;
  bool get showClear => _phoneNum.isNotEmpty;
  String get getCodeText => _getCodeText;

  LoginViewModel();

  void startTimer() {
    if (timer != null) {
      timer?.cancel();
      timer = null;
    }
    timerIdle = false;
    _getCodeText = '${count}s后可再次获取';
    notifyListeners();
    const period = Duration(seconds: 1);
    timer = Timer.periodic(period, (t) {
      if (count == 1) {
        timer?.cancel();
        timer = null;
        timerIdle = true;
        _getCodeText = '获取验证码';
        count = 5;
      } else {
        count--;
        _getCodeText = '${count}s后可再次获取';
      }
      notifyListeners();
    });
  }


  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
    timer = null;
  }

  bool verifyPhone(String? text) {
    if (text == null || text.isEmpty) {
      return false; //"请输入正确的手机号";
    }
    final v = text.trim();
    final RegExp phoneExp = RegExp(r'^1[3-9]\d{9}$');
    if (!phoneExp.hasMatch(v)) {
      return false; //"请输入正确的手机号";
    }
    return true;
  }

  void onPhoneChanged(String text) {
    _phoneNum = text;
    notifyListeners();
  }

  void clearPhone() {
    _phoneNum = '';
    _phoneController.clear();
    notifyListeners();
  }

  void onCodeChanged(String text) {
    _code = text;
  }

}