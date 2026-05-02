import 'package:saudi_verify/src/mobile.dart';
import 'package:saudi_verify/src/validation_result.dart';
import 'package:test/test.dart';

void main() {
  group('Mobile Validation', () {
    test('Empty entry', () {
      var mobile = '';
      var result = validateMobile(mobile);
      expect(result, isA<Invalid>());
    });

    test('Text entry', () {
      var mobile = '56789012a';
      var result = validateMobile(mobile);
      expect(result, isA<Invalid>());
    });

    test('8 digits', () {
      var mobile = '56789012';
      var result = validateMobile(mobile);
      expect(result, isA<Invalid>());
    });
    test('9 digits', () {
      var mobile = '567890123';
      var result = validateMobile(mobile);
      expect(result, isA<Valid>());
      // expect((result as Valid).metadata['carrier'], 'Mobily');
    });
    test('Pluse and 9 digits', () {
      var mobile = '+567890123';
      var result = validateMobile(mobile);
      expect(result, isA<Valid>());
      // expect((result as Valid).metadata['carrier'], 'Mobily');
    });

    test('10 digits with 00', () {
      var mobile = '0056789012';
      var result = validateMobile(mobile);
      expect(result, isA<Invalid>());
      // expect((result as Valid).metadata['carrier'], 'Mobily');
    });

    test('10 digits', () {
      var mobile = '0567890123';
      var result = validateMobile(mobile);
      expect(result, isA<Valid>());
      // expect((result as Valid).metadata['carrier'], 'Mobily');
    });

    test('11 digits', () {
      var mobile = '66567890123';
      var result = validateMobile(mobile);
      expect(result, isA<Valid>());
      // expect((result as Valid).metadata['carrier'], 'Mobily');
    });

    test('12 digits', () {
      var mobile = '966567890123';
      var result = validateMobile(mobile);
      expect(result, isA<Valid>());
      // expect((result as Valid).metadata['carrier'], 'Mobily');
    });

    test('13 digits', () {
      var mobile = '0966567890123';
      var result = validateMobile(mobile);
      expect(result, isA<Valid>());
      // expect((result as Valid).metadata['carrier'], 'Mobily');
    });

    test('14 digits', () {
      var mobile = '00966567890123';
      var result = validateMobile(mobile);
      expect(result, isA<Valid>());
      // expect((result as Valid).metadata['carrier'], 'Mobily');
    });

    test('12 digits and plus sign', () {
      var mobile = '+966567890123';
      var result = validateMobile(mobile);
      expect(result, isA<Valid>());
      // expect((result as Valid).metadata['carrier'], 'Mobily');
    });

    test('Mobily validation', () {
      var mobile = '0567890123';
      var result = validateMobile(mobile);
      expect(result, isA<Valid>());
      expect((result as Valid).metadata['carrier'], 'Mobily');
    });
    test('STC validation', () {
      var mobile = '0507890123';
      var result = validateMobile(mobile);
      expect(result, isA<Valid>());
      expect((result as Valid).metadata['carrier'], 'STC');
    });

    test('STC validation With 11 digits', () {
      var mobile = '66507890123';
      var result = validateMobile(mobile);
      expect(result, isA<Valid>());
      expect((result as Valid).metadata['carrier'], 'STC');
    });

    test('STC validation With +', () {
      var mobile = '+966507890123';
      var result = validateMobile(mobile);
      expect(result, isA<Valid>());
      expect((result as Valid).metadata['carrier'], 'STC');
    });
    test('Zain validation', () {
      var mobile = '0597890123';
      var result = validateMobile(mobile);
      expect(result, isA<Valid>());
      expect((result as Valid).metadata['carrier'], 'Zain');
    });
    test('Virgin validation', () {
      var mobile = '0571890123';
      var result = validateMobile(mobile);
      expect(result, isA<Valid>());
      expect((result as Valid).metadata['carrier'], 'Virgin');
    });
    test('Red Bull validation', () {
      var mobile = '0574890123';
      var result = validateMobile(mobile);
      expect(result, isA<Valid>());
      expect((result as Valid).metadata['carrier'], 'Red Bull');
    });
    test('Lebara validation', () {
      var mobile = '0578090123';
      var result = validateMobile(mobile);
      expect(result, isA<Valid>());
      expect((result as Valid).metadata['carrier'], 'Lebara');
    });
    test('Salam validation', () {
      var mobile = '0517890123';
      var result = validateMobile(mobile);
      expect(result, isA<Valid>());
      expect((result as Valid).metadata['carrier'], 'Salam');
    });
  });
}
