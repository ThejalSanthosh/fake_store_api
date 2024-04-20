import 'package:cached_network_image/cached_network_image.dart';
import 'package:fake_task/controller/cart_controller.dart';
import 'package:fake_task/controller/home_controller.dart';
import 'package:fake_task/global_widgets/reuseable_loading_indicator.dart';
import 'package:fake_task/model/product_res_model.dart';
import 'package:fake_task/view/cart_screen/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<HomeController>(context, listen: false).getProducts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeScreenState = Provider.of<HomeController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckoutScreen(),
                  ));
            },
            child: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: homeScreenState.isLoading == true
          ? ReusableLoadingIndicator()
          : Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      itemCount: homeScreenState.lstProductModel.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        ProductResModel productResModel =
                            homeScreenState.lstProductModel[index];
                        return Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          // decoration: BoxDecoration(color: Colors.grey),
                          child: Column(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: CachedNetworkImage(
                                        imageUrl: productResModel.image ?? "",
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                    ),
                                    Spacer(),
                                    CircleAvatar(
                                      radius: 18,
                                      child: Consumer<CartController>(
                                        builder: (context, value, child) =>
                                            InkWell(
                                          onTap: () {
                                            value.addProductCart(productResModel);
                                            
                                          },
                                          child: Icon(
                                            Icons.shopping_cart_checkout,
                                        
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Text(productResModel.title ?? "")
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
