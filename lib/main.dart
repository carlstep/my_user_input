import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'User Input',
      home: BillInput(),
    );
  }
}

class BillInput extends StatefulWidget {
  const BillInput({Key? key}) : super(key: key);

  @override
  State<BillInput> createState() => _BillInputState();
}

class _BillInputState extends State<BillInput> {
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    myController.addListener(_printInputValue);
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  _printInputValue() {
    print('_printInputValue: ${myController.text}');
  }

  double billAmount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InputData'),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: ((value) {
              setState(() {
                billAmount = double.parse(value);
              });
            }),
            controller: myController,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  myController.clear();
                },
                icon: const Icon(Icons.clear),
              ),
            ),
          ),
          Text('this is my input - $billAmount'),
        ],
      ),
    );
  }
}
