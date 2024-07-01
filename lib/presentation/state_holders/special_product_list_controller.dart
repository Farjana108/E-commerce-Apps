import 'package:get/get.dart';

import '../../data/models/network_response.dart';
import '../../data/models/product.dart';
import '../../data/models/product_list_model.dart';
import '../../data/network_caller/network_caller.dart';
import '../../data/utility/urls.dart';

class SpecialProductListController extends GetxController {
  bool _specialProductInProgress = false;

  List<Product> _productList = [];

  String _errorMessage = '';

  bool get specialProductInProgress => _specialProductInProgress;

  List<Product> get productList => _productList;

  String get errorMessage => _errorMessage;

  Future<bool> getSpecialProductList() async {
    bool isSuccess = false;
    _specialProductInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
        url: Urls.productListByRemark('special'));
    if (response.isSuccess) {
      _productList =
          ProductListModel.fromJson(response.responseData).productList ?? [];
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage!;
    }
    _specialProductInProgress = false;
    update();
    return isSuccess;
  }
}
