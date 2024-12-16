import 'package:shop/features/home/data/models/product_model.dart';

class HeroHandler {
  static String productImageTag(ProductModal product) {
    return product.title + product.image + product.image;
  }

  static String productRateTag(ProductModal product) {
    return product.title + product.image + product.rate!.rate.toString();
  }

  static String productPriceTag(ProductModal product) {
    return product.title + product.image + product.price.toString();
  }

  static String productTitleTag(ProductModal product) {
    return product.title + product.image + product.title;
  }
}
