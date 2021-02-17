extension IterableEx<T> on Iterable<T> {
  bool containsAll(Iterable<T> list) => !list.any((x) => !contains(x));

  T? firstWhereOrNull(bool Function(T) test) {
    try {
      return firstWhere(test);
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      assert(e is StateError);
      return null;
    }
  }

  T? get firstOrNull => isEmpty ? null : first;

  T? get lastOrNull => isEmpty ? null : last;
}
