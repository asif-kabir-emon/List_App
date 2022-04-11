import 'package:flutter/material.dart';
import 'main.dart';

class ResultView extends StatelessWidget {
  final String answer;
  const ResultView(this.answer, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 2, horizontal: 30),
                child: Text(
                  answer,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              ElevatedButton(
                child: const Text("Return"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  textStyle: const TextStyle(
                    fontSize: 17,
                  ),
                ),
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyApp(),
                    ),
                  ),
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
