class Uris {
  //////////////////////////////////////////////////////////////////////
  static String ip3 = "http://it.net.tm:8888";
  //Seyit Local
  // static String ip2 = "http://172.16.11.144:8080/api/v1";
  // static String ip2 = "http://10.15.0.76:8080/api/v1";
  //Arzan server
  static String ip = "95.85.126.113";
  static String port = "8080";
  static String api = "http://$ip:$port/api/v1";

  //////////////////////////////////////////////////////////////////////
  static Uri mainPage = Uri.parse("$ip3/arzanapi/api/v1/mobile");
  static Uri register = Uri.parse("$api/account/signup");
  static Uri login = Uri.parse("$api/account/login");
  static Uri checkUser = Uri.parse("$ip3/userinformation");
  static Uri checkAcaunt = Uri.parse("$api/account/verify/check");
  //==================================================================

  static Uri exist = Uri.parse("$api/account/exists"); //phone:"+99365000000"
  static Uri chackRecover =
      Uri.parse("$api/account/recover/verify/chack"); //phone:"+99365000000"
  static Uri recover = Uri.parse(
      "$api/account/reset-password"); //phone:"+99365000000", password:"123123A!a"
  // static Uri recover = Uri.parse("$api/account/verify");//recover:bool
  //==================================================================
  static Uri locations = Uri.parse("$api/location/list");
  static Uri videoCategories = Uri.parse("$api/page-category?page_id=3");
  static Uri imageCategories = Uri.parse("$api/page-category?page_id=2");
  static Uri banner(int welayat, int pageId) => Uri.parse(
      "$api/banner?page=$pageId${welayat > 1 ? "&location_id=$welayat" : ""}");
  // Uri.parse("https://it.net.tm/arzanapi/api/v1/banner");
  // Uri.parse("$IP/arzanapi/api/v1/mobile?welayat=$welayat?page=$page");
  static Uri discounts = Uri.parse("$api/post/list");
  static Uri categoryPost(int id) =>
      Uri.parse("$api/post/list?category_id=$id");
  static Uri subCategoryPost(int id) =>
      Uri.parse("$api/post/list?sub_category_id=$id");
  // Uri.parse("https://it.net.tm/arzanapi/api/v1/discount");
  static Uri disDetal(int id) =>
      Uri.parse("https://it.net.tm/arzanapi/api/v1/discount/edit/$id");
  static Uri postDiscount = Uri.parse("$api/post/create");
  static Uri discoutCategories = Uri.parse("$api/category/list");
  static Uri videoCards(int id) =>
      Uri.parse("$api/video${id > 0 ? "?page_category_id=$id" : ""}");
  static Uri video(int id) => Uri.parse("$api/location/list/$id");

  static Uri likePost = Uri.parse("$api/video/like");

  static Uri imgFolders(int id) =>
      Uri.parse("$api/gallery${id > 0 ? "?page_category_id=$id" : ""}");
  static Uri images(int id) => Uri.parse("$api/gallery/$id");
}

class Headers {
  static Map<String, String> contentJson = {'Content-Type': 'application/json'};
  static Map<String, String> bearer(String token) => {
        'Content-Type': 'multipart/form-data',
        "Accept": 'application/json',
        'Authorization': "Bearer $token",
      };
}
