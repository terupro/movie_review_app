import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_review_app/models/review_model.dart';
import 'package:movie_review_app/repositories/custom_exception.dart';
import 'package:movie_review_app/repositories/review_repository.dart';

final reviewListProvider =
    StateNotifierProvider<ReviewListNotifier, AsyncValue<List<Review>>>((ref) {
  return ReviewListNotifier(ref.read);
});

class ReviewListNotifier extends StateNotifier<AsyncValue<List<Review>>> {
  final Reader _read;
  ReviewListNotifier(this._read) : super(const AsyncValue.loading()) {
    retrieveReviews();
  }

  Future<void> retrieveReviews({bool isRefreshing = false}) async {
    if (isRefreshing) state = const AsyncValue.loading();
    try {
      final reviews = await _read(reviewRepositoryProvider).retrieveReview();
      if (mounted) {
        state = AsyncValue.data(reviews);
      }
    } on CustomException catch (e) {
      state = AsyncValue.error(e);
    }
  }

  Future<void> addReview({
    required String title,
    required String impression,
    double rating = 0,
    String? imgURL,
  }) async {
    try {
      final review = Review(
        title: title,
        impression: impression,
        rating: rating,
        imgURL: imgURL,
      );
      final reviewId =
          await _read(reviewRepositoryProvider).createReview(review: review);
      state.whenData(
        (reviews) => state = AsyncValue.data(
          reviews..add(review.copyWith(id: reviewId)),
        ),
      );
    } on CustomException catch (e) {
      state = AsyncValue.error(e);
    }
  }

  Future<void> updateReview({required Review updateReview}) async {
    try {
      await _read(reviewRepositoryProvider).updateReview(review: updateReview);
      state.whenData((reviews) => state = AsyncValue.data([
            for (final review in reviews)
              if (review.id == updateReview.id) updateReview else review
          ]));
    } on CustomException catch (e) {
      state = AsyncValue.error(e);
    }
  }

  Future<void> deleteReview({required String reviewId}) async {
    try {
      await _read(reviewRepositoryProvider).deleteReview(id: reviewId);
      state.whenData(
        (items) => state = AsyncValue.data(
          items..removeWhere((review) => review.id == reviewId),
        ),
      );
    } on CustomException catch (e) {
      state = AsyncValue.error(e);
    }
  }
}
