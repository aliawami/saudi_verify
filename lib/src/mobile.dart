import 'package:saudi_verify/src/validation_result.dart';

ValidationResult validateMobile(String mobile) {
  if (mobile.isEmpty) {
    return const Invalid("Mobile number is required");
  }

  if (mobile.length < 9) {
    return const Invalid("Mobile number must be at least 9 digits");
  }

  final checkable = mobile.startsWith("+") ? mobile.substring(1) : mobile;
  if (!RegExp(r'^\d+$').hasMatch(checkable)) {
    return const Invalid("Mobile number must be a number");
  }

  String normalized = mobile.substring(mobile.length - 9);

  if (normalized.length == 9 && normalized.startsWith("5")) {
    normalized = "0$normalized";
  }
  if (normalized.length == 10 && !normalized.startsWith("05")) {
    return const Invalid("Invalid mobile number format");
  }

  if (normalized.length == 10) {
    if (['0', '3', '5'].contains(normalized[2]) ||
        normalized.substring(3, 5) == '73') {
      return const Valid(metadata: {"carrier": 'STC'});
    } else if (['4', '6'].contains(normalized[2])) {
      return const Valid(metadata: {"carrier": "Mobily"});
    } else if (['8', '9'].contains(normalized[2])) {
      return const Valid(metadata: {"carrier": "Zain"});
    } else if (['70', '71', '72'].contains(normalized.substring(2, 4))) {
      return const Valid(metadata: {"carrier": "Virgin"});
    } else if (['74', '75'].contains(normalized.substring(2, 4))) {
      return const Valid(metadata: {"carrier": "Red Bull"});
    } else if (['76', '78'].contains(normalized.substring(2, 4))) {
      return const Valid(metadata: {"carrier": "Lebara"});
    } else if (normalized[2] == '1') {
      return const Valid(metadata: {"carrier": "Salam"});
    } else {
      return const Invalid("Invalid mobile number");
    }
  }
  return const Invalid("Invalid mobile number");
}
