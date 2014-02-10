import 'package:unittest/unittest.dart';
import '../lib/mutable_string.dart';

void main() {
  const String TEST_STRING = ' Test ';

  test('Mutable String', () {

    var mutableString = new MutableString(TEST_STRING);
    expect(mutableString.string, TEST_STRING);
  });

  test('Mutable String trim', () {
    var mutableString = new MutableString(TEST_STRING);
    mutableString.trim();
    expect(mutableString.string, TEST_STRING.trim());
  });
}
