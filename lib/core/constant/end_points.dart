class EndPoints {
  static const String baseUrl = "http://10.0.2.2/shop/";

  // products URLs
  static const String productUrl = "${baseUrl}products/";
  static const String getAllProductUrl = "${productUrl}getAll.php";
  static const String addNewProductUrl = "${productUrl}add.php";
  static String deleteProductUrl = "${productUrl}delete.php";
  static String updateProductUrl = '${productUrl}update.php';
  static String getSingleProductUrl = '${productUrl}getSingle.php';

  static String getProductInCategoryUrl = "${productUrl}getByCategory.php";

  // categories URLs
  static const String categoriesUrl = "${baseUrl}categories/";
  static const String getCategoriesUrl = "${categoriesUrl}getCategories.php";
  static const String addCategoryUrl = "${categoriesUrl}addCategory.php";
  static const String updateCategoryUrl = "${categoriesUrl}updaetCategory.php";
  static const String deleteCategoryUrl = "${categoriesUrl}deleteCategory.php";

  // carts URLs
  static const String cartUrl = "${baseUrl}carts/";
  static const String addCartUrl = "${cartUrl}addcart.php";
  static const String getAllCartUrl = "${cartUrl}getAll.php";
  static const String deleteCartUrl = "${cartUrl}deleteCart.php";
  static const String getInDateRangeUrl = "${cartUrl}getInDateRange.php";
  static const String getSingleCartUrl = "${cartUrl}getSingle.php";
  static const String getUserCartsUrl = "${cartUrl}getUserCart.php";
  static const String getUserCartsInRangeDate =
      "${cartUrl}getUserCartsInRangeDate.php";

  // user URLs
  static const String userURL = "${baseUrl}users/";
  static const String signupUrl = "${userURL}signup.php";
  static const String loginUrl = "${userURL}login.php";
  static const String deleteUserUrl = "${userURL}delete.php";
  static const String updateUserUrl = "${userURL}update.php";

  // admin URLs
  static const String adminURL = "${baseUrl}admin/";
  static const String adminLoginUrl = "${adminURL}login.php";
  static const String adminAddAccountUrl = "${adminURL}addAccount.php";
  static const String adminUpdateAccontUrl = "${adminURL}updateAccount.php";
  static const String adminDeleteAccontUrl = "${adminURL}deleteAccount.php";
  static const String getAllAdminsUrl = "${adminURL}getAllAdmins.php";
}
