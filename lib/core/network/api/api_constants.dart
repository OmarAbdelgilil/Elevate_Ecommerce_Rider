class ApiConstants {
  static const String baseUrl = "https://flower.elevateegy.com/api";
  static const String loginPath = "/v1/drivers/signin";
  static const String applyPath = "/v1/drivers/apply";
  static const String logedUserDataPath = "/v1/drivers/profile-data";
  static const String getVehiclesPath = "/v1/vehicles";
  static const String editProfile = "/v1/drivers/editProfile";
  static const String uploadImage = "/v1/drivers/upload-photo";
  static const String ordersPath = "/v1/orders/pending-orders";
  static const String startOrderPath = "/v1/orders/start/";
  static const String updateOrderStatePath = "/v1/orders/state/";
  //forget password paths
  static const String forgotPasswordPath = "/v1/drivers/forgotPassword";
  static const String verifyResetCodePath = "/v1/drivers/verifyResetCode";
  static const String resetPasswordPath = "/v1/drivers/resetPassword";
  //change password
  static const String updatePasswordPath = "/v1/drivers/change-password";
  //logout
  static const String logoutPath = "/v1/drivers/logout";
}
