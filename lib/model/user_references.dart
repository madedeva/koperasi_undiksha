import 'package:shared_preferences/shared_preferences.dart';

class UserReferences {
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  SharedPreferences? _prefs;

  void setUserId(String userId) async {
    _prefs = await _pref;
    _prefs!.setString('userId', userId);
  }

  Future<String?> getUserId() async {
    _prefs = await _pref;
    return _prefs!.getString('userId');
  }

  void setUserName(String userName) async {
    _prefs = await _pref;
    _prefs!.setString('userName', userName);
  }

  Future<String?> getUserName() async {
    _prefs = await _pref;
    return _prefs!.getString('userName');
  }

  void setNama(String nama) async {
    _prefs = await _pref;
    _prefs!.setString('nama', nama);
  }

  Future<String?> getNama() async {
    _prefs = await _pref;
    return _prefs!.getString('nama');
  }

  void setSaldo(double saldo) async {
    _prefs = await _pref;
    _prefs!.setDouble('saldo', saldo);
  }

  Future<double?> getSaldo() async {
    _prefs = await _pref;
    return _prefs!.getDouble('saldo');
  }

  void setPassword(String password) async {
    _prefs = await _pref;
    _prefs!.setString('password', password);
  }

  Future<String?> getPassword() async {
    _prefs = await _pref;
    return _prefs!.getString('password');
  }

  void setNomorRekening(String nomorRekening) async {
    _prefs = await _pref;
    _prefs!.setString('nomorRekening', nomorRekening);
  }

  Future<String?> getNomorRekening() async {
    _prefs = await _pref;
    return _prefs!.getString('nomorRekening');
  }

  // setup null all data
  void setNullAllData() async {
    _prefs = await _pref;
    _prefs!.setString('userId', '');
    _prefs!.setString('userName', '');
    _prefs!.setString('nama', '');
    _prefs!.setDouble('saldo', 0.0);
    _prefs!.setString('password', '');
    _prefs!.setString('nomorRekening', '');
  }

  // hasil scan
  void setQrScanResult(String qrScanResult) async {
    _prefs = await _pref;
    _prefs!.setString('qrScanResult', qrScanResult);
  }

  Future<String?> getQrScanResult() async {
    _prefs = await _pref;
    return _prefs!.getString('qrScanResult');
  }
}
