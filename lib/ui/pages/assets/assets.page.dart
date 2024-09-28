import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../components/components.dart';
import '../../styles/styles.dart';
import '../pages.dart';

class AssetsPage extends GetView<AssetsController> {
  const AssetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            const SliverAppBar(
              title: Text("Assets"),
              pinned: false,
              floating: true,
              snap: true,
              systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: AppColors.darkGunmetal),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    TextFieldInput(
                      controller: controller.searchController,
                      hintText: "Buscar Ativos ou Local",
                      prefixIcon: Icons.search,
                      onEditingComplete: controller.filter,
                      onChanged: controller.onChangedSearch,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Obx(() => FilterButton(
                              "Sensor de Energia",
                              icon: Icons.bolt_outlined,
                              active: controller.filterByEnergySensor,
                              onPressed: controller.switchFilterByEnergySensor,
                            )),
                        const SizedBox(width: 8),
                        Obx(() => FilterButton(
                              "Crítico",
                              icon: Icons.info_outline_rounded,
                              active: controller.filterByCriticalStatus,
                              onPressed: controller.switchFilterByCriticalStatus,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Divider(height: 1, color: AppColors.gray100),
            ),
          ];
        },
        body: Obx(() => controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  final node = controller.nodes[index];
                  return Padding(
                    padding: EdgeInsets.only(left: node.level * 16, bottom: 8),
                    child: AssetCard(
                      title: node.name ?? '',
                      preffixIcon: node.preffixIcon,
                      suffixIcon: node.suffixIcon,
                      suffixIconColor: node.suffixIconColor,
                      hasNext: node.hasNext,
                    ),
                  );
                },
                itemCount: controller.nodes.length,
              )),
      ),
    );
  }
}
