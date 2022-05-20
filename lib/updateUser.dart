import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/update.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class updateUser extends StatefulWidget {
  const updateUser({super.key});

  @override
  State<updateUser> createState() => _updateUser();
}

class _updateUser extends State<updateUser> {

  //the controllers
  final nameController = TextEditingController();
  final makeController = TextEditingController();
  final plateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update'),
        backgroundColor: Colors.amber,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          TextField(
            //updating users name
            controller: nameController,
            decoration: const InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 24),
          TextField(
            //updating users car make
            controller: makeController,
            decoration: const InputDecoration(
              labelText: 'Car Make',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 24),
          TextField(
            //updating users car license plate
            controller: plateController,
            decoration: const InputDecoration(
              labelText: 'Car Plate',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
              onPressed: () {
                final docUser = FirebaseFirestore.instance
                    .collection('users')
                    .doc(updatingID);

                docUser.update({
                  'name': nameController.text,
                  'carmake': makeController.text,
                  'carplate': plateController.text
                });
                Fluttertoast.showToast(
                    msg: "Successfully Updated",
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                );

                Navigator.pop(context);
              },
              child: const Text('Update'))
        ],
      ),
    );
  }
}
