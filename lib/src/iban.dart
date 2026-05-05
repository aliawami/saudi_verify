import 'package:saudi_verify/src/validation_result.dart';

/// Validates a Saudi IBAN.
///
/// Returns [Valid] with parsed IBAN metadata (`countryCode`, `checkDigits`,
/// and `bban`) when valid, otherwise returns [Invalid].
ValidationResult validateIBAN(String iban) {
  if (iban.isEmpty) {
    return const Invalid("IBAN is required");
  }

  //Clear spaces
  String normalized = iban.replaceAll(" ", "").toUpperCase();

  if (normalized.length != 24) {
    return const Invalid("IBAN must be 24 characters");
  }
  if (!RegExp(r'^[A-Z]{2}[0-9]{2}[A-Z0-9]{20}$').hasMatch(normalized)) {
    return const Invalid("IBAN is not valid");
  }
  if (!normalized.startsWith("SA")) {
    return const Invalid("IBAN must be a Saudi IBAN");
  }

  String firstFour = normalized.substring(0, 4);

  String countryCode = firstFour.substring(0, 2);
  String ibanDigits = normalized.substring(4);
  int firstDigitValue = encodeA1Z26(countryCode.substring(0, 1));
  int secondDigitValue = encodeA1Z26(countryCode.substring(1, 2));
  String lastFour = firstDigitValue.toString() +
      secondDigitValue.toString() +
      firstFour.substring(2);
  String ibanFinalFormat = ibanDigits + lastFour;

  int remainder = 0;
  for (int i = 0; i < ibanFinalFormat.length; i += 9) {
    final end =
        (i + 9 < ibanFinalFormat.length) ? i + 9 : ibanFinalFormat.length;
    final chunk = ibanFinalFormat.substring(i, end);
    remainder = int.parse('$remainder$chunk') % 97;
  }
  return remainder == 1
      ? Valid(metadata: {
          "countryCode": normalized.substring(0, 2),
          "checkDigits": normalized.substring(2, 4), 
          "bban": normalized.substring(4),
        })
      : const Invalid("IBAN is not valid");
}

/// Encodes an uppercase letter to the IBAN numeric equivalent (A=10...Z=35).
int encodeA1Z26(String text) {
  if (text.codeUnitAt(0) >= 65 && text.codeUnitAt(0) <= 90) {
    // A=65, so A-65 + 10 = 1
    return text.codeUnitAt(0) - 65 + 10;
  }
  return -1;
}
