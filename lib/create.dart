import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class create extends StatefulWidget {
  const create({super.key});

  @override
  State<create> createState() => _create();
}

class _create extends State<create> {

  //the controllers
  final nameController = TextEditingController();
  final makeController = TextEditingController();
  final plateController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create'),
          backgroundColor: Colors.amber,
        ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          TextFormField(
            //getting users name
            controller: nameController,
            decoration: const InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 24),
          TextFormField(
            //getting users car make
            controller: makeController,
            decoration: const InputDecoration(
              labelText: 'Car Make',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 24),
          TextFormField(
            //getting users car license plate number
            controller: plateController,
            decoration: const InputDecoration(
              labelText: 'Car Plate',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
              onPressed: () {
                final user = User(
                    name: nameController.text,
                    carMake: makeController.text,
                    carPlate: plateController.text
                );
                createUser(user);
                Fluttertoast.showToast(
                    msg: "Successfully Created",
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
                Navigator.pop(context);
                },
              child: const Text('Create'))
        ],
      )
    );
  }

  Future createUser(User user) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    user.id = docUser.id;
    final json = user.toJason();
    await docUser.set(json);
  }
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

  Map<String, dynamic> toJason() => {
    'id': id,
    'name': name,
    'carmake': carMake,
    'carplate': carPlate,
  };
}