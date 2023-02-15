import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

/*
class AddUser extends StatefulWidget {

  @override
  _State createState() => new _State();
}

class _State extends State<AddUser> {

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    Future<void> addUser() {
      return users
          .doc('Salma123')
          .set({
        'full_name': "Cherkaoui Salma",
        'age': 22
      }, SetOptions(merge: true),
      )
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    Future<void> updateUser() {
      return rootBundle
        .load('assets/welcome.png')
        .then((bytes) => bytes.buffer.asUint8List())
        .then((avatar) {
        return users
            .doc('Salma123')
            .update({'info.avatar': Blob(avatar)});
      })
          .then((value) => print("User Updated"))
          .catchError((error) => print("Failed to update user: $error"));
    }

    Future<void> deleteUser() {
      return users
          .doc('Salma123')
          .delete()
          .then((value) => print("User Deleted"))
          .catchError((error) => print("Failed to delete user: $error"));
    }

    Future<void> deleteField() {
      return users
          .doc('Salma123')
          .update({'age': FieldValue.delete()})
          .then((value) => print("User's Property Deleted"))
          .catchError((error) => print("Failed to delete user's property: $error"));
    }
  }
}
 */