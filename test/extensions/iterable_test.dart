import 'package:flutter_test/flutter_test.dart';
import 'package:mono_kit/mono_kit.dart';

void main() {
  test('containsAll', () {
    expect(
      ['a', 'b'].containsAll(['a']),
      isTrue,
    );
    expect(
      ['a', 'b'].containsAll(['a', 'b']),
      isTrue,
    );
    expect(
      ['a', 'b'].containsAll(['a', 'b', 'c']),
      isFalse,
    );
    expect(
      ['a', 'b'].containsAll(['a', 'c']),
      isFalse,
    );
  });
  test('firstWhereOrNull', () {
    expect(
      <int>[].firstWhereOrNull((x) => true),
      isNull,
    );
    expect(
      <int>[1, 2].firstWhereOrNull((x) => true),
      1,
    );
    expect(
      <int>[1, 2].firstWhereOrNull((x) => false),
      isNull,
    );
    expect(
      <int>[1, 2].firstWhereOrNull((x) => x.isEven),
      2,
    );
  });
}
