import 'dart:io';

import 'package:flutter/services.dart';

class IosInfoPlistReader {
  static const _platform = const MethodChannel('mono_kit');

  Future<String> readString(String key) async {
    assert(Platform.isIOS);
    return _platform.invokeMethod('info_plist/read_string', {'key': key});
  }
}
