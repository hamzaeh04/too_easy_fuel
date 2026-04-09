import 'package:fluttertoast/fluttertoast.dart';
import 'package:too_easy_fuel/constants/color_constants.dart';


class CustomToast{
  void showToast(String body,bool error){
    Fluttertoast.showToast(
        msg: body,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: error?errorColor:success,
        textColor: whiteColor,
        fontSize: 16.0
    );
  }

}
