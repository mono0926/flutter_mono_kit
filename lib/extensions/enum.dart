import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

extension EnumName on Enum {
  String get described => describeEnum(this);
}

extension EnumByName<T extends Enum> on Iterable<T> {
  T from(String value) {
    final e = fromOrNull(value);
    if (e is T) {
      return e;
    }
    throw AssertionError('Enum "$T.$value" does not exist.');
  }

  T? fromOrNull(String? value) => firstWhereOrNull(
        (e) => '$e'.split('.').last == value,
      );
}
