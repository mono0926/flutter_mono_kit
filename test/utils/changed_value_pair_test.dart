import 'package:flutter_test/flutter_test.dart';
import 'package:mono_kit/utils/logger.dart';
import 'package:rxdart/rxdart.dart';
import 'package:mono_kit/mono_kit.dart';

void main() {
  group(
    'changedValuePair(Stream)',
    () {
      PublishSubject<String> _subject;
      Stream<ChangedValuePair<String>> _target;
      setUp(() {
        _subject = PublishSubject();
        _target = _subject.changedValuePair();
      });
      tearDown(() {
        _subject.close();
      });

      test(
        '',
        () async {
          _target.listen((pair) {
            logger.info(pair);
            expect(pair.current, isNot(equals(pair.previous)));
          });
          _subject
            ..add('a')
            ..add('a')
            ..add('b')
            ..add('b')
            ..add('c')
            ..add(null)
            ..add('a');
        },
      );
    },
  );

  group(
    'changedValuePair(ValueStream(initialValue: null))',
    () {
      BehaviorSubject<String> _subject;
      Stream<ChangedValuePair<String>> _target;
      setUp(() {
        _subject = BehaviorSubject();
        _target = _subject.changedValuePair();
      });
      tearDown(() {
        _subject.close();
      });

      test(
        '',
        () async {
          _target.listen((pair) {
            logger.info(pair);
            expect(pair.current, isNot(equals(pair.previous)));
          });
          _subject
            ..value = 'a'
            ..value = 'a'
            ..value = 'b'
            ..value = 'b'
            ..value = 'c'
            ..value = null
            ..value = 'a';
        },
      );
    },
  );

  group(
    'changedValuePair(ValueStream(initialValue: a))',
    () {
      BehaviorSubject<String> _subject;
      Stream<ChangedValuePair<String>> _target;
      setUp(() {
        _subject = BehaviorSubject.seeded('a');
        _target = _subject.changedValuePair();
      });
      tearDown(() {
        _subject.close();
      });

      test(
        '',
        () async {
          _target.skip(1).listen((pair) {
            logger.info(pair);
            expect(pair.current, isNot(equals(pair.previous)));
          });
          _subject
            ..value = 'a'
            ..value = 'a'
            ..value = 'b'
            ..value = 'b'
            ..value = 'c'
            ..value = null
            ..value = 'a';
          await expectLater(
            await _target.first,
            equals(const ChangedValuePair(previous: 'a', current: 'a')),
          );
        },
      );
    },
  );
}
