import 'dart:io';
import 'dart:convert';

void main() async {
  final directory = Directory('assets/images');
  if (!directory.existsSync()) {
    directory.createSync(recursive: true);
  }

  // A valid 1x1 Blue PNG
  const String bluePngBase64 =
      'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNkYPj/HwADAgGA/2FChQAAAABJRU5ErkJggg==';
  final List<int> validPngBytes = base64Decode(bluePngBase64);

  final filenames = [
    'restaurant_azure.png',
    'restaurant_bistro.png',
    'food_salmon.png',
    'food_steak.png',
    'food_burger.png',
    'food_latte.png',
    'food_bruschetta.png',
    'food_risotto.png',
  ];

  for (final name in filenames) {
    File('assets/images/$name').writeAsBytesSync(validPngBytes);
    print('Created valid assets/images/$name');
  }
}
