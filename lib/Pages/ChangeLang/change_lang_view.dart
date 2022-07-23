import 'package:concierge/Configuration/PageRouteName.dart';
import 'package:concierge/Configuration/validtor.dart';
import 'package:concierge/Services/toastService.dart';
import 'package:concierge/Style/custom_colors.dart';
import 'package:concierge/Style/custom_icons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pmvvm/pmvvm.dart';

import 'change_lang_view_model.dart';

class ChangeLang extends StatelessWidget {
  const ChangeLang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MVVM<ChangeLangViewModel>(
      view: () => const _ChangeLangView(),
      viewModel: ChangeLangViewModel(),
    );
  }
}

class _ChangeLangView extends HookView<ChangeLangViewModel> {
  /// Set [reactive] to [false] if you don't want the view to listen to the ViewModel.
  /// It's [true] by default.
  const _ChangeLangView({Key? key}) : super(key: key, reactive: true);

  @override
  Widget render(context, vmodel) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 50,
          ),
          Center(
              child: Text(
            'chooseYourLang'.tr(),
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: CustomColors.mainColor),
          )),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              onTap: () {
                vmodel.chosenLang = Locale(
                  'en',
                );
              },
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                    color: vmodel.chosenLang ==
                            Locale(
                              'en',
                            )
                        ? Colors.white
                        : CustomColors.mainColor,
                    shape: BoxShape.rectangle,
                    border: Border.all(
                        color: vmodel.chosenLang ==
                                Locale(
                                  'en',
                                )
                            ? CustomColors.mainColor
                            : Colors.white),
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Text(
                    'English',
                    style: TextStyle(
                        color: vmodel.chosenLang ==
                                Locale(
                                  'en',
                                )
                            ? CustomColors.mainColor
                            : Colors.white),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              onTap: () {
                vmodel.chosenLang = Locale(
                  'ar',
                );
                vmodel.changeLang('ar');
              },
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                    color: vmodel.chosenLang ==
                            Locale(
                              'ar',
                            )
                        ? Colors.white
                        : CustomColors.mainColor,
                    shape: BoxShape.rectangle,
                    border: Border.all(
                        color: vmodel.chosenLang ==
                                Locale(
                                  'ar',
                                )
                            ? CustomColors.mainColor
                            : Colors.white),
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Text(
                    'عربي',
                    style: TextStyle(
                        color: vmodel.chosenLang ==
                                Locale(
                                  'ar',
                                )
                            ? CustomColors.mainColor
                            : Colors.white),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                if (vmodel.chosenLang == null)
                  return null;
                else if (vmodel.chosenLang ==
                    Locale(
                      'en',
                    )) {
                  vmodel.changeLang('en');
                  EasyLocalization.of(context)?.setLocale(Locale(
                    'en',
                  ));
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      PageRouteName.login, (route) => false);
                } else {
                  vmodel.changeLang('ar');
                  EasyLocalization.of(context)?.setLocale(Locale('ar'));

                  Navigator.of(context).pushNamedAndRemoveUntil(
                      PageRouteName.login, (route) => false);
                }
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  gradient: CustomColors.mainGradient,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    'continue'.tr(),
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
