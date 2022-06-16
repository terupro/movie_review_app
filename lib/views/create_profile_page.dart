import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_review_app/models/profile_model.dart';
import 'package:movie_review_app/models/review_model.dart';
import 'package:movie_review_app/utils/util.dart';
import 'package:movie_review_app/view_models/profile_view_model.dart';

class CreateProfilePage extends ConsumerWidget {
  const CreateProfilePage({Key? key, required this.profile}) : super(key: key);
  final Profile profile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = TextEditingController(text: profile.name);
    final profileNotifier = ref.watch(profileProvider.notifier);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: headingText(label: 'プロフィール設定', fontSize: 30),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(90.0),
                    child:
                        Image.asset(height: 150, 'images/default_profile.png'),
                  ),
                ),
                const SizedBox(height: 10),
                const SizedBox(height: 20),
                TextField(
                  controller: nameController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(hintText: '名前'),
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                    ),
                    onPressed: () {
                      profileNotifier.updateProfile(
                        updateProfile: profile.copyWith(
                          name: nameController.text.trim(),
                        ),
                      );
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      '保存する',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
