class Uris {
  //////////////////////////////////////////////////////////////////////
  static String ip = "http://it.net.tm:8888";
  //Seyit Local
  // static String ip2 = "http://172.16.11.144:8080/api/v1";
  static String ip2 = "http://10.15.0.76:8080/api/v1";
  //Arzan server
  // static String ip2 = "http://95.85.126.113:8080/api/v1";
  //////////////////////////////////////////////////////////////////////
  static Uri mainPage = Uri.parse("$ip/arzanapi/api/v1/mobile");
  static Uri register = Uri.parse("$ip2/account/signup");
  static Uri login = Uri.parse("$ip2/account/login");
  static Uri checkUser = Uri.parse("$ip/userinformation");
  static Uri checkAcaunt = Uri.parse("$ip2/account/verify/check");
  static Uri recover = Uri.parse("$ip/user_reset");
  static Uri locations = Uri.parse("$ip2/location/list");
  static Uri banner(int welayat, int pageId) =>
      Uri.parse("$ip2/banner/list?page_id=$pageId${welayat>1?"&location_id=$welayat":""}");
  // Uri.parse("https://it.net.tm/arzanapi/api/v1/banner");
  // Uri.parse("$IP/arzanapi/api/v1/mobile?welayat=$welayat?page=$page");
  static Uri discounts =
      Uri.parse("https://it.net.tm/arzanapi/api/v1/discount");
  static Uri disDetal(int id) =>
      Uri.parse("https://it.net.tm/arzanapi/api/v1/discount/edit/$id");
  static Uri postDiscount =
      Uri.parse("$ip2/post/create");
  static Uri discoutCategories = Uri.parse("$ip2/category/list");
  static Uri videoCards = Uri.parse("$ip2/location/list");
  static Uri video(int id) => Uri.parse("$ip2/location/list/$id");

}

class Headers {
  static Map<String, String> contentJson = {'Content-Type': 'application/json'};
  static Map<String, String> bearer(String token) => {
        'Content-Type': 'multipart/form-data',
        "Accept": 'application/json',
        'Authorization': "Bearer $token",
      };
}
