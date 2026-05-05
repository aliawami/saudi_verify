import 'package:saudi_verify/src/validation_result.dart';

/// Validates a Saudi VAT number.
///
/// Returns [Valid] with ZATCA metadata when the VAT number is structurally
/// valid, otherwise returns [Invalid] with a human-readable reason.
ValidationResult validateVAT(String vat) {
  if (vat.isEmpty) {
    return const Invalid("VAT is required");
  }
  if (!RegExp(r'^\d+$').hasMatch(vat)) {
    return const Invalid("VAT must be a number");
  }
  if (vat.length != 15) {
    return const Invalid("VAT must be 15 digits");
  }
  if (!vat.startsWith("3")) {
    return const Invalid("VAT must start with 3");
  }
  if (!vat.endsWith("3")) {
    return const Invalid("VAT must end with 3");
  }

  return const Valid(metadata: {"issuingAuthority": "ZATCA"});
}
