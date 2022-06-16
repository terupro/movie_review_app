import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_review_app/models/profile_model.dart';
import 'package:movie_review_app/repositories/custom_exception.dart';

abstract class BaseProfileRepository {
  Future<Profile> retrieveProfile();
  Future<void> updateProfile({required Profile profile});
}

final firebaseFirestoreProvider = Provider((ref) => FirebaseFirestore.instance);

final profileRepositoryProvider = Provider<ProfileRepository>(
  (ref) => ProfileRepository(ref.read),
);

class ProfileRepository implements BaseProfileRepository {
  final Reader _read;
  ProfileRepository(this._read);

  // 取得
  @override
  Future<Profile> retrieveProfile() async {
    try {
      final snap =
          await _read(firebaseFirestoreProvider).collection('profile').get();
      final doc = snap.docs.map((doc) => Profile.fromDocument(doc)).toList();
      return doc.first;
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  // 更新
  @override
  Future<void> updateProfile({required Profile profile}) async {
    try {
      await _read(firebaseFirestoreProvider)
          .collection('profile')
          .doc(profile.id)
          .update({'name': profile.name});
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }
}
