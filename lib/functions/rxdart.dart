import 'package:rxdart/rxdart.dart';

ValueObservable<S> shareValueSeeded<T, S>(
  ValueObservable<T> observable,
  S Function(T value) f,
) =>
    observable.map(f).distinct().shareValueSeeded(f(observable.value));
