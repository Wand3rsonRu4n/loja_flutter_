import 'package:aula_estado/model/category_model.dart';
import 'package:aula_estado/model/product_model.dart';

class ProductData {
  static List<Product> products = [
    Product(
      productId: 0,
      productName: "Ferradura da seca",
      productRating: 3.6,
      productPrice: 109.99,
      isFavourite: false,
      productCategoryId: [0, 3],
    ),
    Product(
      productId: 1,
      productName: "Eterna",
      productRating: 3.9,
      productPrice: 299.99,
      isFavourite: true,
      productCategoryId: [0, 4],
    ),
    Product(
      productId: 2,
      productName: "Amansa menino",
      productRating: 4.7,
      productPrice: 155.99,
      isFavourite: false,
      productCategoryId: [1],
    ),
    Product(
      productId: 3,
      productName: "puff macia",
      productRating: 4.2,
      productPrice: 274.99,
      isFavourite: true,
      productCategoryId: [0, 2, 3],
    ),
    Product(
      productId: 4,
      productName: "Meia vida",
      productRating: 4.4,
      productPrice: 174.99,
      isFavourite: true,
      productCategoryId: [0, 4],
    ),
  ];
}

class CategoryData {
  static List<Category> categories = [
    Category(categoryId: 0, categoryName: "Popular", isSelected: true),
    Category(categoryId: 1, categoryName: "mães compra"),
    Category(categoryId: 2, categoryName: "Mais visto"),
    Category(categoryId: 3, categoryName: "Lançamento"),
    Category(categoryId: 4, categoryName: "Tendência"),
    Category(categoryId: 5, categoryName: "Casa & Cozinha"),
    Category(categoryId: 6, categoryName: "Beleza & Cuidado Pessoal"),
  ];

  static Category getSelectedCategory() {
    return categories.firstWhere((element) => element.isSelected);
  }

  static void setIsSelected(int categoryId) {
    for (var category in categories) {
      category.isSelected = category.categoryId == categoryId;
    }
  }
}
