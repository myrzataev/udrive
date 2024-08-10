import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:udrive/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.logo).existsSync(), isTrue);
    expect(File(Images.apple).existsSync(), isTrue);
    expect(File(Images.boss).existsSync(), isTrue);
    expect(File(Images.bubble).existsSync(), isTrue);
    expect(File(Images.car).existsSync(), isTrue);
    expect(File(Images.excited).existsSync(), isTrue);
    expect(File(Images.global).existsSync(), isTrue);
    expect(File(Images.google).existsSync(), isTrue);
    expect(File(Images.hand).existsSync(), isTrue);
    expect(File(Images.icon).existsSync(), isTrue);
    expect(File(Images.logowithouttext).existsSync(), isTrue);
    expect(File(Images.man).existsSync(), isTrue);
    expect(File(Images.mockup).existsSync(), isTrue);
    expect(File(Images.track).existsSync(), isTrue);
    expect(File(Images.udrive).existsSync(), isTrue);
  });
}
