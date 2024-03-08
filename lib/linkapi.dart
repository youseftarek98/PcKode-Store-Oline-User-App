class AppLink {
  //static const String server = 'https://queenpharmaeg.com/ecommercepckod';

  static const String server = 'https://pckodstore.com/ecommerce';

  ///============================= Image =============================

  static const String imagetest = 'https://pckodstore.com/ecommerce/upload';

  // static const String imagetest =
  //     'https://queenpharmaeg.com/ecommercepckod/upload';
  static const String imageCategories = '$imagetest/categories';
  static const String imageItems = '$imagetest/items';

  ///=====================================================================

  static const String test = '$server/test.php';

  ///=========================== Notification =========================== 
  static const String notification = '$server/notification.php';

  ///========================= Auth ======================================
  static const String signUp = '$server/auth/signup.php';

  static const String login = '$server/auth/login.php';

  static const String verifycodesignup = '$server/auth/verfiycode.php';

  static const String resend = '$server/auth/resend.php';

  ///========================= ForgetPassword ===========================
  static const String checkEmail = '$server/forgetpassword/checkemail.php';

  static const String resetPassword =
      '$server/forgetpassword/resetpassword.php';

  static const String verifycodeforgetpassword =
      '$server/forgetpassword/verifycode.php';

  ///========================= Home ===========================

  static const String homepage = '$server/home.php';

  ///========================= Items ===========================

  static const String items = '$server/items/items.php';
  static const String searchitems = '$server/items/search.php';

  ///=========================== Favorite ========================
  static const String favoriteAdd = '$server/favorite/add.php';
  static const String favoriteRemove = '$server/favorite/remove.php';
  static const String favoriteView = '$server/favorite/view.php';
  static const String deletefromfavorite =
      '$server/favorite/deletefromfavorite.php';

  ///=========================== Cart ===========================
  static const String cartview = '$server/cart/view.php';
  static const String cartadd = '$server/cart/add.php';
  static const String cartdelete = '$server/cart/delete.php';
  static const String cartgetcountitems = '$server/cart/getcountitems.php';

  ///=========================== Address ===========================
  static const String addressview = '$server/address/view.php';
  static const String addressAdd = '$server/address/add.php';
  static const String addressEdit = '$server/address/edit.php';
  static const String addressDelete = '$server/address/delete.php';

  ///=========================== Coupon ===========================
  static const String checkcoupon = '$server/coupon/checkcoupon.php';

  ///=========================== checkout ===========================
  static const String checkout = '$server/orders/checkout.php';

  static const String pendingorders = '$server/orders/pending.php';
  static const String archiveorders = '$server/orders/archive.php';
  static const String ordersdetails = '$server/orders/details.php';
  static const String ordersdelete = '$server/orders/delete.php';
  static const String ordersarchive = '$server/orders/archive.php';

  ///=========================== Offers ===========================
  static const String offers = '$server/offers.php';

  ///=========================== Rating ===========================
  static const String rating = '$server/rating.php';

}
