class AppUrl {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  static String getPosts() => '$baseUrl/posts';

  static const Map<String, String> defaultHeaders = {
    'Accept': 'application/json',
  };
}


