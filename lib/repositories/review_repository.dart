import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_review_app/models/review_model.dart';
import 'package:movie_review_app/repositories/custom_exception.dart';

abstract class BaseReviewRepository {
  Future<List<Review>> retrieveReview();
  Future<String> createReview({required Review review});
  Future<void> updateReview({required Review review});
  Future<void> deleteReview({required String id});
}

final firebaseFirestoreProvider = Provider((ref) => FirebaseFirestore.instance);
final firebaseStorageProvider = Provider((ref) => FirebaseStorage.instance);

File? imgFile;
final imgFileProvider = StateProvider.autoDispose((ref) => imgFile);

String? imgURL;
final imgURLProvider = StateProvider((ref) => imgURL);

final reviewRepositoryProvider = Provider<ReviewRepository>(
  (ref) => ReviewRepository(ref.read),
);

class ReviewRepository implements BaseReviewRepository {
  final Reader _read;
  ReviewRepository(this._read);

  @override
  Future<List<Review>> retrieveReview() async {
    try {
      final snap = await _read(firebaseFirestoreProvider)
          .collection('review_list')
          .get();
      return snap.docs.map((doc) => Review.fromDocument(doc)).toList();
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<String> createReview({required Review review}) async {
    try {
      final doc = _read(firebaseFirestoreProvider).collection('review_list');

      // storageに追加
      if (imgFile != null) {
        final task = await _read(firebaseStorageProvider)
            .ref('review_list/${doc.id}')
            .putFile(imgFile!);
        imgURL = await task.ref.getDownloadURL();
      }
      // Firestoreに追加
      final docRef = await doc.add(review.toDocument());
      return docRef.id;
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> updateReview({required Review review}) async {
    try {
      await _read(firebaseFirestoreProvider)
          .collection('review_list')
          .doc(review.id)
          .update(review.toDocument());
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> deleteReview({required String id}) async {
    try {
      await _read(firebaseFirestoreProvider)
          .collection(('review_list'))
          .doc(id)
          .delete();
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }
}
