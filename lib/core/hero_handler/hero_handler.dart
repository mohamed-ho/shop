import 'package:shop/features/home/data/models/product_model.dart';
import 'package:shop/features/orders/domain/entities/order_product.dart';

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

  static String orderProductImageTag(OrderProduct product) {
    return product.title + product.image;
  }

  static String orderProductDescriptionTag(OrderProduct product) {
    return product.title + product.description;
  }

  static String orderProductTitleTag(OrderProduct product) {
    return product.title + product.title;
  }
}
