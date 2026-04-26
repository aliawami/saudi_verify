sealed class ValidationResult {
  const ValidationResult();
}

class Valid extends ValidationResult {
  final Map<String, String> metadata;
  const Valid({this.metadata = const {}});
}

class Invalid extends ValidationResult {
  final String reason;
  const Invalid(this.reason);
}
