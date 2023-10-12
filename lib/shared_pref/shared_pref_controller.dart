import 'package:shared_preferences/shared_preferences.dart';

enum PrefKeys { token,phone }

class SharedPrefController {
  static final SharedPrefController _instance = SharedPrefController._();
  late SharedPreferences _sharedPreferences;

  factory SharedPrefController() {
    return _instance;
  }

  SharedPrefController._();

  Future<void> initPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> saveToken({required String token}) async {
    await _sharedPreferences.setString(PrefKeys.token.toString(), token);
  }



  String get token =>
      _sharedPreferences.getString(PrefKeys.token.toString()) ?? '';



  Future<bool> clear() async {
    return await _sharedPreferences.clear();
  }
}
