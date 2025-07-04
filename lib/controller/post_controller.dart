import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../repository/post_repository.dart';
import '../models/post.dart';



class PostController extends GetxController {
  final PostRepository repository;

  PostController({required this.repository});

  var posts = <Post>[].obs;
  var isLoading = true.obs;
  var isError = false.obs;
  var searchQuery = ''.obs;
  var nextId = 101;

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    try {
      isLoading.value = true;
      isError.value = false;
      final fetchedPosts = await repository.fetchPosts();
      posts.value = fetchedPosts;
    } catch (e) {
      isError.value = true;
    } finally {
      isLoading.value = false;
    }
  }

  List<Post> get filteredPosts {
    if (searchQuery.isEmpty) return posts;
    return posts
        .where((p) => p.title.toLowerCase().contains(searchQuery.value.toLowerCase()))
        .toList();
  }

  void addPost(String title, String body) {
    posts.insert(
      0,
      Post(id: nextId++, title: title, body: body),
    );
  }

  void editPost(Post post, String newTitle, String newBody) {
    post.title = newTitle;
    post.body = newBody;
    posts.refresh();
  }
}

