import 'package:flutter/material.dart';
import 'ResultView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue[200],
        body: const SafeArea(
          child: HomePage(),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final myController = TextEditingController();
  var fruitList = [
    'Orange',
    'Apple',
    'Mango',
    'Jack-fruit',
    'Rambutan',
    'Guava',
    'Pineapple'
  ];
  String answer = "";

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Please Choose a Fruit number?",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: deviceWidth - 100,
              height: 50,
              child: TextField(
                controller: myController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.only(left: 30),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 6),
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                  ),
                  hintText: 'Enter a choice 1, 2, 3, ...',
                  hintStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.black26,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                cursorColor: Colors.orange[800],
              ),
            ),
          ),
          ElevatedButton(
            child: const Text('Click'),
            onPressed: () {
              if (int.parse(myController.text) <= 0 ||
                  int.parse(myController.text) > fruitList.length) {
                setState(() {
                  answer =
                      "There is only ${fruitList.length} fruits.\nYou enter wrong number.";
                });
              } else {
                setState(() {
                  answer = fruitList[(int.parse(myController.text)) - 1];
                });
              }
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultView(answer),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.blue[600],
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              textStyle: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
