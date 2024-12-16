import 'package:intl/intl.dart';

class EndPoints {
  static const String baseUrl = "https://fakestoreapi.com/";
  static const String productUrl = "${baseUrl}products/";
  static const String getAllProductUrl = "${baseUrl}products";

  static const String addNewProductUrl = "${baseUrl}products";
  static const String getCategoriesUrl = "${productUrl}categories";

  static String getSingleProductUrl({required int id}) {
    return "$productUrl$id";
  }

  static String getLimitProductUrl({required int numberOrProduct}) {
    return "$productUrl?limit=$numberOrProduct";
  }

  static String getProductInCategoryUrl({required String category}) {
    return "${productUrl}category/$category";
  }

  static String updateProductUrl({required int id}) {
    return "$productUrl$id";
  }

  static String deleteProductUrl({required int id}) {
    return "$productUrl$id";
  }

  static const String cartUrl = "${baseUrl}carts/";
  static const String addCartUrl = "${baseUrl}carts";
  static const String getAllCartUrl = "${baseUrl}carts";
  static String getSingleCartUrl({required int id}) {
    return "$cartUrl$id";
  }

  static String getLimitCartUrl({required int numberOrProduct}) {
    return "$cartUrl?limit=$numberOrProduct";
  }

  static String getCartInRangeDateUrl(
      {required DateTime start, required DateTime end}) {
    return "$addCartUrl?startdate=${DateFormat('yyyy-MM-dd').format(start)}&enddate=${DateFormat('yyyy-MM-dd').format(end)}";
  }

  static String getCartOfMeanUserUrl({required int userId}) {
    return "${cartUrl}user/$userId";
  }

  static String updateCartUrl({required int id}) {
    return "$cartUrl$id";
  }

  static String deleteCartUrl({required int id}) {
    return "$cartUrl$id";
  }

  static const String userUrl = "${baseUrl}users/";
  static String getUserDataUrl({required int id}) {
    return "$userUrl$id";
  }

  static const String addUserUrl = "${baseUrl}users";

  static String updateUserUrl({required int id}) {
    return "$userUrl$id";
  }

  static String deleteUserUrl({required int id}) {
    return "$userUrl$id";
  }

  static const String loginUrl = "${baseUrl}auth/login";
}
