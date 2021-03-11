
import 'package:firebase_remote_config/firebase_remote_config.dart';

class CommonRepository{
  static Future<String> getRemoteConfigKey(String key) async {
    final RemoteConfig remoteConfig = await RemoteConfig.instance;
    await remoteConfig.fetch(expiration: const Duration(seconds: 30));
    await remoteConfig.activateFetched();
    return remoteConfig.getString(key);
  }
}