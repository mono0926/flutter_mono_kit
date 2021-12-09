extension EnumByName<T extends Enum> on Iterable<T> {
  T? byNameOrNull(String? name) {
    for (final value in this) {
      if (value.name == name) {
        return value;
      }
    }
    return null;
  }
}
