import 'package:asl_task/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/post_controller.dart';
import '../models/post.dart';
import '../utils/AppColor.dart';


class AddEditView extends StatelessWidget {
  final Post? post;
  final PostController controller = Get.find();
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();

  AddEditView({super.key, this.post}) {
    if (post != null) {
      _titleController.text = post!.title;
      _bodyController.text = post!.body;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = post != null;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.colorPrimary,
        foregroundColor: AppColor.whiteColor,
        title: Text(isEditing ? 'Edit Post' : 'Add Post'),
      ),
      backgroundColor: AppColor.whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                cursorColor: AppColor.primaryColor,
                decoration: InputDecoration(
                  labelText: 'Title',
                  labelStyle: const TextStyle(
                    color: AppColor.colorGray,
                  ),
                  floatingLabelStyle: const TextStyle(
                    color: AppColor.primaryColor,
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColor.colorGray),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColor.primaryColor, width: 2),
                  ),
                ),
                validator: (value) =>
                value!.isEmpty ? 'Please enter a title' : null,
              ),


              const SizedBox(height: 12),
              TextFormField(
                controller: _bodyController,
                cursorColor: AppColor.primaryColor,
                decoration: InputDecoration(
                  labelText: 'Body',
                  labelStyle: const TextStyle(
                    color: AppColor.colorGray, 
                  ),
                  floatingLabelStyle: const TextStyle(
                    color: AppColor.primaryColor, 
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColor.colorGray),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColor.primaryColor, width: 2),
                  ),
                ),
                validator: (value) =>
                value!.isEmpty ? 'Please enter body text' : null,
              ),

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (!_formKey.currentState!.validate()) return;
                  if (isEditing) {
                    controller.editPost(
                      post!,
                      _titleController.text,
                      _bodyController.text,
                    );
                    Get.back();
                    Get.back();
                  } else {
                    controller.addPost(
                      _titleController.text,
                      _bodyController.text,
                    );
                    Get.back();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.colorPrimary,
                  foregroundColor: AppColor.whiteColor,
                ),
                child: Text(isEditing ? 'Save Changes' : 'Add Post'),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
