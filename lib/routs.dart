
import 'package:be_healthy/core/constant/routs_name.dart';
import 'package:be_healthy/core/middelware.dart';
import 'package:be_healthy/view/add_water.dart';
import 'package:be_healthy/view/auth/forgetpassword/forgetpassword_screen.dart';
import 'package:be_healthy/view/auth/forgetpassword/reset_password_screen.dart';
import 'package:be_healthy/view/auth/forgetpassword/success_resetpassword_screen.dart';
import 'package:be_healthy/view/auth/forgetpassword/verification_screen.dart';
import 'package:be_healthy/view/auth/login_screen.dart';
import 'package:be_healthy/view/auth/signup_screen.dart';
import 'package:be_healthy/view/calories._screen.dart';
import 'package:be_healthy/view/contact_us_screen.dart';
import 'package:be_healthy/view/favourite_screen.dart';
import 'package:be_healthy/view/main_home.dart';
import 'package:be_healthy/view/mediation_screen.dart';
import 'package:be_healthy/view/mydata/screen_one.dart';
import 'package:be_healthy/view/mydata/screen_two.dart';
import 'package:be_healthy/view/nutrition/nutrition.dart';
import 'package:be_healthy/view/nutrition/nutrition_details.dart';
import 'package:be_healthy/view/nutrition/search_screen.dart';
import 'package:be_healthy/view/onboarding/onboarding_screen.dart';
import 'package:be_healthy/view/order/order_details_screen.dart';
import 'package:be_healthy/view/order/order_screen.dart';
import 'package:be_healthy/view/popular_screen.dart';
import 'package:be_healthy/view/setting_screen.dart';
import 'package:be_healthy/view/splash_screen.dart';
import 'package:be_healthy/view/video_screen.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routs=[
  GetPage(name: "/", page: ()=> const SplashScreen(),middlewares: [MyMiddleWare()]),

  // GetPage(name: "/", page: ()=> const TestView()),
  GetPage(name: AppRouts.login, page: ()=> const LoginScreen()),
  GetPage(name: AppRouts.signUp, page: ()=> const SignUpScreen ()),
  GetPage(name: AppRouts.forgetPassword, page: ()=> const ForgetPassword()),
  GetPage(name: AppRouts.resetPassword, page: ()=> const ResetPasswordScreen()),
  GetPage(name: AppRouts.verifyCode, page: ()=> const VerificationScreenRePassword()),
  GetPage(name: AppRouts.successResetPassword, page: ()=> const SuccessResetPasswordScreen()),
  GetPage(name: AppRouts.onBoarding, page: ()=> const OnBoardingScreen()),
  GetPage(name: AppRouts.screenOne, page: ()=> const ScreenOne()),
  GetPage(name: AppRouts.screenTwo, page: ()=> const ScreenTwo()),
  GetPage(name: AppRouts.home, page: ()=> const MainHomeScreen()),
  GetPage(name: AppRouts.order, page: ()=> const OrderScreen()),
  GetPage(name: AppRouts.orderDetails, page: ()=> const OrderDetailsScreen()),
  GetPage(name: AppRouts.calories, page: ()=> const CaloriesScreen()),
  GetPage(name: AppRouts.addWater, page: ()=> const AddWaterScreen()),
  GetPage(name: AppRouts.searchNutrition, page: ()=> const SearchScreen()),
  GetPage(name: AppRouts.nutritionDetails, page: ()=> const NutritionDetailsScreen()),
  GetPage(name: AppRouts.videoScreen, page: ()=> const VideoScreen()),
  GetPage(name: AppRouts.nutrition, page: ()=> const NutritionScreen()),
  GetPage(name: AppRouts.favourite, page: ()=> const FavouriteScreen()),
  GetPage(name: AppRouts.popular, page: ()=> const PopularScreen()),
  GetPage(name: AppRouts.contactus, page: ()=> const ContactUs()),
  GetPage(name: AppRouts.setting, page: ()=> const SettingScreen()),
  GetPage(name: AppRouts.meditation, page: ()=> const MeditationScreen()),
  

];

