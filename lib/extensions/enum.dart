extension EnumByName<T extends Enum> on Iterable<T> {
  T? byNameOrNull(String? name) => name == null ? null : asNameMap()[name];
}
