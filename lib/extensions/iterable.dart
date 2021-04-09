extension IterableEx<T> on Iterable<T> {
  bool containsAll(Iterable<T> list) => !list.any((x) => !contains(x));

  Iterable<E> mapWithIndex<E>(E Function(T, int index) f) sync* {
    var i = 0;
    for (final item in this) {
      yield f(item, i);
      i++;
    }
  }
}
