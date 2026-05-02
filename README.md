# saudi_verify

Dart validators for Saudi national ID / Iqama, mobile numbers, IBAN, and VAT numbers.

## Installation

```sh
dart pub add saudi_verify
```

## Requirements
Dart 3.0 or later.

## Usage

Import the library and handle results with `switch` on the sealed `ValidationResult` type (`Valid` vs `Invalid`).

### National ID

```dart
import 'package:saudi_verify/saudi_verify.dart';

switch (validateNationalID('1000000000')) {
   case Valid(:final metadata):
      print(metadata);
   case Invalid(:final reason):
      print(reason);
}

```

### Mobile

```dart
import 'package:saudi_verify/saudi_verify.dart';

switch (validateMobile('0501234567')) {
   case Valid(:final metadata):
      print(metadata);
   case Invalid(:final reason):
      print(reason);
}

```

### IBAN

```dart
import 'package:saudi_verify/saudi_verify.dart';

switch (validateIBAN('SA0380000000608010167519')) {
   case Valid(:final metadata):
      print(metadata);
   case Invalid(:final reason):
      print(reason);
}

```

### VAT

```dart
import 'package:saudi_verify/saudi_verify.dart';

switch (validateVAT('312345678901233')) {
   case Valid(:final metadata):
      print(metadata);
   case Invalid(:final reason):
      print(reason);
}

```

## Metadata on success

When validation returns `Valid`, the `metadata` map may contain the following keys (depending on the validator):

| Validator | Key | Meaning / example values |
|-----------|-----|---------------------------|
| `validateNationalID` | `idType` | `"citizen"` if the number starts with `1`, `"iqama"` if it starts with `2` |
| `validateMobile` | `carrier` | Mobile operator label, e.g. `STC`, `Mobily`, `Zain`, `Virgin`, `Red Bull`, `Lebara`, `Salam` |
| `validateIBAN` | `countryCode` | ISO country letters from the IBAN (e.g. `SA`) |
| `validateIBAN` | `checkDigits` | Two check digits from the IBAN |
| `validateIBAN` | `bban` | Basic bank account number (remaining 20 characters after country + check digits) |
| `validateVAT` | `issuingAuthority` | `"ZATCA"` |

For a runnable demo, see [`example/saudi_verify_example.dart`](example/saudi_verify_example.dart).
