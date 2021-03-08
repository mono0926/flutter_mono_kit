extension IterableEx<T> on Iterable<T> {
  bool containsAll(Iterable<T> list) => !list.any((x) => !contains(x));
}
