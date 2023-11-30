//base url
// ignore_for_file: constant_identifier_names

const String ibaseURL = "http://159.65.4.9:3000/";
/*
 const String baseURL = "http://10.0.2.2:3000/api/v1/";
*/

const String baseURL = "http://159.65.4.9:3000/api/v1/";

/*
const String baseURL = "https://invoicetest-m7na.onrender.com/api/v1/";
*/
// const String baseURLForActs = "http://65.0.242.35:16000/api/";
// const String actsToken = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ1c2VyQG1pbmVtYWdtYS5jb20iLCJpYXQiOjE2ODAyNjA1Mjl9.flWOZJxvxXRyoZGKQ7Vu4If8hSxzlzRpRsHUGUX1BD_Bhx9C6p-W78cyLtWGRlE6YxaGjWE7PyAy2SWeoHMnjA";
//
// const String authUrl = "";

class ApiConstant {
  // static const LoginUser = "users/login";

  static const SignInEmail = "signin/email";

  static const SignUpEmail = "signup/email";

  static const SignInGoogle = "signin/google";

  static const SignUpGoogle = "signup/google";

  static const ForgotPassword = "forgotpassword";

  static const ResetPassword = "resetpassword";

  static const createUpdateProfile = "user-profile";
  static const getProfile = "user-profile";

  static const createUpdateClient = "clients";

  static const getAllClients = "clients";
  static const getAllProducts = "products";
  static const products = "products";
  static const createUpdateProduct = "products/";

  static const getAllCountry = "countries";

  static const getAllStates = "states";

  static const getAllCities = "cities";
  static const getCurrEst = "curr-est";

  static const createEst = "create-est";
  static const editEst = "est";
  static const getEstByUser = "allest";
  static const getEstPreview = "get-est";
  static const getEstPdf = "estpreview";
}
