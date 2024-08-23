class Cart {
  int id;
  num total;
  num discountedTotal;
  num userId;
  num totalProducts;
  num totalQuantity;
  List<CartItem> products;

  Cart({
    required this.id,
    required this.products,
    required this.total,
    required this.discountedTotal,
    required this.userId,
    required this.totalProducts,
    required this.totalQuantity,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    List<CartItem> allProduct = [];

    for (Map<String, dynamic> eachMap in json["products"]) {
      allProduct.add(CartItem.fromJson(eachMap));
    }

    return Cart(
      id: json["id"],
      products: allProduct,
      total: json["total"],
      discountedTotal: json["discountedTotal"],
      userId: json["userId"],
      totalProducts: json["totalProducts"],
      totalQuantity: json["totalQuantity"],
    );
  }
}

class CartItem {
  int id;
  String title;
  num price;
  num quantity;
  num total;
  num discountPercentage;
  num discountedTotal;
  String thumbnail;

  CartItem({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.total,
    required this.discountPercentage,
    required this.discountedTotal,
    required this.thumbnail,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json["id"],
      title: json["title"],
      price: json["price"],
      quantity: json["quantity"],
      total: json["total"],
      discountPercentage: json["discountPercentage"],
      discountedTotal: json["discountedTotal"],
      thumbnail: json["thumbnail"],
    );
  }
}

class CartDataModel {
  int total;
  int skip;
  int limit;
  List<Cart> carts;

  CartDataModel({
    required this.total,
    required this.skip,
    required this.limit,
    required this.carts,
  });

  factory CartDataModel.fromJson(Map<String, dynamic> json) {
    List<Cart> allCart = [];

    for (Map<String, dynamic> eachMap in json["carts"]) {
      allCart.add(Cart.fromJson(eachMap));
    }

    return CartDataModel(
      total: json["total"],
      skip: json["skip"],
      limit: json["limit"],
      carts: allCart,
    );
  }
}
