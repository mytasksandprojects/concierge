import 'package:concierge/Configuration/PageRouteName.dart';
import 'package:concierge/Configuration/validtor.dart';
import 'package:concierge/Style/custom_colors.dart';
import 'package:concierge/Style/custom_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pmvvm/pmvvm.dart';

import 'login_view_model.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MVVM<LoginViewModel>(
      view: () => const _LoginView(),
      viewModel: LoginViewModel(),
    );
  }
}

class _LoginView extends HookView<LoginViewModel> {
  /// Set [reactive] to [false] if you don't want the view to listen to the ViewModel.
  /// It's [true] by default.
  const _LoginView({Key? key}) : super(key: key, reactive: true);

  @override
  Widget render(context, vmodel) {
    return Scaffold(
        backgroundColor: Color(0xff000000),
        body: ListView(children: <Widget>[
          SizedBox(
            height: 100,
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 1.5,
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width / 20),
                      child: Image.asset(
                        'assets/images/app-icon.png',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset('assets/images/word-icon.png'),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    key: vmodel.emailKey,
                    validator: (val) {
                      if (AppValidator.isEmail(val)) {
                        return null;
                      }
                      return 'enter valid email';
                    },
                    onSaved: (val) {
                      vmodel.email = val;
                    },
                    controller: vmodel.emailController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.grey),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    key: vmodel.passwordKey,
                    validator: (val) {
                      if (AppValidator.isPassword(val)) {
                        return null;
                      }
                      return 'enter valid password';
                    },
                    onSaved: (val) {
                      vmodel.password = val;
                    },
                    controller: vmodel.passwordController,
                    obscureText: vmodel.secureText,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        CustomIcons.lock,
                        size: 20,
                        color: Colors.grey,
                      ),
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.grey),
                      suffixIcon: GestureDetector(
                          child: Icon(Icons.remove_red_eye, color: Colors.grey),
                          onTap: () {
                            vmodel.secureText = !vmodel.secureText;
                          }),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(PageRouteName.restPassword);
                        },
                        child: Text(
                          'Forget Password ?',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (vmodel.emailKey.currentState!.validate() &&
                          vmodel.passwordKey.currentState!.validate()) {
                        vmodel.emailKey.currentState!.save();
                        vmodel.passwordKey.currentState!.save();
                        EasyLoading.show();
                        vmodel.login().then((value) {
                          debugPrint('login bool value from login view model');
                          debugPrint(value.toString());
                          if(value){
                            //check user verified or not
                            //then navigate to main
                            Navigator.of(context).pushNamed(PageRouteName.main);
                          }else {
                            //error in login request
                          }
                        }).whenComplete(() => EasyLoading.dismiss());
                      }
                    },
                    child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width / 1.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: CustomColors.mainGradient,
                        ),
                        child: Center(
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 1,
              width: MediaQuery.of(context).size.width / 2,
              color: Colors.grey,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don\'t Have Account ? ',
                style: TextStyle(color: Colors.grey),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(PageRouteName.signUp);
                  },
                  child: Text('SIGNUP')),
            ],
          )
        ]));
  }
}
