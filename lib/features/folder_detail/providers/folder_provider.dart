import 'package:cocoforms/features/folder_detail/data/models/folder_model.dart';
import 'package:cocoforms/features/folder_detail/data/repositories/folder_repository.dart';
import 'package:flutter/material.dart';

class FolderChangeNotifier extends ChangeNotifier {
  final FolderRepository _folderRepository;
  bool initialized = false;

  List<FolderModel> _folders = [];
  List<FolderModel> get forms {
    if (!initialized) {
      getAll();
    }

    return _folders;
  }

  FolderChangeNotifier({required FolderRepository folderRepository})
      : _folderRepository = folderRepository {
    getAll();
  }

  Future<void> getAll() async {
    _folders = await _folderRepository.getAll();
    notifyListeners();
  }

  Future<void> add(FolderModel form) async {
    await _folderRepository.insert(form);
    notifyListeners();
  }

  Future<void> delete(FolderModel form) async {
    await _folderRepository.delete(form.id);
    notifyListeners();
  }

  Future<void> update(FolderModel form) async {
    await _folderRepository.update(form);
    notifyListeners();
  }

  Future<void> deleteAll() async {
    await _folderRepository.deleteAll();
    notifyListeners();
  }
}
