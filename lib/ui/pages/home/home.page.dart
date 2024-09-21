import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../components/components.dart';
import '../../styles/styles.dart';
import '../pages.dart';

class HomePage extends GetView<HomeController> {
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
          child: Obx(
            () => ListView.separated(
              itemBuilder: (_, index) {
                final company = controller.companies[index];

                return CompanyButton(
                  title: company.name!,
                  onPressed: () => controller.goToCompanyAssets(company.id!),
                );
              },
              separatorBuilder: (_, __) => const SizedBox(height: 40),
              itemCount: controller.companies.length,
            ),
          )),
    );
  }
}
