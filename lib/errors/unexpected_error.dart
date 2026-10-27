/// https://zenn.dev/mono/articles/082dde5601ab4de858a1
class UnexpectedError(Object value) extends AssertionError {
  this : super('Unexpected value: $value');
}
