import 'package:saudi_verify/src/iban.dart';
import 'package:saudi_verify/src/validation_result.dart';
import 'package:test/test.dart';

void main() {
  group('IBAN Validation', () {
    test('Empty entry', () {
      var iban = '';
      var result = validateIBAN(iban);
      expect(result, isA<Invalid>());
    });

    test('Wrong length', () {
      var iban = 'SA038000000060801016751';
      var result = validateIBAN(iban);
      expect(result, isA<Invalid>());
    });

    test('Valid IBAN', () {
      var iban = 'SA0380000000608010167519';
      var result = validateIBAN(iban);
      expect(result, isA<Valid>());
    });

    test('InValid IBAN', () {
      var iban = 'SA0380000000608010167518';
      var result = validateIBAN(iban);
      expect(result, isA<Invalid>());
    });
  });
}
