import 'package:crud/create.dart';
import 'package:crud/delete.dart';
import 'package:crud/read.dart';
import 'package:crud/update.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class task3 extends StatelessWidget {
  const task3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 3'),
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const create()));
                },
                child: const Text('Create'),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const read()));
                },
                child: const Text('Read'),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const update()));
                },
                child: const Text('Update'),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const delete()));
                },
                child: const Text('Delete'),
              ),
            ],
          )
      ),
    );
  }
}