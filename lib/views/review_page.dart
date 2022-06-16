import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_review_app/models/review_model.dart';
import 'package:movie_review_app/utils/util.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_review_app/view_models/review_view_model.dart';

class ReviewPage extends ConsumerWidget {
  const ReviewPage({Key? key, required this.review}) : super(key: key);
  final Review review;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = TextEditingController(text: review.title);
    final commentController = TextEditingController(text: review.impression);
    final reviewListNotifier = ref.watch(reviewListProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: headingText(label: 'レビュー', fontSize: 30),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 270,
                  child: review.imgURL != null
                      ? Image.network(review.imgURL!)
                      : Image.asset('images/default_review.png'),
                ),
                const SizedBox(height: 10),
                RatingBar.builder(
                  initialRating: review.rating,
                  minRating: 0,
                  direction: Axis.horizontal,
                  itemSize: 25,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {},
                ),
                const SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 7),
                    Text(
                      review.title,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Divider(height: 30),
                Text(review.impression),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
