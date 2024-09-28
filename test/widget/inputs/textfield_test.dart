import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tractian_challenge/ui/components/components.dart';

import '../helpers.dart';

void main() {
  group("Component AssetCard widgets tests:", () {
    const title = "Machinery House";
    const icon = Icons.room_outlined;

    testWidgets("Should pump AssetCard with correct text and icon", (WidgetTester tester) async {
      await tester.pumpWidget(
        makeTestable(const AssetCard(
          title: title,
          preffixIcon: icon,
        )),
      );

      await tester.pumpAndSettle();
      expect(find.text(title), findsOneWidget);
      expect(find.byIcon(icon), findsOneWidget);
    });
  });
}
