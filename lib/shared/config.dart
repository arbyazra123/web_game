class Config {
  static const String baseEndpoint = "https://www.sumbermarket.com";
  static const String routeKey = "route";
  static const String apiTokenKey = "api_token";

  static const String apiTokenValue =
      "tOE68YcjdmMNnIdzHivsFkP6lD6MAJ8773ErhDFztVAgetRZZE2uftUzUzBLbY2xICHmzwrCyBC7iAnl7pMBjjCjXQMvKRBAHETZmxYbSj2qbpfDcECxEWS7jwfTxVN37N48D5tsX0Q5vNRFZi0ab23pp4Fk4fVsgEieHrAHlvt2DJzABMczBQeBdAY0MRpalXNgVJyPEAVTL2xw0o8EeIowmdocAm60EufU5NowCX1auuvzmnOJmB8rfQSYjhWY";
  static const String login = "api/login";

  static const String customer = "api/customer";
  static const String customerLogin = "api/qonfusee/login";
  static const String customerRegister = "api/qonfusee/register";
  static const String customerLogout = "api/qonfusee/logout";
  static const String customerProfile = "api/qonfusee/getprofile";
  static const String customerUpdateProfile = "api/qonfusee/editprofile";
  static const String customerUpdatePassword = "api/qonfusee/changepassword";

  static const String shippingMethodUpdate = "api/shipping/method";
  static const String shippingAddressUpdate = "api/shipping/address";
  static const String shippingMethods = "api/shipping/methods";

  static const String paymentMethodUpdate = "api/payment/method";
  static const String paymentAddressUpdate = "api/payment/address";
  static const String paymentMethods = "api/payment/methods";
  
  static const String addOrder = "api/order/add";
  static const String getInvoiceUrl = "api/qonfusee/process_order";
  static const String getOrderHistory = "api/qonfusee/order_histories";
  static const String getOrderDetail = "api/qonfusee/order_info";

  static const String apiCategories = "api/qonfusee/categories";
  static const String products = "api/qonfusee/products";
  static const String product = "api/qonfusee/product";
  static const String cartProducts = "api/cart/products";
  static const String addProductToCart = "api/cart/add";
  static const String editProductFromCart = "api/cart/edit";
  static const String banners = "api/qonfusee/banners";
  
  static const String indonesianCountry = "checkout/checkout/country";
}
