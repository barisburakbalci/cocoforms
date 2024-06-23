import 'package:cocoforms/features/form_edit/data/models/question_model.dart';
import 'package:cocoforms/features/form_edit/data/repositories/question_repository.dart';
import 'package:flutter/material.dart';

class QuestionChangeNotifier with ChangeNotifier {
  final QuestionRepository _questionRepository;

  final List<QuestionModel> _questions = [];
  List<QuestionModel> get questions {
    return _questions;
  }

  QuestionChangeNotifier({required QuestionRepository questionRepository})
      : _questionRepository = questionRepository;
}
