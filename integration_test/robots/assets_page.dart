import 'package:flutter_test/flutter_test.dart';
import 'package:tractian_challenge/ui/components/components.dart';

import 'robots.dart';

class AssetsPageRobot {
  AssetsPageRobot(this.tester);

  final WidgetTester tester;
  late Finder company;

  Future<void> run() async {
    await HomePageRobot(tester).run();
    await tester.pumpAndSettle();
    await tester.runAsync(() async {
      await verify();
      await searchAsset();
      await validation();
    });
  }

  Future<void> verify() async {
    company = find.byType(AssetCard).first;
    expect(company, findsOneWidget);
  }

  Future<void> searchAsset() async {
    final emailField = find.byType(TextFieldInput);
    await tester.enterText(emailField, "stage");
    await tester.pump();
  }

  Future<void> validation() async {
    await tester.pumpAndSettle(const Duration(seconds: 1));
    expect(find.text("Motor H12D- Stage 1"), findsOneWidget);
  }
}
