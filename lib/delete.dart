import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class delete extends StatefulWidget {
  const delete({super.key});

  @override
  State<delete> createState() => _delete();
}

class _delete extends State<delete> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Long Press To Delete User'),
        backgroundColor: Colors.amber,
      ),
      body: StreamBuilder<List<User>>(
        stream: readUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong ${snapshot.error}');
          }else if (snapshot.hasData) {
            final users = snapshot.data!;
            return ListView(
              children: users.map(buildUser).toList(),
            );
          }else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget buildUser(User user) => ListTile(
    onLongPress: (){
      final docUser = FirebaseFirestore.instance
          .collection('users')
          .doc(user.id);

      docUser.delete();
      Fluttertoast.showToast(
        msg: "Successfully Deleted",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
      );
    },
    leading:  const CircleAvatar(
      child: Icon(Icons.time_to_leave),
    ),
    title: Text(user.name),
    subtitle: Text('Car Make = ${user.carMake}\nCar License Plate = ${user.carPlate}'),
  );

  Stream<List<User>> readUsers() => FirebaseFirestore.instance
      .collection('users')
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());
}
class User {
  String id;
  final String name;
  final String carMake;
  final String carPlate;

  User({
    this.id = '',
    required this.name,
    required this.carMake,
    required this.carPlate,
  });

  static User fromJson(Map<String, dynamic> json) => User(
      id: json['id'],
      name: json['name'],
      carMake: json['carmake'],
      carPlate: json['carplate']
  );
}