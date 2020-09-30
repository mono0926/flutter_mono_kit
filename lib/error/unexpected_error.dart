/// https://zenn.dev/mono/articles/082dde5601ab4de858a1
class UnexpectedError extends AssertionError {
  UnexpectedError(Object value) : super('Unexpected value: $value');
}
