class Urls{
  static const String _baseUrl = 'http://ecom-api.teamrabbil.com/apis';
  
  static String sendEmailOtp(String email) => '$_baseUrl/UserLogin/$email';

  static String verifyOtp(String email, String otp) => '$_baseUrl/VerifyLogin/$email/$otp';

  static String readProfile ='$_baseUrl/ReadProfile/';
  static String createProfile ='$_baseUrl/CreateProfile/';
}