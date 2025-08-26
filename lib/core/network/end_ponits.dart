class EndPoint {
  static String baseUrl = "https://supermarket-dan1.onrender.com/api/v1/";
  static String signIn = "auth/signIn";
  static String signUp = "auth/signUp";
  static String resentEmail = "auth/resetPassCode";
  static String verfication = "auth/activeResetPass";
  static String newpassword = "auth/resetPassword";
  static String getProduct = "home/products";
  static String getCategories = "home/categories";
  static String getBrands = "home/brands";
   static String getcart = "user/getCart";
    static String postcart = "user/addCart";
    static String search = "home/productsFilter";
     static String deletecart = "user/deleteCart";
     static String failtering = "home/productsFilter";
      static String getfavorite = "user/getFavorite";
       static String postfavorite = "user/addFavorite";
        static String deletefavorite = "user/deleteCart";
  static String getUserData = "portfoilo/userData";
  static String postimageData = "portfoilo/addImage";
  static String productDetailsByCategory({
    required String category,
    int skip = 0,
    int limit = 10,
  }) {
    return "home/products/category/$category?skip=$skip&limit=$limit";
  }
   static String productDetailsByBrands({
    required String brands,
    int skip = 0,
    int limit = 10,
  }) {
    return "home/products/brand/$brands?skip=$skip&limit=$limit";
  }

}

class ApiKey {
  static String email = "email";
  static String password = "password";
  static String token = "token";
  static String code = "code";
  static String message = "message";
  static String id = "id";
  static String name = "name";
  static String phone = "phone";
   static String search = "search";
    static String skip = "skip";
     static String limit = "limit";
  static String confirmPassword = "confirmPassword";
}
