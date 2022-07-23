import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

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
  final String _giftRayBaseURL = "";
  late Dio freeDio;
  late Dio tokenDio;
  String storageKeyToken = "access_token";
  String storageRefreshKeyToken = "refresh_token";
  String? myToken;
  String? refreshToken;
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
    myToken=prefs.getString(storageKeyToken);
    getRefreshToken();
    return prefs.getString(storageKeyToken);
  }

  Future<String?> getRefreshToken() async {
    final SharedPreferences prefs = await _prefs;
    refreshToken=prefs.getString(storageRefreshKeyToken);
    return prefs.getString(storageRefreshKeyToken);
  }

  Future<void> refreshTokens() {
    return tokenDio.post('dj-rest-auth/token/refresh/').then((value) {
      setRefreshToken('token');
      setToken('token');
    });
  }

  /// ----------------------------------------------------------
  /// Method that saves the token in Shared Preferences
  /// ----------------------------------------------------------

  Future<bool> setToken(String token) async {
    myToken = token;

    final SharedPreferences prefs = await _prefs;

    return prefs.setString(storageKeyToken, token);
  }

  Future<bool> setRefreshToken(String token) async {
    refreshToken = token;

    final SharedPreferences prefs = await _prefs;

    return prefs.setString(storageRefreshKeyToken, token);
  }

  /*Future<void> initFCMToken() async {
    try {
      FirebaseMessaging messaging = FirebaseMessaging.instance;
      fcmToken = await messaging.getToken();
    } catch (errror) {
      fcmToken = null;
    }
    debugPrint(fcmToken);
    return;
  }*/

  initializeInterceptors() {
    tokenDio.interceptors.clear();
    freeDio.interceptors.clear();
    //from postman headers section
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
    //from postman headers section
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
          debugPrint('send request ${options.uri}');
          debugPrint('headers: ${options.headers}');
          debugPrint('query parameters: ${options.queryParameters}');
          debugPrint('data: ${options.data}');
          debugPrint(
              'authorization header: ${options.headers[HttpHeaders.authorizationHeader]}');
          return handler.next(options); //continue
        },
        onResponse: (response, handler) async {
          // Do something with response data
          debugPrint(response.data.toString());
          return handler.next(response); // continue
        },
        onError: (DioError e, handler) async {
          debugPrint('path: ${e.requestOptions.path}');
          debugPrint('response: ${e.response}');
          debugPrint('statusCode: ${e.response?.statusCode}');
          debugPrint('data: ${e.response?.data}');
          EasyLoading.dismiss();

          if (e.response != null) {
            if(e.response!.data['non_field_errors']!=null)
              ToastService.showErrorToast(e.response!.data['non_field_errors']
                  .toString()
                  .replaceAll('[', ' ')
                  .replaceAll(']', ' ')
                  .replaceAll('{', ' ')
                  .replaceAll('}', ' '));
            else ToastService.showUnExpectedErrorToast();
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
          debugPrint('send request ${options.uri}');
          debugPrint('headers: ${options.headers}');
          debugPrint('query parameters: ${options.queryParameters}');
          return handler.next(options); //continue
        },
        onResponse: (response, handler) async {
          await EasyLoading.dismiss();
          //response returned done
          // Do something with response data
          debugPrint(response.data.toString());
          return handler.next(response); // continue
        },
        onError: (DioError e, handler) async {
          //response returned error
          EasyLoading.dismiss();
          debugPrint('path: ${e.requestOptions.path}');
          debugPrint('response: ${e.response}');
          debugPrint('statusCode: ${e.response?.statusCode}');
          debugPrint('data: ${e.response?.data}');

          if (e.response != null) {
            if (e.response!.statusCode == 401) {
              EasyLoading.dismiss();
              //refresh token api call
              //to refresh user token
              if (e.response?.statusCode == 401) {
                tokenDio.lock();
                tokenDio.interceptors.responseLock.lock();
                tokenDio.interceptors.errorLock.lock();
                freeDio.post("dj-rest-auth/token/refresh/", data: {
                  "refresh": refreshToken,
                }).catchError((error) {
                  print(error);
                }).whenComplete(() {
                  //EasyLoading.show();
                  tokenDio.unlock();
                  tokenDio.interceptors.responseLock.unlock();
                  tokenDio.interceptors.errorLock.unlock();
                }).then((value) async {
                  setToken(value.data['access']);
                //  setRefreshToken(value.data['access']);
                  // print("repeat after refresh");
                  handler.resolve(await tokenDio.request(
                    e.requestOptions.path,
                    data: e.requestOptions.data,
                    queryParameters: e.requestOptions.queryParameters,
                    options: Options(
                      method: e.requestOptions.method,
                      headers: e.requestOptions.headers,
                    ),
                  ));
                });
              }
            } else if (e.response!.statusCode == 413) {
              EasyLoading.dismiss();
              ToastService.showErrorToast('Image size too large');
            } else if (e.response?.statusCode == 422) {
              ToastService.showErrorToast(
                  e.response!.data['message'].toString());
            } else {
              EasyLoading.dismiss();
              debugPrint("unExpected");
              ToastService.showUnExpectedErrorToast();
            }
          } else {
            EasyLoading.dismiss();

            debugPrint("No Connection");
            ToastService.showErrorToast("no internet connection");
          }
        },
      ),
    );
  }
}
