import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:cocoforms/objectbox.g.dart'; // created by `flutter pub run build_runner build`

class ObjectBox {
  /// The Store of this app.
  static Store? store;

  ObjectBox._create() {
    // Add any additional setup code, e.g. build queries.
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<ObjectBox> create() async {
    if (ObjectBox.store != null) return ObjectBox._create();
    final docsDir = await getApplicationDocumentsDirectory();
    // Future<Store> openStore() {...} is defined in the generated objectbox.g.dart
    ObjectBox.store =
        await openStore(directory: p.join(docsDir.path, "obx-example"));
    return ObjectBox._create();
  }
}
