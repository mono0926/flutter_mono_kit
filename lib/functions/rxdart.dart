import 'package:rxdart/rxdart.dart';

ValueObservable<S> shareValueSeeded<T, S>(
        ValueObservable<T> observable, S Function(T value) f) =>
    observable.map(f).shareValueSeeded(f(observable.value));
