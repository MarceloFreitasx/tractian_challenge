import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tractian_challenge/ui/components/components.dart';

import '../helpers.dart';

void main() {
  group("Component FilterButton widgets tests:", () {
    const title = "Sensor de Energia";
    const icon = Icons.bolt;

    testWidgets("Should pump FilterButton with correct text and icon", (WidgetTester tester) async {
      await tester.pumpWidget(
        makeTestable(const FilterButton(
          title,
          icon: icon,
        )),
      );

      await tester.pumpAndSettle();
      expect(find.text(title), findsOneWidget);
      expect(find.byIcon(icon), findsOneWidget);
    });
  });
}
