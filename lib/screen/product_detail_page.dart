import 'package:cart_api/models/cart_model.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import '../../widget_constant/row_text.dart';

class ProductsDetailPage extends StatefulWidget {
  final List<CartItem> products;

  const ProductsDetailPage({
    super.key,
    required this.products,
  });

  @override
  State<ProductsDetailPage> createState() => _ProductsDetailPageState();
}

class _ProductsDetailPageState extends State<ProductsDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Product Details",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            CupertinoIcons.back,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
      backgroundColor: Colors.grey,
      body: ListView.builder(
        itemCount: widget.products.length,
        itemBuilder: (_, index) {
          var cart = widget.products[index];
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Card(
              color: Colors.blue.shade200,
              elevation: 5,
              child: ListTile(
                title: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RowText(keys: "ID: ", value: "${cart.id}"),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Title: ",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              width: 250,
                              child: Text(
                                cart.title,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        RowText(keys: "Price: ", value: "${cart.price}"),
                        RowText(keys: "Quantity: ", value: "${cart.quantity}"),
                        RowText(keys: "Total: ", value: "${cart.total}"),
                        RowText(
                          keys: "DiscountPercentage: ",
                          value: "${cart.discountPercentage}",
                        ),
                        RowText(
                          keys: "DiscountedPrice: ",
                          value: "${cart.discountedTotal}",
                        ),
                      ],
                    ),
                    Positioned(
                      right: 0,
                      top: 50,
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (_) {
                              return Center(
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AlertDialog(
                                        title: Image.network(
                                          cart.thumbnail,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      CircleAvatar(
                                        radius: 25,
                                        backgroundColor: Colors.black,
                                        child: IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: const Icon(
                                            Icons.close,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Image.network(
                          cart.thumbnail,
                          height: 150,
                          width: 100,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
