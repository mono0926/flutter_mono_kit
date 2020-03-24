import 'package:flutter_test/flutter_test.dart';
import 'package:mono_kit/mono_kit.dart';

void main() {
  test('convertToHalfWidth', () {
    expect(convertToHalfWidth('hello'), equals('hello'));
    expect(convertToHalfWidth('Hello'), equals('Hello'));
    expect(convertToHalfWidth('Hello1'), equals('Hello1'));
    expect(convertToHalfWidth('Ｈello1'), equals('Hello1'));
    expect(convertToHalfWidth('Hello１'), equals('Hello1'));
    expect(convertToHalfWidth('Ｈello１'), equals('Hello1'));
    expect(convertToHalfWidth('Ｈｅllo１'), equals('Hello1'));
  });
}
