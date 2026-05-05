import 'package:saudi_verify/src/validation_result.dart';

/// Validates a Saudi national ID or Iqama number.
///
/// Returns [Valid] with `idType` metadata (`citizen` or `iqama`) when the
/// value is valid, otherwise returns [Invalid].
ValidationResult validateNationalID(String nationalID) {
  if (nationalID.isEmpty) {
    return const Invalid("National ID is required");
  }
  if (!RegExp(r'^\d+$').hasMatch(nationalID)) {
    return const Invalid("National ID must be a number");
  }

  if (nationalID.length != 10) {
    return const Invalid("National ID must be 10 digits");
  }

  if (nationalID.startsWith("1")) {
    return const Valid(metadata: {"idType": "citizen"});
  }

  if (nationalID.startsWith("2")) {
    return const Valid(metadata: {"idType": "iqama"});
  }
  return const Invalid("Invalid national ID");
}
