extension StringEx on String? {
  bool get isNullOrEmpty => this?.isEmpty ?? true;

  String? get nullIfEmpty => isNullOrEmpty ? null : this;
}

extension NonNullStringEx on String {
  String toCapitalized() =>
      isEmpty ? this : '${this[0].toUpperCase()}${substring(1)}';
}
