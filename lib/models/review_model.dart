import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

part 'review_model.freezed.dart';
part 'review_model.g.dart';

@freezed
class Review with _$Review {
  Review._();
  factory Review({
    String? id,
    required String title,
    @Default(0) double rating,
    required String impression,
    String? imgURL,
  }) = _Review;

  factory Review.empty() => Review(title: '', impression: '');

  factory Review.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    return Review.fromJson(data).copyWith(id: doc.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}
