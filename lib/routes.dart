import 'package:get/get.dart';
import 'package:pckode/core/constant/routes.dart';
import 'package:pckode/core/middleware/mymiddleware.dart';
import 'package:pckode/view/screen/address/add.dart';
import 'package:pckode/view/screen/address/adddetails.dart';
import 'package:pckode/view/screen/address/view.dart';
import 'package:pckode/view/screen/auth/forget_password/forget_passwordd.dart';
import 'package:pckode/view/screen/auth/forget_password/verify_code.dart';
import 'package:pckode/view/screen/auth/verifycodesignup.dart';
import 'package:pckode/view/screen/auth/login.dart';
import 'package:pckode/view/screen/auth/forget_password/reset_password.dart';
import 'package:pckode/view/screen/auth/signup.dart';
import 'package:pckode/view/screen/auth/forget_password/success_resetpassword.dart';
import 'package:pckode/view/screen/auth/success_signup.dart';
import 'package:pckode/view/screen/cart.dart';
import 'package:pckode/view/screen/checkout.dart';
import 'package:pckode/view/screen/homescreen.dart';
import 'package:pckode/view/screen/items.dart';
import 'package:pckode/view/screen/language.dart';
import 'package:pckode/view/screen/myfavorite.dart';
import 'package:pckode/view/screen/offers.dart';
import 'package:pckode/view/screen/onboarding.dart';
import 'package:pckode/view/screen/orders/archive.dart';
import 'package:pckode/view/screen/orders/details.dart';
import 'package:pckode/view/screen/orders/pending.dart';
import 'package:pckode/view/screen/orders/tracking.dart';
import 'package:pckode/view/screen/productdetails.dart';


List<GetPage<dynamic>>? routes = [
  GetPage(name: '/', page: () => const Language(), middlewares: [
    MyMiddleWare()
  ]),

//GetPage(name: '/', page: () => const Cart() ) ,

// Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerifyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoute.successResetPassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.onboarding, page: () => const OnBoarding()),
  GetPage(
      name: AppRoute.verfiyCodeSignUp, page: () => const VerifyCodeSignUp()),

// Home Screen
  GetPage(name: AppRoute.homePage, page: () => const HomeScreen()),
  GetPage(name: AppRoute.items, page: () => const Items()),
  GetPage(name: AppRoute.productdetails, page: () => const ProductDetails()),
  GetPage(name: AppRoute.myfavorite, page: () => const MyFavorite()),
  GetPage(name: AppRoute.cart, page: () => const Cart()),

//address 
  GetPage(name: AppRoute.addressview, page: () => const AddressView()),
  GetPage(name: AppRoute.addressadd, page: () => const AddressAdd()),
  GetPage(
      name: AppRoute.addressadddetails, page: () => const AddressAddDetails()),
  GetPage(name: AppRoute.checkOut, page: () => const CheckOut()),
  //  Orders
  GetPage(name: AppRoute.orderspending, page: () => const OrdersPending()),
  GetPage(name: AppRoute.ordersarchive, page: () => const OrdersArchiveView()),
  GetPage(name: AppRoute.ordersdetails, page: () => const OrdersDetails()),
  GetPage(name: AppRoute.orderstracking, page: () => const OrdersTracking()),

  //  Offers
  GetPage(name: AppRoute.offersview, page: () => const OffersView()),
];



