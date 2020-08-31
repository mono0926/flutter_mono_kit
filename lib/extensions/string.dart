extension StringEx on String {
  bool get isNullOrEmpty => this == null || isEmpty;
  String get nullIfEmpty => isNullOrEmpty ? null : this;
}
