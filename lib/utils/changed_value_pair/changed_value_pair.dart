import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart' hide ScanExtension;
import 'package:stream_transform/stream_transform.dart';

part 'changed_value_pair.freezed.dart';

@freezed
abstract class ChangedValuePair<T> with _$ChangedValuePair<T> {
  const factory ChangedValuePair({
    T? current,
    T? previous,
  }) = _ChangedValuePair<T>;
}

extension ChangedValuePairStream<T> on Stream<T> {
  Stream<ChangedValuePair<T>> changedValuePair([T? initialValue]) {
    return distinct((a, b) => a == b).scan(
      ChangedValuePair<T>(current: initialValue),
      (ChangedValuePair<T> pair, current) => pair.copyWith(
        current: current,
        previous: pair.current,
      ),
    );
  }
}

extension ChangedValuePairValueStream<T> on ValueStream<T> {
  Stream<ChangedValuePair<T>> changedValuePair() {
    return ChangedValuePairStream<T>(this).changedValuePair(value);
  }
}
