


/// The result of a Saudi validation check.
/// 
/// Use pattern matching to handle both outcomes:
/// ```dart
/// switch (validateNationalID('1234567890')) {
///   case Valid(:final metadata): print(metadata);
///   case Invalid(:final reason): print(reason);
/// }
/// ```
library;

sealed class ValidationResult {
  /// Base type for all validation outcomes.
  const ValidationResult();
}

/// Represents a successful validation result.
class Valid extends ValidationResult {
  /// Additional metadata inferred from the validated value.
  final Map<String, String> metadata;

  const Valid({this.metadata = const {}});
}

/// Represents a failed validation result.
class Invalid extends ValidationResult {
  /// A human-readable reason describing why validation failed.
  final String reason;

  const Invalid(this.reason);
}
