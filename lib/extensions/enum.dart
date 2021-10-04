import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

// https://github.com/dart-lang/sdk/blob/23cf71efba3b1bab1afd8b0d515189c9d644584c/sdk/lib/core/enum.dart#L85

/// Access to the name of an enum value.
///
/// This method is declared as an extension method
/// instead of an instance method in order to allow
/// enum values to have the name `name`.
extension EnumName on Enum {
  /// The name of the enum value.
  ///
  /// The name is a string containing the source identifier used
  /// to declare the enum value.
  ///
  /// For example, given a declaration like:
  /// ```dart
  /// enum MyEnum {
  ///   value1,
  ///   value2
  /// }
  /// ```
  /// the result of `MyEnum.value1.name` is the string `"value1"`.
  String get name => describeEnum(this);
  @Deprecated(
    'This property is no longer used, please use name instead. '
    'This feature was deprecated after 2.15.0-139.0.dev.',
  )
  String get described => name;
}

extension EnumByName<T extends Enum> on Iterable<T> {
  /// Finds the enum value in this list with name [name].
  ///
  /// Goes through this collection looking for an enum with
  /// name [name], as reported by [EnumName.name].
  /// Returns the first value with the given name. Such a value must be found.
  T byName(String name) {
    final value = byNameOrNull(name);
    if (value is T) {
      return value;
    }
    throw ArgumentError.value(name, 'name', 'No enum value with that name');
  }

  T? byNameOrNull(String? name) {
    for (final value in this) {
      if (value.name == name) {
        return value;
      }
    }
    return null;
  }

  /// Creates a map from the names of enum values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// enums with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more enum values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  Map<String, T> asNameMap() =>
      <String, T>{for (var value in this) value.name: value};

  @Deprecated(
    'This property is no longer used, please use name instead. '
    'This feature was deprecated after 2.15.0-139.0.dev.',
  )
  T from(String name) => byName(name);
  @Deprecated(
    'This property is no longer used, please use name instead. '
    'This feature was deprecated after 2.15.0-139.0.dev.',
  )
  T? fromOrNull(String? name) => byNameOrNull(name);
}
