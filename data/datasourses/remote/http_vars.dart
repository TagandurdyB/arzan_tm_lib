class Uris {
  //////////////////////////////////////////////////////////////////////
  static String ip3 = "http://it.net.tm:8888";
  //Seyit Local
  // static String ip2 = "http://172.16.11.144:8080/api/v1";
  // static String ip2 = "http://10.15.0.76:8080/api/v1";
  //Arzan server
  static String domain = "api.arzan.info";
  //   static String ip = "10.15.0.76";
  // static String port = "8081";
  static String api = "https://$domain/api/v1";

  //////////////////////////////////////////////////////////////////////
  static Uri mainPage = Uri.parse("$ip3/arzanapi/api/v1/mobile");
  static Uri register = Uri.parse("$api/account/signup");
  static Uri login = Uri.parse("$api/account/login");
  static Uri checkUser = Uri.parse("$ip3/userinformation");
  static Uri checkAcaunt = Uri.parse("$api/account/verify/check");
  //==================================================================

  static Uri exist = Uri.parse("$api/account/exists"); //phone:"+99365000000"
  static Uri chackRecover =
      Uri.parse("$api/account/recover/verify/check"); //phone:"+99365000000"
  static Uri recover = Uri.parse(
      "$api/account/reset-password"); //phone:"+99365000000", password:"123123A!a"
  // static Uri recover = Uri.parse("$api/account/verify");//recover:bool
  //==================================================================
  static Uri locations = Uri.parse("$api/location/list");
  static Uri videoCategories = Uri.parse("$api/page-category?page_id=3");
  static Uri imageCategories = Uri.parse("$api/page-category?page_id=2");
  static Uri banner(int welayat, int pageId, int categoryId) => Uri.parse(
      "$api/banner?page=$pageId${welayat > 1 ? "&location_id=$welayat" : ""}${categoryId > 0 ? "&page_category=$categoryId" : ""}");
  // Uri.parse("https://it.net.tm/arzanapi/api/v1/banner");
  // Uri.parse("$IP/arzanapi/api/v1/mobile?welayat=$welayat?page=$page");

  //Discounts===============================================================================
  static Uri discounts(
          int limit, int offset, int categoryId, int subCategoryId) =>
      Uri.parse(
          "$api/post${limit > 0 ? "?limit=$limit" : ""}${offset > 0 ? "&offset=$offset" : ""}${categoryId > 0 ? "&category_id=$categoryId" : ""}${subCategoryId > 0 ? "&sub_category_id=$subCategoryId" : ""}");
  static Uri categoryPost(int id) => Uri.parse("$api/post?category_id=$id");
  static Uri subCategoryPost(int id) =>
      Uri.parse("$api/post?sub_category_id=$id");
  // Uri.parse("https://it.net.tm/arzanapi/api/v1/discount");
  static Uri disDetal(int id) => Uri.parse("$api/post/$id");
  static Uri postDiscount = Uri.parse("$api/post/create");
  static Uri discoutCategories = Uri.parse("$api/category/list");
  //==========================================================================================

  static Uri videoCards(int id, int limit, int offset) {
    return Uri.parse(
        "$api/video${limit > 0 ? "?limit=$limit" : ""}${offset > 0 ? "&offset=$offset" : ""}${id > 0 ? "&page_category_id=$id" : ""}");
  }

  static Uri video(int id) => Uri.parse("$api/location/list/$id");

  static Uri imgFolders(int id) =>
      Uri.parse("$api/gallery${id > 0 ? "?page_category_id=$id" : ""}");
  static Uri images(int id) => Uri.parse("$api/gallery/$id");
//Badges=====================================================
  static Uri badgeVideo = Uri.parse("$api/video/badge");
  static Uri badgeImgs = Uri.parse("$api/gallery/badge");
  static Uri badgePost = Uri.parse("$api/post/badge");
//===========================================================
//Likes======================================================
  static Uri likeVidoe = Uri.parse("$api/video/like");
  static Uri likeImage = Uri.parse("$api/gallery/like");
//===========================================================
//Views======================================================
  static Uri viewVideo = Uri.parse("$api/video/view");
  static Uri viewImage = Uri.parse("$api/gallery/view");
//===========================================================
  static Uri searchPost(String text) => Uri.parse("$api/post?query=$text");
  static Uri selfPost(int id) => Uri.parse("$api/post?limit=100&user_id=$id");

  //================================================================
  static Uri myProfile(int id) => Uri.parse("$api/user/profile/$id");
  static Uri tops(int limit, int offset) => Uri.parse(
      "$api/user/profile${limit > 0 ? "?limit=$limit" : ""}${offset > 0 ? "&offset=$offset" : ""}&sort=coin");

  //================================================================
}

class Headers {
  static Map<String, String> contentJson = {
    'Content-Type': 'application/json',
    'Cookie': '',
  };
  static Map<String, String> bearer(String token) => {
        'Content-Type': 'multipart/form-data',
        "Accept": 'application/json',
        'Cookie': '',
        'Authorization': "Bearer $token",
      };
}
