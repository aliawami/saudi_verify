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
  });
}
