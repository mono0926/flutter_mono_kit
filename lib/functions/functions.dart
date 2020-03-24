export 'show_error_dialog.dart';

String convertToHalfWidth(String text) {
  return text.replaceAllMapped(
    RegExp(r'[０-９ａ-ｚＡ-Ｚ]'),
    (m) => String.fromCharCode(m[0].codeUnitAt(0) - 65248),
  );
}
