import 'package:asl_task/utils/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/post_controller.dart';
import '../widgets/loading_widget.dart';
import 'add_edit_view.dart';
import 'detail_view.dart';

class HomeView extends GetView<PostController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.colorPrimary,
        foregroundColor: Colors.white,
        title: const Text('Posts'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Get.to(() => AddEditView());
            },
          ),
        ],
      ),
      backgroundColor: AppColor.whiteColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              cursorColor: AppColor.colorPrimary,
              decoration: InputDecoration(
                hintText: 'Search any post here',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
                prefixIcon: const Icon(Icons.search, color: Colors.blue),
              ),
              onChanged: (value) => controller.searchQuery.value = value,
            ),


          ),
          Obx(() {
            if (controller.isLoading.value) {
              return const Expanded(child: LoadingWidget());

            }
            if (controller.isError.value) {
              return Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Failed to load posts.'),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: controller.fetchPosts,
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
              );
            }
            if (controller.filteredPosts.isEmpty) {
              return const Expanded(
                child: Center(child: Text('No posts found.')),
              );
            }
            return Expanded(
              child: RefreshIndicator(
                onRefresh: controller.fetchPosts,
                color: AppColor.colorPrimary,
                child: ListView.builder(
                  itemCount: controller.filteredPosts.length,
                  itemBuilder: (context, index) {
                    final post = controller.filteredPosts[index];
                    return ListTile(
                      title: Text(post.title),
                      onTap: () {
                        Get.to(() => DetailView(post: post));
                      },
                    );
                  },
                ),
              ),
            );
          }),
          Obx(() => Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
                'Total: ${controller.filteredPosts.length} items'),
          )),
        ],
      ),
    );
  }
}
