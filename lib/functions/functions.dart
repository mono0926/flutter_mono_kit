import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

export 'show_error_dialog.dart';
export 'show_photo_selection_sheet.dart';

String convertToHalfWidth(String text) {
  return text.replaceAllMapped(
    RegExp(r'[０-９ａ-ｚＡ-Ｚ]'),
    (m) => String.fromCharCode(m[0]!.codeUnitAt(0) - 65248),
  );
}

/// Show error unless ReleaseMode and isProduction is true.
///
/// Modified from this:
/// https://github.com/flutter/flutter/blob/62621507966463f9fe678b3e249a64f1be11c9a1/packages/flutter/lib/src/widgets/framework.dart#L4376
void configureErrorWidgetBuilder({
  required bool isProduction,
  ErrorWidgetBuilder? productionBuilder,
}) {
  ErrorWidget.builder = (details) {
    final message = kReleaseMode && isProduction
        ? ''
        : '${_stringifyException(details.exception)}\n'
            'See also: https://flutter.dev/docs/testing/errors';
    final dynamic exception = details.exception;
    if (isProduction && productionBuilder != null) {
      return productionBuilder(details);
    }
    return ErrorWidget.withDetails(
      message: message,
      error: exception is FlutterError ? exception : null,
    );
  };
}

String _stringifyException(Object exception) {
  try {
    return exception.toString();
// ignore: avoid_catches_without_on_clauses
  } catch (e) {
// intentionally left empty.
  }
  return 'Error';
}
