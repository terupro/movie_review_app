import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_review_app/components/review_card_widget.dart';
import 'package:movie_review_app/models/review_model.dart';
import 'package:movie_review_app/utils/util.dart';
import 'package:movie_review_app/view_models/review_view_model.dart';
import 'package:movie_review_app/views/create_review_page.dart';
import 'package:movie_review_app/views/review_page.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // state
    final reviewList = ref.watch(reviewListProvider);
    // provider
    final reviewListNotifier = ref.watch(reviewListProvider.notifier);
    return Scaffold(
      body: reviewList.when(
        data: (reviews) => reviews.isEmpty
            ? const Center(
                child: Text(
                  'レビューがありません',
                  style: TextStyle(fontSize: 20),
                ),
              )
            : ListView.builder(
                itemCount: reviews.length,
                itemBuilder: (context, index) {
                  final review = reviews[index];
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReviewPage(
                          review: review,
                        ),
                      ),
                    ),
                    child: ReviewCardWidget(
                      review: review,
                      reviewListNotifier: reviewListNotifier,
                    ),
                  );
                },
              ),
        error: (err, _) => Text(err.toString()),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateReviewPage(
                review: Review.empty(),
              ),
              fullscreenDialog: true,
            )),
        child: const Icon(Icons.note_alt_outlined),
      ),
    );
  }
}
