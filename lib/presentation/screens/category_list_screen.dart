import 'package:crafty_bay_ecomarc_apps/presentation/state_holders/category_list_controller.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/widgets/category_item.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/widgets/centered_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        Get.find<MainBottomNavBarController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Category"),
          leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavBarController>().backToHome();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: GetBuilder<CategoryListController>(
            builder: (categoryListController) {

              if(categoryListController.inProgress){
                return CentredCircularProgressIndicator();
              }
          return RefreshIndicator(
            onRefresh:categoryListController.getCategoryList,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 0.75,
              ),
              itemCount: categoryListController.categoryList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: CategoryItem(
                    category: categoryListController.categoryList[index],
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
