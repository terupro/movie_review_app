import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_review_app/models/review_model.dart';
import 'package:movie_review_app/utils/util.dart';
import 'package:movie_review_app/view_models/review_view_model.dart';
import 'package:movie_review_app/views/create_review_page.dart';

class ReviewCardWidget extends ConsumerWidget {
  const ReviewCardWidget({
    Key? key,
    required this.review,
    required this.reviewListNotifier,
  }) : super(key: key);
  final Review review;
  final ReviewListNotifier reviewListNotifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      key: ValueKey(review.id),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 100,
                  height: 140,
                  child: review.imgURL != null
                      ? Image.network(review.imgURL!)
                      : Image.asset('images/default_review.png'),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        review.title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          RatingBar.builder(
                            initialRating: review.rating,
                            minRating: 0,
                            direction: Axis.horizontal,
                            itemSize: 25,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 2.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (_) {},
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  fullscreenDialog: true,
                                  builder: (context) => CreateReviewPage(
                                    review: review,
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.edit,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              deleteDialog(
                                context,
                                review,
                                reviewListNotifier,
                              );
                            },
                            icon: const Icon(
                              Icons.delete,
                            ),
                          )
                        ],
                      ),
                      const Divider(height: 10),
                      Text(
                        overflow: TextOverflow.ellipsis,
                        review.impression,
                        softWrap: true,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
