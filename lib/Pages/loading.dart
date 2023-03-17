import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 4, 109, 196),
              Color.fromARGB(255, 109, 243, 232),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150,
                width: 150,
                child: Column(children: [
                  Container(
                    child: Image.asset(
                      "assets/weather_icon.png",
                    ),
                  )
                ]),
              ),
              GradientText(
                'GhamPani',
                style: TextStyle(
                  fontSize: 20.0,
                ),
                colors: [
                  Color.fromARGB(255, 4, 109, 196),
                  Color.fromARGB(255, 2, 65, 59),
                ],
              ),
              Container(
                child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 109, 243, 232),
                  backgroundColor: Colors.blueAccent,
                ),
                height: 20,
                width: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
