class AppLink {
  static const String linkServiceName = "https://be-healthy-api.onrender.com";

  static const String imageCategoryFood = '$linkServiceName/categoryfoods';
  static const String imageRestaurantFood = '$linkServiceName/restaurants';
  static const String imageTraining = '$linkServiceName/trainings';
  static const String imageUser = '$linkServiceName/users';

  ////////////////////////////Auth////////////////////////////////////
  static const String linkSignUp = '$linkServiceName/api/v1/auth/signup';
  static const String linkLogin = '$linkServiceName/api/v1/auth/login';

  ////////////////////////////ForgetPassword////////////////////////////////////
  static const String forgetPassword =
      '$linkServiceName/api/v1/auth/forgotPassword';
  static const String rePassword = '$linkServiceName/api/v1/auth/resetPassword';
  static const String verifyCodePassword =
      '$linkServiceName/api/v1/auth/verifyResetCode';

  static const String collectData = '$linkServiceName/api/v1/data/collectData';
  static const String getData = '$linkServiceName/api/v1/data/getData';
  static const String addWaterAndCalorie = '$linkServiceName/api/v1/data/addData';

  static const String categoryFood = '$linkServiceName/api/v1/catFood';
  static const String categoryAllFood =
      '$linkServiceName/api/v1/food?categoryId=';
  static const String searchAllFood =
      '$linkServiceName/api/v1/food/search/?name=';

  static const String categoryRestaurant =
      '$linkServiceName/api/v1/restaurants';
  static const String restaurantDetails = '$linkServiceName/api/v1/restaurants/';
  static const String training ='$linkServiceName/api/v1/training?level=';
  static const String allTraining ='$linkServiceName/api/v1/training';

  static const String trainingDetails ='$linkServiceName/api/v1/training/';
  static const String createReview ='$linkServiceName/api/v1/reviews';
  static const String favourite ='$linkServiceName/api/v1/wishlist';
    static const String pouplar ='$linkServiceName/api/v1/training/pouplar';
  static const String addFavorite ='$linkServiceName/api/v1/wishlist';
  static const String deleteFavourite ='$linkServiceName/api/v1/wishlist/';
}
