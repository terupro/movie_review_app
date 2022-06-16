import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_review_app/models/profile_model.dart';
import 'package:movie_review_app/models/review_model.dart';
import 'package:movie_review_app/repositories/custom_exception.dart';
import 'package:movie_review_app/repositories/profile_repository.dart';

final profileProvider =
    StateNotifierProvider<ProfileNotifier, AsyncValue<Profile>>((ref) {
  return ProfileNotifier(ref.read);
});

class ProfileNotifier extends StateNotifier<AsyncValue<Profile>> {
  final Reader _read;
  ProfileNotifier(this._read) : super(const AsyncValue.loading()) {
    retrieveProfile();
  }

  Future<void> retrieveProfile({bool isRefreshing = false}) async {
    if (isRefreshing) state = const AsyncValue.loading();
    try {
      final profile = await _read(profileRepositoryProvider).retrieveProfile();
      if (mounted) {
        state = AsyncValue.data(profile);
      }
    } on CustomException catch (e) {
      state = AsyncValue.error(e);
    }
  }

  Future<void> updateProfile({required Profile updateProfile}) async {
    try {
      await _read(profileRepositoryProvider)
          .updateProfile(profile: updateProfile);
      state.whenData(
        (profile) => state = AsyncValue.data(updateProfile),
      );
    } on CustomException catch (e) {
      state = AsyncValue.error(e);
    }
  }
}
