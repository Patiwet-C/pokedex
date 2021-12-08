import 'package:flutter_test/flutter_test.dart';

import 'package:pokedex/main.dart';

void main() {
  group('PokedexApp', () {
    testWidgets('render correctly', (WidgetTester tester) async {
      await tester.pumpWidget(PokedexApp());
    });
  });
}
