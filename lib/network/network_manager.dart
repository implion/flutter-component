import 'dart:html';
import 'dart:io';
import 'package:rxdart/rxdart.dart';
import 'package:dio/dio.dart';

const url = 'http://github.com';


class NetworkManager {
  static final NetworkManager instance = NetworkManager._internal();

  late Dio dio;

  NetworkManager._internal() {
    BaseOptions opts = BaseOptions()..connectTimeout = 60
    ..contentType = 'ContentType.json';
    dio = Dio();
    // dio.interceptors.map((element) => element.)
  }

  Stream<T> post<T>() {
    return dio.post(url)
        .asStream()
        .asBroadcastStream()
        .map((resp) => resp.data as T);

  }
}