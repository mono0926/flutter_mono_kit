import 'package:flutter_test/flutter_test.dart';
import 'package:mono_kit/mono_kit.dart';
import 'package:mono_kit/utils/logger.dart';
import 'package:rxdart/rxdart.dart';

void main() {
  group(
    'changedValuePair(Stream)',
    () {
      late PublishSubject<String?> subject;
      late Stream<ChangedValuePair<String?>> target;
      setUp(() {
        subject = PublishSubject();
        target = subject.changedValuePair();
      });
      tearDown(() {
        subject.close();
      });

      test(
        '',
        () async {
          target.listen((pair) {
            logger.info(pair);
            expect(pair.current, isNot(equals(pair.previous)));
          });
          subject
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
      late BehaviorSubject<String?> subject;
      late Stream<ChangedValuePair<String?>> target;
      setUp(() {
        subject = BehaviorSubject();
        target = subject.changedValuePair();
      });
      tearDown(() {
        subject.close();
      });

      test(
        '',
        () async {
          target.listen((pair) {
            logger.info(pair);
            expect(pair.current, isNot(equals(pair.previous)));
          });
          subject
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
    'changedValuePair(ValueStream(initialValue: a))',
    () {
      late BehaviorSubject<String?> subject;
      late Stream<ChangedValuePair<String?>> target;
      setUp(() {
        subject = BehaviorSubject.seeded('a');
        target = subject.changedValuePair();
      });
      tearDown(() {
        subject.close();
      });

      test(
        '',
        () async {
          target.skip(1).listen((pair) {
            logger.info(pair);
            expect(pair.current, isNot(equals(pair.previous)));
          });
          subject
            ..add('a')
            ..add('a')
            ..add('b')
            ..add('b')
            ..add('c')
            ..add(null)
            ..add('a');
          await expectLater(
            await target.first,
            equals(const ChangedValuePair(previous: 'a', current: 'a')),
          );
        },
      );
    },
  );
}
