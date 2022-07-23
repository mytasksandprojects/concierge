import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../Services/toastService.dart';
// ignore: must_be_immutable
class AppWebView extends StatelessWidget {
  String? url;

  AppWebView({this.url, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                SystemChrome.setPreferredOrientations([
                  DeviceOrientation.portraitUp,
                ]);
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back)),
        ),
        body: SafeArea(
          child: WebView(
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: url,
            onPageStarted: (url) {
              print(url);
              EasyLoading.show();
             /* SystemChrome.setPreferredOrientations([
                DeviceOrientation.portraitUp,
                DeviceOrientation.portraitDown,
                DeviceOrientation.landscapeLeft,
                DeviceOrientation.landscapeRight,
              ]);*/
            },
            onPageFinished: (url) => EasyLoading.dismiss(),
            onWebResourceError: (web){
              EasyLoading.dismiss();
              ToastService.showErrorToast(web.description);
              Navigator.of(context).pop();
            },
            gestureNavigationEnabled: true,
          ),
        ));
  }
}
