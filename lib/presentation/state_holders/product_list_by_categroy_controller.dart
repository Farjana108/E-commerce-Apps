import 'package:crafty_bay_ecomarc_apps/data/models/network_response.dart';
import 'package:crafty_bay_ecomarc_apps/data/models/product.dart';
import 'package:crafty_bay_ecomarc_apps/data/network_caller/network_caller.dart';
import 'package:crafty_bay_ecomarc_apps/data/utility/urls.dart';
import 'package:get/get.dart';

import '../../data/models/product_list_model.dart';

class ProductListByCategoryController extends GetxController {
  bool _inProgress = false;

  String _errorMessage = '';
  List<Product> _productList = [];

  bool get inProgress => _inProgress;

  List<Product> get productList => _productList;

  String get errorMessage => _errorMessage;

  Future<bool> getProductList(int categoryId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
      url: Urls.productListbyCategory(categoryId),
    );

    if (response.isSuccess) {
      _productList =
          ProductListModel.fromJson(response.responseData).productList ?? [];
    } else {
      _errorMessage = response.errorMessage!;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
