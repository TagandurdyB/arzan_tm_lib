const String IP = "http://it.net.tm:8888";

class Uris {
  static Uri mainPage = Uri.parse("$IP/arzanapi/api/v1/mobile");
  static Uri register = Uri.parse("$IP/sign_up");
  static Uri login = Uri.parse("$IP/arzanapi/api/v1/auth/user/login");
  static Uri checkAcaunt = Uri.parse("$IP/checkactivate");
  static Uri banner(String welayat, String page) =>
      Uri.parse("$IP/arzanapi/api/v1/mobile?welayat=$welayat?page=$page");
  static Uri discounts = Uri.parse("$IP/arzanapi/api/v1/mobile");
  static Uri postDiscount =
      Uri.parse("$IP/arzanapi/api/v1/discount/mobile/create");
}

class Headers {
  static Map<String, String> contentJson = {'Content-Type': 'aplication/json'};
  static Map<String, String> addPost(String token) => {
        'Content-Type': 'multipart/form-data',
        "Accept": 'application/json',
        'accessToken': token,
      };
}
