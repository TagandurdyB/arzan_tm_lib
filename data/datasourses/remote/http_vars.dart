const String IP = "http://it.net.tm:8888";
const String IP2 = "http://172.16.11.144:8080/api/v1";

class Uris {
  static Uri mainPage = Uri.parse("$IP/arzanapi/api/v1/mobile");
  static Uri register = Uri.parse("$IP2/account/signup");
  static Uri login = Uri.parse("$IP/login");
  static Uri checkUser = Uri.parse("$IP/userinformation");
  static Uri checkAcaunt = Uri.parse("$IP2/account/verify/check");
  static Uri recover = Uri.parse("$IP/user_reset");
  static Uri banner(String welayat, String page) =>
      Uri.parse("https://it.net.tm/arzanapi/api/v1/banner");
  // Uri.parse("$IP/arzanapi/api/v1/mobile?welayat=$welayat?page=$page");
  static Uri discounts =
      Uri.parse("https://it.net.tm/arzanapi/api/v1/discount");
  static Uri disDetal(int id) =>
      Uri.parse("https://it.net.tm/arzanapi/api/v1/discount/edit/$id");
  static Uri postDiscount =
      Uri.parse("$IP/arzanapi/api/v1/discount/mobile/create");
  static Uri discoutCategories = Uri.parse("$IP/categories");
  static Uri discoutSubcategories = Uri.parse("$IP/categoriessub");
}

class Headers {
  static Map<String, String> contentJson = {'Content-Type': 'application/json'};
  static Map<String, String> addPost(String token) => {
        'Content-Type': 'multipart/form-data',
        "Accept": 'application/json',
        'accessToken': token,
      };
}
