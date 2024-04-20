import 'package:fake_task/controller/cart_controller.dart';
import 'package:fake_task/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomCartWidgets extends StatelessWidget {
  CustomCartWidgets({super.key, this.cartModel});

  final CartModel? cartModel;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.network(
                      cartModel?.productResModel.image ?? "",
                      scale: 2,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cartModel?.productResModel.title ?? "",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          cartModel?.productResModel.price.toString() ?? "",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.green)),
                              child: Icon(Icons.remove, size: 15),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "2",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.green)),
                              child: Icon(Icons.add, size: 15),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
              top: 10,
              right: 10,
              child: CircleAvatar(
                backgroundColor: Colors.green.withOpacity(.1),
                radius: 14,
                child: Consumer<CartController>(
                  builder: (context, value, child) => 
                   InkWell(
                    onTap: () {
                      value.deleteCartProduct(cartModel?.productResModel.id??"");
                    },
                     child: Icon(
                      Icons.delete,
                      size: 18,
                      color: Colors.green,
                                       ),
                   ),
                ),
              )),
        ],
      ),
    );
  }
}
