import 'package:bmi/core/cash/getstorage_helper.dart';
import 'package:bmi/core/utils/app_constants.dart';

bool checkIsUserLoginBefore() {
  bool? isFirstTime = GetStorageHelper.readData(AppConsts.isLogined);
  if (isFirstTime == null) {
    return true;
  } else {
    return false;
  }
}
