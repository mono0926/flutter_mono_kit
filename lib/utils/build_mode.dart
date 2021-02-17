import 'package:flutter/foundation.dart';

enum BuildMode { profile, debug, release }

BuildMode buildMode = () {
  if (kReleaseMode) {
    return BuildMode.release;
  }
  if (kProfileMode) {
    return BuildMode.profile;
  }
  if (kDebugMode) {
    return BuildMode.debug;
  }
  assert(false, 'Cannot determined Build Mode');
  // ignore: null_check_always_fails
  return null!;
}();
