import 'package:saudi_verify/src/validation_result.dart';
import 'package:saudi_verify/src/vat.dart';
import 'package:test/test.dart';

void main() {
  group('VAT Validation', () {
    test('Empty entry', () {
      var vat = '';
      var result = validateVAT(vat);
      expect(result, isA<Invalid>());
    });

    test('Invalid VAT', () {
      var vat = '123456789012345';
      var result = validateVAT(vat);
      expect(result, isA<Invalid>());
    });

    test('Valid VAT', () {
      var vat = '312345678901233';
      var result = validateVAT(vat);
      expect(result, isA<Valid>());
    });

    test('Start with 3 but not end with 3', () {
      var vat = '312345678901231';
      var result = validateVAT(vat);
      expect(result, isA<Invalid>());
    });

    test('End with 3 but not start with 3', () {
      var vat = '112345678901233';
      var result = validateVAT(vat);
      expect(result, isA<Invalid>());
    });

    test('Wrong length (large)', () {
      var vat = '3123456789012313';
      var result = validateVAT(vat);
      expect(result, isA<Invalid>());
    });

    test('Wrong length (small)', () {
      var vat = '312345012313';
      var result = validateVAT(vat);
      expect(result, isA<Invalid>());
    });

    test('Vat with alphabetic characters', () {
      var vat = '312B45678901233';
      var result = validateVAT(vat);
      expect(result, isA<Invalid>());
    });
  });
}
