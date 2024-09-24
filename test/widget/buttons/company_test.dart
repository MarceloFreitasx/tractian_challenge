import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tractian_challenge/ui/components/components.dart';

import '../helpers.dart';

void main() {
  group("Component CompanyButton widgets tests:", () {
    const title = "Jaguar";
    const icon = Icons.abc;

    testWidgets("Should pump CompanyButton with correct text and icon",
        (WidgetTester tester) async {
      await tester.pumpWidget(
        makeTestable(const CompanyButton(
          title: title,
          icon: icon,
        )),
      );

      await tester.pumpAndSettle();
      expect(find.text(title), findsOneWidget);
      expect(find.byIcon(icon), findsOneWidget);
    });
  });
}
