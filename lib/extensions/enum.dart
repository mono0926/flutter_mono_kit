import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

extension EnumX on Enum {
  String get described => describeEnum(this);
}

extension EnumsX<E extends Enum> on List<E> {
  E from(String value) {
    final e = fromOrNull(value);
    if (e is E) {
      return e;
    }
    throw AssertionError('Enum "$E.$value" does not exist.');
  }

  E? fromOrNull(String? value) => firstWhereOrNull(
        (e) => '$e'.split('.').last == value,
      );
}
