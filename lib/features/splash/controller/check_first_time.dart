import 'package:bmi/core/cash/getstorage_helper.dart';
import 'package:bmi/core/utils/app_constants.dart';

bool checkIsFirstTime() {
  bool? isFirstTime = GetStorageHelper.readData(AppConsts.firstTime);
  if (isFirstTime == null) {
    GetStorageHelper.writeData(AppConsts.firstTime, true);
    return true;
  } else {
    return false;
  }
}
