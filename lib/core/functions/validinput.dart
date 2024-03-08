import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == 'username') {
    if (!GetUtils.isUsername(val)) {
      return '118'.tr;
    }
  }

  if (type == 'email') {
    if (!GetUtils.isEmail(val)) {
      return '119'.tr;
    }
  }

  if (type == 'phone') {
    if (!GetUtils.isPhoneNumber(val)) {
      return '120'.tr;
    }
  }

  if (val.isEmpty) {
    return "121".tr;
  }

  if (val.length < min) {
    return "122 $min".tr;
  }

  if (val.length > max) {
    return "123 $max".tr;
  }
}
