class Uris {
  static Uri mainPage = Uri.parse("https://it.net.tm/arzanapi/api/v1/mobile");
  static Uri register =
      Uri.parse("https://it.net.tm/arzanapi/api/v1/auth/user/register");
  static Uri login =
      Uri.parse("https://it.net.tm/arzanapi/api/v1/auth/user/login");
}

class Headers {
  static Map<String, String> mainPage = {'Content-Type': 'aplication/json'};
}
