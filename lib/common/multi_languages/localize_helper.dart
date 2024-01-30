import 'package:mula_biz_mobile/common/local_data/shared_pref.dart';
import 'package:mula_biz_mobile/common/local_data/sp_keys.dart';

class LocalizeHelper {
  static Future<String> get getCurrentLanguage async =>
      await LocalStorageImpl().get(SPKeys.localize.name);
  static void saveCurrentLanguage(String lang) async =>
      await LocalStorageImpl().save(SPKeys.localize.name, lang);
}
