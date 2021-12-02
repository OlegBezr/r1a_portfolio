import 'package:flutter/material.dart';

@immutable
class CardData {
  final String question;
  final String answer;
  final bool isFake;
  final int id;

  const CardData({
    required this.question, 
    required this.answer,
    this.isFake = false,
    this.id = -1,
  });
}