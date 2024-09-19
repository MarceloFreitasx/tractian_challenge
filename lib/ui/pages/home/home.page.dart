import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../components/components.dart';
import '../../styles/styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(AppAssets.logo),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CompanyButton(
              title: "Jaguar Unit",
              onPressed: () {
                //TODO: Implement onPressed function
              },
            ),
            const SizedBox(height: 40),
            CompanyButton(
              title: "Tobias Unit",
              onPressed: () {
                //TODO: Implement onPressed function
              },
            ),
            const SizedBox(height: 40),
            CompanyButton(
              title: "Apex Unit",
              onPressed: () {
                //TODO: Implement onPressed function
              },
            ),
          ],
        ),
      ),
    );
  }
}
