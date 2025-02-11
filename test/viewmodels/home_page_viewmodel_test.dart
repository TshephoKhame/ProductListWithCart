import 'package:flutter_test/flutter_test.dart';
import 'package:product_list/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('HomePageViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
