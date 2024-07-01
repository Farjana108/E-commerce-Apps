import 'package:crafty_bay_ecomarc_apps/presentation/screens/cart_list_screen.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/screens/category_list_screen.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/screens/home_screen.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/screens/wish_list_screen.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/state_holders/home_slider_controller.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/state_holders/new_product_list_controller.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/state_holders/popular_product_list_controller.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/state_holders/special_product_list_controller.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/utility/apps_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../state_holders/category_list_controller.dart';

class MainBottomNavBarScreen extends StatefulWidget {
  const MainBottomNavBarScreen({super.key});

  @override
  State<MainBottomNavBarScreen> createState() => _MainBottomNavBarScreenState();
}

class _MainBottomNavBarScreenState extends State<MainBottomNavBarScreen> {
  final MainBottomNavBarController _navbarcontroller =
      Get.find<MainBottomNavBarController>();

  final List<Widget> _screens = const [
    HomeScreen(),
    CategoryListScreen(),
    CartListScreen(),
    WishListScreen(),
  ];

  @override
  void initState() {
    super.initState();
    Get.find<HomeSliderController>().getSlider();
    Get.find<CategoryListController>().getCategoryList();
    Get.find<PopularProductListController>().getPopularProductList();
    Get.find<SpecialProductListController>().getSpecialProductList();
    Get.find<NewProductListController>().getNewProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MainBottomNavBarController>(
        builder: (_) {
          return _screens[_navbarcontroller.selectedIndex];
        },
      ),
      bottomNavigationBar: GetBuilder<MainBottomNavBarController>(builder: (_) {
        return BottomNavigationBar(
          currentIndex: _navbarcontroller.selectedIndex,
          onTap: _navbarcontroller.changeIndex,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Category',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined),
              label: 'Wishlist',
            ),
          ],
        );
      }),
    );
  }
}
