import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'Configuration/PageRouteName.dart';
import 'Configuration/appRouter.dart';
import 'Style/settings_option.dart';
import 'Style/theme.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xff000000), // navigation bar color
    statusBarColor: Color(0xff000000), // status bar color
  ));
  runApp(EasyLocalization(
    supportedLocales: const [
      Locale(
        'en',
      ),
      Locale(
        'ar',
      ),
    ],
    path: 'assets/translations',
    saveLocale: true,
    startLocale: const Locale('en'),
    fallbackLocale: const Locale('en'),
    child: MyApp(
      appRouter: AppRouter(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.appRouter,
  }) : super(key: key);
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: SettingsOptions(
        theme: AppTheme().appTheme,
      ).theme?.copyWith(
          platform: SettingsOptions(
            theme: AppTheme().appTheme,
          ).platform),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      initialRoute: PageRouteName.splash,
      onGenerateRoute: appRouter.generateRoute,
      builder: EasyLoading.init(),
      // home: RegisterView(),
    );
  }
}
