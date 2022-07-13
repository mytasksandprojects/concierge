import 'package:concierge/Configuration/PageRouteName.dart';
import 'package:concierge/Style/custom_colors.dart';
import 'package:concierge/Style/custom_icons.dart';
import 'package:flutter/material.dart';
import 'package:pmvvm/pmvvm.dart';

import 'rest_password_view_model.dart';


class RestPassword extends StatelessWidget {
  const RestPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MVVM<RestPasswordViewModel>(
      view: () => const _LoginView(),
      viewModel: RestPasswordViewModel(),
    );
  }
}

class _LoginView extends HookView<RestPasswordViewModel> {
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
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                      hintText: 'Enter your e-mail address',
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
                ]),
              ),
            ),
          ),
          Center(
            child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width / 1.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: CustomColors.mainGradient,
                ),
                child: Center(
                  child: Text(
                    'RESET PASSWORD',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                )),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height/6,
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
              Text('Already Have Account ? ',style: TextStyle(color: Colors.grey),),
              GestureDetector(onTap: (){
                Navigator.of(context).pushReplacementNamed(PageRouteName.login);
              },child: Text('LOGIN')),
            ],
          )
        ]));
  }
}
