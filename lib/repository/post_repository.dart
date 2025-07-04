import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/post.dart';
import '../api_service/app_url.dart';

class PostRepository {
  Future<List<Post>> fetchPosts() async {
    final uri = Uri.parse(AppUrl.getPosts());
    try {
      final response = await http.get(uri, headers: AppUrl.defaultHeaders);
      switch (response.statusCode) {
        case 200:
          final List<dynamic> data = json.decode(response.body);
          return data.map((e) => Post.fromJson(e)).toList();
        default:
          throw Exception('Failed to fetch posts (status ${response.statusCode})');
      }
    } catch (e) {
      throw Exception('Network error: ${e.toString()}');
    }
  }
}

