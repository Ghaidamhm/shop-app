import 'package:get/route_manager.dart';
import 'package:ushop_app/language/en.dart';
import 'package:ushop_app/language/fr.dart';
import 'package:ushop_app/utils/my_string.dart';

import 'ar.dart';


class LocaliztionApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        ene: en,
        ara: ar,
        frf: fr,
      };
}