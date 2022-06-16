import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_review_app/models/review_model.dart';
import 'package:movie_review_app/view_models/review_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

const nameKey = 'name';

const kBaseColor = Colors.black87;
final kInputBorderStyle = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: const BorderSide(color: Colors.grey),
);

Widget headingText({required String label, required double fontSize}) {
  return Text(
    label,
    style: GoogleFonts.kaiseiDecol(
      textStyle: TextStyle(fontSize: fontSize),
    ),
  );
}

void showToast({required String label}) {
  Fluttertoast.showToast(
    msg: label,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.white,
    textColor: Colors.black54,
    fontSize: 16.0,
  );
}

void deleteDialog(
  BuildContext context,
  Review review,
  ReviewListNotifier reviewListNotifier,
) {
  showDialog(
    context: context,
    builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AlertDialog(
            title: Text(
              '『${review.title}』のレビューを削除してもよろしいですか？',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('いいえ'),
              ),
              TextButton(
                onPressed: () {
                  reviewListNotifier.deleteReview(
                    reviewId: review.id!,
                  );
                  Navigator.pop(context);
                },
                child: const Text('はい'),
              )
            ],
          ),
        ],
      );
    },
  );
}

void logOutDialog(
  BuildContext context,
) {
  showDialog(
    context: context,
    builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AlertDialog(
            title: const Text(
              '本当にログアウトしますか？',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('いいえ'),
              ),
              TextButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pop(context);
                },
                child: const Text('はい'),
              )
            ],
          ),
        ],
      );
    },
  );

  void showToast({required String label}) {
    Fluttertoast.showToast(
      msg: label,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.white,
      textColor: Colors.black54,
      fontSize: 16.0,
    );
  }
}
