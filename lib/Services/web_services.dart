import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';

//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'toastService.dart';
import 'package:easy_localization/easy_localization.dart';

class WebService {
  factory WebService() {
    if (_this == null) _this = WebService._();
    return _this!;
  }

  static WebService? _this;
  final String _baseURL = "http://206.189.239.57/"; //production: not yet
  //stg:http://206.189.239.57/
  final String _giftRayBaseURL="";
  late Dio freeDio;
  late Dio tokenDio;
  String storageKeyClientToken = "access_token";
  String? myToken;
  String? lang;
  String? deviceId;
  String? platform;
  String? fcmToken;

  WebService._() {
    freeDio = Dio();
    freeDio.options.baseUrl = _baseURL;

    tokenDio = Dio();
    tokenDio.options.baseUrl = _baseURL;
    initializeInterceptors();
  }

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  void changeLanguage(String language) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString("lang", language);
    lang = language;
  }

  Future<String?> getCurrentLang() async {
    final SharedPreferences prefs = await _prefs;
    lang = prefs.getString('lang');
    return prefs.getString('lang');
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await _prefs;

    return prefs.getString(storageKeyClientToken);
  }
  /// ----------------------------------------------------------
  /// Method that saves the token in Shared Preferences
  /// ----------------------------------------------------------

  Future<bool> setToken(String token) async {
    myToken = token;

    final SharedPreferences prefs = await _prefs;

    return prefs.setString(storageKeyClientToken, token);
  }

  /// ----------------------------------------------------------
  /// initialize tokens
  /// ----------------------------------------------------------

  Future<void> initializeToken() async {
    myToken = await getToken();
    //initFCMToken();
    return;
  }

  /*Future<void> initFCMToken() async {
    try {
      FirebaseMessaging messaging = FirebaseMessaging.instance;
      fcmToken = await messaging.getToken();
    } catch (errror) {
      fcmToken = null;
    }
    print(fcmToken);
    return;
  }*/

  initializeInterceptors() {
    tokenDio.interceptors.clear();
    freeDio.interceptors.clear();
    freeDio.options.headers = {
      "content-type": "application/json",
      "Accept": "*/*",
      "Accept-Encoding": "gzip, deflate, br",
      "Connection": "keep-alive",
      //  "Accept": "application/json",
      /* "Access-Control-Expose-Headers": "Content-Length, X-JSON,Content-Type,Cache-Control",
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "Access-Control-Allow-Credentials": true, // Required for cookies, authorization headers with HTTPS
      "Access-Control-Allow-Headers": "Origin, X-Requested-With",
      "Accept": "application/json",
     */
      "Content-Type": "application/json",
      //"Access-Control-Allow-Methods": "POST,GET, OPTIONS, DELETE, PUT",
    };
    tokenDio.options.headers = {
      "content-type": "application/json",
      "Accept": "*/*",
      "Accept-Encoding": "gzip, deflate, br",
      "Connection": "keep-alive",
      //  "Accept": "application/json",
      /* "Access-Control-Expose-Headers": "Content-Length, X-JSON,Content-Type,Cache-Control",
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "Access-Control-Allow-Credentials": true, // Required for cookies, authorization headers with HTTPS
      "Access-Control-Allow-Headers": "Origin, X-Requested-With",
      "Accept": "application/json",
     */
      "Content-Type": "application/json",
      //"Access-Control-Allow-Methods": "POST,GET, OPTIONS, DELETE, PUT",
    };
    tokenDio.interceptors.clear();
    freeDio.interceptors.clear();
    freeDio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          print('send request ${options.uri}');
          print('headers: ${options.headers}');
          print('query parameters: ${options.queryParameters}');
          print('data: ${options.data}');
          print(
              'authorization header: ${options.headers[HttpHeaders.authorizationHeader]}');
          return handler.next(options); //continue
        },
        onResponse: (response, handler) async {
          // Do something with response data
          print(response.data);
          return handler.next(response); // continue
        },
        onError: (DioError e, handler) async {
          print('path: ${e.requestOptions.path}');
          print('response: ${e.response}');
          print('statusCode: ${e.response?.statusCode}');
          print('data: ${e.response?.data}');
          EasyLoading.dismiss();

          if (e.response != null) {
            if (e.response!.statusCode == 401 ||
                e.response!.statusCode == 403) {
              if (e.requestOptions.path == "api/login")
                ToastService.showErrorToast(e.response?.data['message']);
              return handler.next(e);
            } else if (e.requestOptions.path == "api/login") {
              print("here");
              return handler.next(e);
            } else {
              ToastService.showUnExpectedErrorToast();
              ToastService.showErrorToast(e.response!.data['errors']
                  .toString()
                  .replaceAll('[', ' ')
                  .replaceAll(']', ' ')
                  .replaceAll('{', ' ')
                  .replaceAll('}', ' '));
            }
          } else {
            ToastService.showErrorToast(
              "no internet connection",
            );
          }
        },
      ),
    );
    tokenDio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.headers['Authorization'] = "Bearer " + myToken!;
          options.responseType = ResponseType.json;
        //  options.headers.addAll({'locale': this.lang});
          print('send request ${options.uri}');
          print('headers: ${options.headers}');
          print('query parameters: ${options.queryParameters}');
          return handler.next(options); //continue
        },
        onResponse: (response, handler) async {
          await EasyLoading.dismiss();
          // Do something with response data
          print(response.data);
          return handler.next(response); // continue
        },
        onError: (DioError e, handler) async {
          EasyLoading.dismiss();
          print('path: ${e.requestOptions.path}');
          print('response: ${e.response}');
          print('statusCode: ${e.response?.statusCode}');
          print('data: ${e.response?.data}');

          if (e.response != null) {
            if (e.response!.statusCode == 401) {
              EasyLoading.dismiss();
              //refresh token api call
              return handler.next(e);
            } else if (e.response!.statusCode == 413) {
              EasyLoading.dismiss();
              ToastService.showErrorToast('Image size too large');
            } else if (e.response?.statusCode == 422) {
              ToastService.showErrorToast(
                  e.response!.data['message'].toString());
            } else {
              EasyLoading.dismiss();
              print("unExpected");
              ToastService.showUnExpectedErrorToast();
            }
          } else {
            EasyLoading.dismiss();

            print("No Connection");
            ToastService.showErrorToast("no internet connection");
          }
        },
      ),
    );
  }
}
