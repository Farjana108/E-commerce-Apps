import 'package:crafty_bay_ecomarc_apps/presentation/state_holders/category_list_controller.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/state_holders/home_slider_controller.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/state_holders/new_product_list_controller.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/state_holders/popular_product_list_controller.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/state_holders/special_product_list_controller.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/utility/images_path.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/widgets/app_bar_icon_button.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/widgets/category_item.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/widgets/home_carusel_slider.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/widgets/product_card.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../data/models/category_data.dart';
import '../../data/models/product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildSearchTextField(),
              const SizedBox(height: 16),
              GetBuilder<HomeSliderController>(builder: (sliderController) {
                if (sliderController.inProgress) {
                  return const SizedBox(
                    height: 200,
                    child: CentredCircularProgressIndicator(),
                  );
                }
                return HomeCarouselSlider(
                  sliderList: sliderController.sliderList,
                );
              }),
              SectionHeader(
                title: 'All Catagory',
                onTapSeeAll: () {
                  Get.find<MainBottomNavBarController>().selectCategory();
                },
              ),
              const SizedBox(height: 10),
              GetBuilder<CategoryListController>(
                  builder: (categoryListController) {
                if (categoryListController.inProgress) {
                  return const SizedBox(
                    height: 120,
                    child: CentredCircularProgressIndicator(),
                  );
                }
                return _buildCategoryListView(
                    categoryListController.categoryList);
              }),
              const SizedBox(height: 10),
              SectionHeader(
                title: 'Popular',
                onTapSeeAll: () {},
              ),
              const SizedBox(height: 10),
              GetBuilder<PopularProductListController>(
                  builder: (popularProductListController) {
                if (popularProductListController.popularProductInProgress) {
                  return const SizedBox(
                    height: 210,
                    child: CentredCircularProgressIndicator(),
                  );
                }
                return _buildProductListView(
                    popularProductListController.productList);
              }),
              const SizedBox(height: 10),
              SectionHeader(
                title: 'Special',
                onTapSeeAll: () {},
              ),
              const SizedBox(height: 10),
              GetBuilder<SpecialProductListController>(
                  builder: (specialProductListController) {
                if (specialProductListController.specialProductInProgress) {
                  return const SizedBox(
                    height: 210,
                    child: CentredCircularProgressIndicator(),
                  );
                }
                return _buildProductListView(
                    specialProductListController.productList);
              }),
              const SizedBox(height: 10),
              SectionHeader(
                title: 'New',
                onTapSeeAll: () {},
              ),
              const SizedBox(height: 10),
              GetBuilder<NewProductListController>(
                  builder: (newProductListController) {
                if (newProductListController.newProductInProgress) {
                  return const SizedBox(
                    height: 210,
                    child: CentredCircularProgressIndicator(),
                  );
                }
                return _buildProductListView(
                    newProductListController.productList);
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryListView(List<Category> categoryList) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: categoryList
              .map(
                (e) => Row(
                  children: [
                    CategoryItem(category: e),
                    const SizedBox(
                      width: 8,
                    )
                  ],
                ),
              )
              .toList()),
    );
  }

  Widget _buildProductListView(List<Product> productList) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: productList.map((e) => ProductCard(product: e)).toList(),
      ),
    );
  }

  Widget _buildSearchTextField() {
    return TextField(
      controller: _searchTEController,
      decoration: InputDecoration(
        hintText: 'Search',
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: Colors.grey.shade200,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.appNavLogoSvg),
      actions: [
        AppbarIconButton(
          icon: Icons.person,
          onTap: () {},
        ),
        const SizedBox(width: 8),
        AppbarIconButton(
          icon: Icons.call,
          onTap: () {},
        ),
        const SizedBox(width: 8),
        AppbarIconButton(
          icon: Icons.notifications_on,
          onTap: () {},
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  @override
  void dispose() {
    _searchTEController;
    super.dispose();
  }
}
