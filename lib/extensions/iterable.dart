extension IterableEx<T> on Iterable<T> {
  bool containsAll(Iterable<T> list) => !list.any((x) => !contains(x));

  T? get firstOrNull => isEmpty ? null : first;

  T? get lastOrNull => isEmpty ? null : last;
}
