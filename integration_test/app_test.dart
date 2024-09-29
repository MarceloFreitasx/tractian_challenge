import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:tractian_challenge/env/env.dart';

import 'robots/robots.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
  Env();

  group('end-to-end test', () {
    testWidgets(
      'Should tap on company card and go to Assets Page',
      (tester) async => await HomePageRobot(tester).run(),
    );

    testWidgets(
      'Should test filters in the Assets Page',
      (tester) async => await AssetsPageRobot(tester).run(),
    );
  });
}
