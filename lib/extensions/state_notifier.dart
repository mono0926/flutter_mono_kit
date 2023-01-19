import 'package:rxdart/rxdart.dart';
import 'package:state_notifier/state_notifier.dart';

extension StateNotifierEx<T> on StateNotifier<T> {
  // stream.shareValueSeeded(state)してValueStream<T> にしたいものの、
  // shareValueSeededの購読数がゼロになるとそれ以降の購読に反応しなくなる挙動が
  // 罠になりがちなので避けた(同期的に現在の値を取りたい場合は普通にstateアクセスで済む)。
  Stream<T> get streamWithCurrent =>
      // ignore: invalid_use_of_protected_member
      Rx.concatEager([Stream.value(state), stream]);
}
