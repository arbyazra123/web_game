import 'package:firebase_remote_config/firebase_remote_config.dart';

class CommonRepository {
  static Future<String> getRemoteConfigKey(String key) async {
    final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.fetchAndActivate();
    return remoteConfig.getString(key);
  }
}
