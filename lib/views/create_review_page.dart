import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_review_app/models/review_model.dart';
import 'package:movie_review_app/repositories/review_repository.dart';
import 'package:movie_review_app/utils/util.dart';
import 'package:movie_review_app/view_models/review_view_model.dart';

final ratingProvider = StateProvider<double>((ref) => 0);

class CreateReviewPage extends ConsumerWidget {
  const CreateReviewPage({Key? key, required this.review}) : super(key: key);
  final Review review;

  bool get isUpdating => review.id != null;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = TextEditingController(text: review.title);
    final impressionController = TextEditingController(text: review.impression);
    final reviewListNotifier = ref.watch(reviewListProvider.notifier);
    final ratingState = ref.watch(ratingProvider);
    final ratingNotifier = ref.watch(ratingProvider.notifier);
    final bottomSpace = MediaQuery.of(context).viewInsets.bottom;
    final imgFile = ref.watch(imgFileProvider);
    final imgFileNotifier = ref.watch(imgFileProvider.notifier);
    final imgURL = ref.watch(imgURLProvider);
    final imgURLNotifier = ref.watch(imgURLProvider.notifier);

    final picker = ImagePicker();
    Future pickImage() async {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        imgFileNotifier.state = File(pickedFile.path);
      }
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: isUpdating
              ? headingText(label: 'レビュー編集', fontSize: 30)
              : headingText(label: 'レビュー作成', fontSize: 30),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              reverse: true,
              child: Padding(
                padding: EdgeInsets.only(bottom: bottomSpace),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: pickImage,
                      child: SizedBox(
                        height: 200,
                        child: imgFile != null
                            ? Image.file(imgFile)
                            : Image.asset('images/default_review.png'),
                      ),
                    ),
                    const SizedBox(height: 10),
                    RatingBar.builder(
                      initialRating: isUpdating ? review.rating : 0,
                      minRating: 0,
                      direction: Axis.horizontal,
                      itemSize: 25,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        ratingNotifier.state = rating;
                        review.copyWith(rating: rating);
                      },
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: titleController,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(hintText: 'タイトル'),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      maxLines: 7,
                      minLines: 1,
                      textAlignVertical: TextAlignVertical.top,
                      controller: impressionController,
                      decoration: const InputDecoration(hintText: '映画を見た感想'),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: isUpdating ? Colors.orange : Colors.blue,
                        ),
                        onPressed: () {
                          isUpdating
                              ? reviewListNotifier.updateReview(
                                  updateReview: review.copyWith(
                                    title: titleController.text.trim(),
                                    impression:
                                        impressionController.text.trim(),
                                    rating: ratingState == 0
                                        ? review.rating
                                        : ratingState,
                                    imgURL:
                                        imgURL != null ? review.imgURL : imgURL,
                                  ),
                                )
                              : reviewListNotifier.addReview(
                                  title: titleController.text.trim(),
                                  impression: impressionController.text.trim(),
                                  rating: ratingState,
                                  imgURL: imgURL,
                                );

                          if (titleController.text == '') {
                            showToast(label: 'タイトルを入力してください');
                          } else if (impressionController.text == '') {
                            showToast(label: '映画を見た感想を入力してください');
                          } else {
                            Navigator.of(context).pop();
                          }
                        },
                        child: Text(
                          isUpdating ? '保存する' : '追加する',
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
