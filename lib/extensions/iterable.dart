extension IterableEx<T> on Iterable<T> {
  bool containsAll(Iterable<T> list) => !list.any((x) => !contains(x));

  T firstWhereOrNull(bool Function(T) test) =>
      firstWhere(test, orElse: () => null);

  T get firstOrNull => isEmpty ? null : first;
}
