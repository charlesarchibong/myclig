import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:meta/meta.dart';

abstract class UploadToFirebase {
  Future<String> upload(File file, String node);
}

class UploadToFirebaseImpl implements UploadToFirebase {
  final firebase_storage.FirebaseStorage firebaseStorage;
  UploadToFirebaseImpl({
    @required this.firebaseStorage,
  });

  @override
  Future<String> upload(File file, String node) async {
    firebase_storage.TaskSnapshot taskSnapshot = await firebase_storage
        .FirebaseStorage.instance
        .ref('$node')
        .putFile(file);
    return await taskSnapshot.ref.getDownloadURL();
  }
}
