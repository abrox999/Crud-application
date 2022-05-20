import 'package:flutter/material.dart';

class task1 extends StatefulWidget {
  const task1({super.key});

  @override
  State<task1> createState() => _License();

}

class _License extends State<task1>{
  final licensePlateController = TextEditingController();

  //regular expression for validation the vehicles plates
  final newCar = RegExp(r"^([a-zA-Z]{2}\s)?[a-zA-Z]{2,3}\s?(-|\s)\s?[0-9]{4}$");
  final oldCar = RegExp(r"^[0-9]{1,3}\s?(-|\s)\s?[0-9]{4}$");
  final vintageCar = RegExp(r"^[0-9]{1,2}\s?(ශ්‍රී|\s)\s?[0-9]{4}$");
  String _plate = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 1'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(32),
          children: [
            getVNumber(),
            const SizedBox(height: 24),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _plate = licensePlateController.text;
                  });
                },
                child: const Text('Submit'),
            ),
            if(newCar.hasMatch(_plate))...[
              const Text("This Vehicle is New"),
            ]else if(oldCar.hasMatch(_plate))...[
              const Text("This Vehicle is Old"),
            ]else if(vintageCar.hasMatch(_plate))...[
              const Text("This Vehicle is Vintage"),
            ]else...[
              const Text("Invalid Plate Number")
            ]
          ],
        ),
      ),
    );
  }
  //textfeild box info
  Widget getVNumber() => TextField(
    controller: licensePlateController,
    decoration: const InputDecoration(
      labelText: 'License plate',
      border: OutlineInputBorder(),
    ),
  );

}