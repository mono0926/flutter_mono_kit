import 'dart:io';

import 'package:flutter/services.dart';

import 'plugins.dart';

class IosInfoPlistReader {
  static const _platform = MethodChannel(kMethodChannelName);

  Future<String?> readString(String key) async {
    assert(Platform.isIOS);
    return _platform.invokeMethod(
      'info_plist/read_string',
      {
        'key': key,
      },
    );
  }
}
