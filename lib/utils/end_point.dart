class EndPoints {
  static const String baseUrl =
      "https://c909-2405-201-4041-c80c-91eb-4877-e8b4-5d4a.ngrok-free.app";
  // "localhost:9000/api/auth/";

  static const String signupEndUrl = "/users/register_user";
  static const String loginByMobEndUrl = "/users/login_by_mobile";
  static const String loginByEmailEndUrl = "/users/login_by_email";
  static const String otpVerifyByMobEndUrl = "/users/mobile_verification";
  static const String otpVerifyByEmailEndUrl = "/users/email_verification";
  static const String getUserEndUrl = "/users/get_user_by_id";
  static const String editUserEndUrl = '/users/update_UserDetail/';
  static const String getCategoryEndUrl = '/category/get_category_list';
}
