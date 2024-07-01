import 'package:crafty_bay_ecomarc_apps/presentation/screens/product_list_screen.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/utility/apps_colors.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/widgets/network_image_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/category_data.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => ProductListScreen(
            categoryName: category.categoryName ?? '',
            categoryId: category.id!,
          ),
        );
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.12),
                borderRadius: BorderRadius.circular(16)),
            child: NetworkImageWidgets(
              url: category.categoryImg ?? ' ',
              height: 30,
              widget: 30,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            category.categoryName ?? '',
            maxLines: 1,
            style: const TextStyle(
                fontSize: 16,
                color: AppColors.primaryColor,
                overflow: TextOverflow.ellipsis,
                letterSpacing: 0.4,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
