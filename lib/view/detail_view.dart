import 'package:flutter/material.dart';

import '../models/post.dart';
import '../utils/AppColor.dart';
import 'add_edit_view.dart';


class DetailView extends StatelessWidget {
  final Post post;

  const DetailView({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.colorPrimary,
        foregroundColor: Colors.white,
        title: const Text('Post Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => AddEditView(post: post),
              ));
            },
          ),
        ],
      ),
      backgroundColor: AppColor.whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            Text(post.body),
          ],
        ),
      ),
    );
  }
}
