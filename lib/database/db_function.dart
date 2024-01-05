import 'package:auto_critic/database/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:sqflite/sqflite.dart';

ValueNotifier<List<UserModel>> userListNotifier =
    ValueNotifier<List<UserModel>>([]);
//ValueNotifier<List<String>> imageListNotifier = ValueNotifier([]);

Future<void> getUsers() async {
  final userDB = Hive.box<UserModel>('user_db');
  userListNotifier.value = userDB.values.toList();
  userListNotifier.notifyListeners();
}

Future<void> addUser(UserModel value) async {
  final userDB = Hive.box<UserModel>('user_db');
  await userDB.add(value);
  await getUsers();
}
// late Database db;
// Future<void> createDataBase() async {
//  db = await openDatabase('image.db',
//   version: 1,
//   onCreate: (db, version) async {
//     await db.execute('CREATE TABLE image (id INTEGER PRIMARY KEY,image TEXT)');
//   },
//   );
//   await getData();
// }
// Future<void> insert({required String image}) async {
//   await db.rawInsert('INSERT INTO image(image) VALUES(?)',
//   [image]);
//   await getData();
// }
// Future<void> getData() async {
//   imageListNotifier.value.clear();
//   final data = await db.rawQuery('SELECT * FROM image');
// for(var map in data){
//   String image=map['image']as String;
// imageListNotifier.value.add(image);
// }
// imageListNotifier.notifyListeners();
// }

