import 'package:concierge/Style/custom_colors.dart';
import 'package:concierge/Style/custom_icons.dart';
import 'package:concierge/Widgets/rolling_date_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pmvvm/pmvvm.dart';

import '../../Configuration/PageRouteName.dart';
import '../../Configuration/validtor.dart';
import 'sign_up_view_model.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MVVM<SignUpViewModel>(
      view: () => const _SignUpView(),
      viewModel: SignUpViewModel(),
    );
  }
}

class _SignUpView extends HookView<SignUpViewModel> {
  /// Set [reactive] to [false] if you don't want the view to listen to the ViewModel.
  /// It's [true] by default.
  const _SignUpView({Key? key}) : super(key: key, reactive: true);

  @override
  Widget render(context, vmodel) {
    return Scaffold(
        backgroundColor: Color(0xff000000),
        body: ListView(children: <Widget>[
          SizedBox(
            height: 10,
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
                    key: vmodel.namedKey,
                    validator: (val) {
                      if (val?.isNotEmpty ?? false) {
                        return null;
                      }
                      return 'enter valid name';
                    },
                    onSaved: (val) {
                      vmodel.email = val;
                    },
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        CustomIcons.your_name,
                        color: Colors.grey,
                      ),
                      hintText: 'Your Name',
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
                    key: vmodel.mobileKey,
                    validator: (val) {
                      if (val?.isNotEmpty ?? false) {
                        return null;
                      }
                      return 'enter valid mobile';
                    },
                    onSaved: (val) {
                      vmodel.mobile = val;
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    style: TextStyle(color: Colors.black),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(
                        Icons.phone_android,
                        color: Colors.grey,
                      ),
                      hintText: 'Mobile',
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
                    key: vmodel.password1Key,
                    validator: (val) {
                      if (val != null) {
                        if (AppValidator.isPassword(val) &&
                            AppValidator.isPassword(
                                vmodel.password2) &&
                            val.compareTo(vmodel.password2!) ==
                                0) {
                          return null;
                        }
                        return 'password must at least 8 characters and equals';
                      }
                      return 'password must at least 8 characters and equals';
                    },
                    onSaved: (val) {
                      vmodel.password1 = val;
                    },
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
                  TextFormField(
                    onChanged: (val){
                      vmodel.password2=val;
                    },
                    key: vmodel.password2Key,
                    validator: (val) {
                      return vmodel.password1Key.currentState!.validate()
                          ? null
                          : 'password must at least 8 characters and equals';
                    },
                    onSaved: (val) {
                      vmodel.password2 = val;
                    },
                    obscureText: vmodel.secureText2,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        CustomIcons.lock,
                        size: 20,
                        color: Colors.grey,
                      ),
                      hintText: 'Confirm Password',
                      hintStyle: TextStyle(color: Colors.grey),
                      suffixIcon: GestureDetector(
                          child: Icon(Icons.remove_red_eye, color: Colors.grey),
                          onTap: () {
                            vmodel.secureText2 = !vmodel.secureText2;
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
                  TextFormField(
                    key: vmodel.confirmationCodeKey,
                    validator: (val) {
                      if (val?.isNotEmpty ?? false) {
                        return null;
                      }
                      return 'enter valid confirmation code';
                    },
                    onSaved: (val) {
                      vmodel.confirmationCode = val;
                    },
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      prefixIcon: Image.asset(
                        'assets/images/shield.png',
                        fit: BoxFit.none,
                      ),
                      hintText: 'Confirmation Code',
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
                  Row(
                    children: [
                      Text(
                        'Birth of date',
                        style: TextStyle(color: Colors.grey, fontSize: 24),
                      ),
                    ],
                  ),
                  RollingDatePicker(signUpViewModel: vmodel),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (vmodel.namedKey.currentState!.validate() &&
                          vmodel.emailKey.currentState!.validate() &&
                          vmodel.mobileKey.currentState!.validate() &&
                          //vmodel.password1Key.currentState!.validate() &&
                          vmodel.password2Key.currentState!.validate() &&
                          vmodel.confirmationCodeKey.currentState!.validate()) {
                        vmodel.namedKey.currentState!.save();
                        vmodel.emailKey.currentState!.save();
                        vmodel.mobileKey.currentState!.save();
                        vmodel.password1Key.currentState!.save();
                        vmodel.password2Key.currentState!.save();
                        vmodel.confirmationCodeKey.currentState!.save();

                        EasyLoading.show();
                        vmodel.signUp().then((value) {
                          debugPrint('login bool value from login view model');
                          debugPrint(value.toString());
                          if (value) {
                            //navigate to main
                            Navigator.of(context).pushNamed(PageRouteName.main);
                          } else {
                            //error in signup request
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
                            'Continue',
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
                'Already Have Account ? ',
                style: TextStyle(color: Colors.grey),
              ),
              GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Text('LOGIN')),
            ],
          ),
          SizedBox(
            height: 30,
          ),
        ]));
  }
}
