import 'dart:io';

import 'package:flutter/foundation.dart';

export 'confirm_dialog.dart';
export 'modal_bottom_sheet.dart';
export 'show_error_dialog.dart';

const bool isCupertinoStyle = !kIsWeb && Platform.isIOS;
