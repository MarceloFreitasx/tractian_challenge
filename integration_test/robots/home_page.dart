import 'package:flutter_test/flutter_test.dart';
import 'package:tractian_challenge/ui/components/components.dart';
import 'package:tractian_challenge/ui/pages/pages.dart';

import '../utils/utils.dart';

class HomePageRobot {
  HomePageRobot(this.tester);

  final WidgetTester tester;
  late Finder company;

  Future<void> run() async {
    await tester.runAsync(() async {
      await verify();
      await validation();
    });
  }

  Future<void> verify() async {
    await TestHelper.pumpApp(tester);
    await tester.pumpAndSettle(const Duration(seconds: 1));
    company = find.byType(CompanyButton).first;
    expect(company, findsOneWidget);
  }

  Future<void> validation() async {
    await tester.tap(company.first);
    await tester.pumpAndSettle(const Duration(seconds: 1));
    expect(find.byType(AssetsPage), findsOneWidget);
  }
}
