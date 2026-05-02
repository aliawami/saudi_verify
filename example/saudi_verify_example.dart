import 'package:saudi_verify/saudi_verify.dart';

void main() {
  var nationalID = '1234567890';
  var mobile = '0555555555';
  var vat = '312345678901233';
   var iban = 'SA0380000000608010167519';

   // National ID validation
  var nationalIDResult = validateNationalID(nationalID);
  switch (nationalIDResult) {
    case Valid(:final metadata):
      print('National ID is valid: $metadata');
    case Invalid(:final reason):
      print('National ID is invalid: $reason');
  }

  // Mobile validation
  var mobileResult = validateMobile(mobile);
  switch (mobileResult) {
    case Valid(:final metadata):
      print('Mobile is valid: $metadata');
    case Invalid(:final reason):
      print('Mobile is invalid: $reason');
  }

  // IBAN validation
  var ibanResult = validateIBAN(iban);
  switch (ibanResult) {
    case Valid(:final metadata):
      print('IBAN is valid: $metadata');
    case Invalid(:final reason):
      print('IBAN is invalid: $reason');
  }

  // VAT validation
  var vatResult = validateVAT(vat);
  switch (vatResult) {
    case Valid(:final metadata):
      print('VAT is valid: $metadata');
    case Invalid(:final reason):
      print('VAT is invalid: $reason');
  }

}
