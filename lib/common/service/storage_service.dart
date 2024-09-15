import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulearning_app_bloc_provider/common/value/constant.dart';


class StorageService{

  late final SharedPreferences _prefs;
  // Initialize shared preferences

  Future<StorageService> init() async{
    _prefs=await SharedPreferences.getInstance();
    return this;
  }

  // set first open device
  Future<bool> setBool(String key,bool value) async{
    return await _prefs.setBool(key, value);
  }



  bool getDeviceFirstOpen(){
    return _prefs.getBool(
        AppConstant.STORAGE_DEVICE_OPEN_FIRST_TIME)??false;
  }


// setString  is login
  Future<bool> setString(String key,String value) async{
    return await _prefs.setString(key, value);
  }
  bool getIsLogin(){
    return _prefs.getString(AppConstant.STORAGE_USER_TOKEN_KEY)==null?false:true;
  }

  Future<bool> remove(String key) async{
    return await _prefs.remove(key);
  }

}