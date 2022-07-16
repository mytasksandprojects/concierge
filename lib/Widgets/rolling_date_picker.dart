import 'package:concierge/Pages/SignUp/sign_up_view_model.dart';
import 'package:concierge/Style/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

class RollingDatePicker extends StatefulWidget {
  RollingDatePicker(
      {Key? key,this.selectedLang,this.signUpViewModel})
      : super(key: key);
  String? selectedLang;
  SignUpViewModel? signUpViewModel;
  @override
  State<RollingDatePicker> createState() => _RollingDatePickerState();
}

class _RollingDatePickerState extends State<RollingDatePicker> {
  @override
  Widget build(BuildContext context) {
  /*  final _getStorage = GetStorage();
    String localLang = _getStorage.read("lang") ?? "ar";
  */
    return Container(
      color: Colors.black,
      width: MediaQuery.of(context).size.width,
      height: 150,
      child: ScrollDatePicker(
        options: DatePickerOptions(isLoop: false),
       // indicator: Container(color: Colors.grey),
        selectedDate:widget.signUpViewModel!.currentDate,
        /*style: DatePickerStyle(
            textStyle: TextStyle(color: Colors.grey.withOpacity(1))),*/
    /*    locale: localLang.compareTo('en') == 0
            ? DatePickerLocale.enUS
            : DatePickerLocale.arAr,
    */    onDateTimeChanged: (DateTime value) {
          setState(() {
            widget.signUpViewModel!.currentDate = value;
       /*     widget.secondSignUpViewModel!.currentDate = value;
            widget.secondSignUpViewModel!.isChecked = true;
            widget.secondSignUpViewModel!.dateValue =
                "${widget.secondSignUpViewModel!.currentDate.year}/${widget.secondSignUpViewModel!.currentDate.month}/${widget.secondSignUpViewModel!.currentDate.day}";
            widget.secondSignUpViewModel!.update();
       */   });
        },
      ),
    );
  }
}
