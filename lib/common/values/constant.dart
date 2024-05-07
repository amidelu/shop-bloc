import 'package:learning_shop_bloc/environment.dart';

class AppConstants {
  static const String deviceOpenFirstTime = 'device_first_time_open';
  static String serverUploads = '${Environment.apiBaseUrl}uploads/';
  static const String isLoggedIn = 'is_logged_in';
  static const String userProfile = 'user_profile';
  static const String userTokenKey = 'user_token_key';
}