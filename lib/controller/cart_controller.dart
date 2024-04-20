import 'dart:developer';

import 'package:fake_task/model/cart_model.dart';
import 'package:fake_task/model/product_res_model.dart';
import 'package:flutter/material.dart';

class CartController with ChangeNotifier {
  List<CartModel> lstCartModel = [];
  bool isProductExists = false;

  void addProductCart(ProductResModel productResModel) {
    for (int i = 0; i < lstCartModel.length; i++) {
      if (lstCartModel[i].productResModel.id == productResModel.id) {
        isProductExists = true;
        break;
      }
    }
    if (isProductExists == false) {
      lstCartModel.add(CartModel(productResModel: productResModel));
      notifyListeners();
    } else {
      log("Product Already exists");
    }
  }

  void deleteCartProduct(var id) {
    for (var items in lstCartModel) {
      if (items.productResModel.id == id) {
        lstCartModel.remove(items);

        notifyListeners();
        return;
      }
    }

    notifyListeners();
  }
}
