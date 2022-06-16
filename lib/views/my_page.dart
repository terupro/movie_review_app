import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_review_app/models/review_model.dart';
import 'package:movie_review_app/utils/util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_review_app/view_models/profile_view_model.dart';
import 'package:movie_review_app/views/create_profile_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyPage extends ConsumerWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = TextEditingController();
    final profileState = ref.watch(profileProvider);

    return profileState.when(
      data: (profile) => SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(90.0),
              child: Image.asset(height: 150, 'images/default_profile.png'),
            ),
            const SizedBox(height: 20),
            Text(profile.name),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateProfilePage(profile: profile),
                  ),
                );
              },
              child: const Text('編集'),
            ),
            const SizedBox(height: 40),
            OutlinedButton(
              onPressed: () {
                logOutDialog(context);
              },
              child: const Text('ログアウト'),
            )
          ],
        ),
      ),
      error: (err, _) => Text(err.toString()),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
