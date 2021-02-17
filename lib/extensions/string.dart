extension StringEx on String? {
  bool get isNullOrEmpty {
    final string = this;
    return string == null || string.isEmpty;
  }

  String? get nullIfEmpty => isNullOrEmpty ? null : this;
}
