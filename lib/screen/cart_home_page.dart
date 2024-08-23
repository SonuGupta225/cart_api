import 'dart:convert';

import 'package:cart_api/models/cart_model.dart';
import 'package:cart_api/screen/product_detail_page.dart';
import 'package:cart_api/widget_constant/row_text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CartDataModel? cartDataModel;

  @override
  void initState() {
    getCarts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Carts",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: cartDataModel != null && cartDataModel!.carts.isNotEmpty
          ? ListView.builder(
              itemCount: cartDataModel!.carts.length,
              itemBuilder: (_, index) {
                var cart = cartDataModel!.carts[index];
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Card(
                    color: Colors.blue.shade200,
                    elevation: 5,
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RowText(keys: "ID: ", value: "${cart.id}"),
                          RowText(keys: "Total: ", value: "${cart.total}"),
                          RowText(
                              keys: "DiscountedTotal: ",
                              value: "${cart.discountedTotal}"),
                          RowText(keys: "UserId: ", value: "${cart.userId}"),
                          RowText(
                              keys: "TotalProducts: ",
                              value: "${cart.totalProducts}"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RowText(
                                keys: "TotalQuantity: ",
                                value: "${cart.totalQuantity}",
                              ),
                              TextButton.icon(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (ctx) => ProductsDetailPage(
                                          products: cart.products,
                                        ),
                                      ));
                                },
                                icon: const Icon(Icons.double_arrow),
                                label: const Text(
                                  "Products",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  void getCarts() async {
    var uri = Uri.parse("https://dummyjson.com/carts");
    var response = await https.get(uri);

    if (response.statusCode == 200) {
      var mData = jsonDecode(response.body);
      cartDataModel = CartDataModel.fromJson(mData);
      setState(() {});
    }
  }
}
