import 'package:shared_preferences/shared_preferences.dart';

class CacheNetwork{
  static late SharedPreferences sharedPref;
  static Future cachedInitialization()async{
    sharedPref= await SharedPreferences.getInstance();
  }

  static Future<bool> setDate({required String key , required String value})async{
    return await sharedPref.setString(key, value);
  }

  static String getDate({required String key }){
    return  sharedPref.getString(key)??"";
  }

  static  Future<bool> removeDate({required String key })async{
    return await sharedPref.remove(key);
  }
  
  

}