import 'package:fake_task/model/product_res_model.dart';

class CartModel{


 final ProductResModel productResModel;
 final int quantity;

  CartModel({required this.productResModel,  this.quantity=1});

 
}