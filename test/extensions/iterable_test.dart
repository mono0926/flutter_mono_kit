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
  test('mapWithIndex', () {
    expect(
      <String>[].mapWithIndex((s, i) => '$s-$i').toList(),
      <String>[],
    );
    expect(
      <String>['a'].mapWithIndex((s, i) => '$s-$i').toList(),
      <String>['a-0'],
    );
    expect(
      <String>['a', 'b', 'c'].mapWithIndex((s, i) => '$s-$i').toList(),
      <String>['a-0', 'b-1', 'c-2'],
    );
    expect(
      <String>['a', 'b', 'c'].mapWithIndex((s, i) => '$s-$i').take(1).toList(),
      <String>['a-0'],
    );
  });
}
