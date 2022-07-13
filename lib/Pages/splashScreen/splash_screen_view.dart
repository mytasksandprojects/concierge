import 'package:concierge/Pages/splashScreen/splash_screen_view_model.dart';
import 'package:concierge/Style/custom_colors.dart';
import 'package:concierge/Style/custom_icons.dart';
import 'package:flutter/material.dart';
import 'package:pmvvm/pmvvm.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MVVM<SplashScreenViewModel>(
      view: () => const _HomeView(),
      viewModel: SplashScreenViewModel(),
    );
  }
}

class _HomeView extends HookView<SplashScreenViewModel> {
  /// Set [reactive] to [false] if you don't want the view to listen to the ViewModel.
  /// It's [true] by default.
  const _HomeView({Key? key}) : super(key: key, reactive: true);

  @override
  Widget render(context, vmodel) {
    return Scaffold(
      backgroundColor: Color(0xff000000),
      body: ListView(
        children:  <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: Image.asset('assets/images/concierge-app-icon.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Style/custom_colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {


    super.initState();
    // TODO: implement initState
*/
/*
    Future.wait(
      [
        Future.delayed(Duration(seconds: 3)),
        Provider.of<SplashScreenViewModel>(context, listen: false)
            .getLangState(),
      ],
    ).then((value) {
      if (value[1] == null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                create: (context) => ChangeLangViewModel(),
                child: ChangeLangView()),
          ),
        );
      } else {
        _webService.lang=value[1].toString();
        EasyLocalization.of(context)?.setLocale(Locale(value[1].toString()));
       Navigator.of(context).pushReplacementNamed(PageRouteName.initial);
      }
    });
*/ /*

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: CustomColors.mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
           ],
        ),
      ),
    );
  }
}
*/
