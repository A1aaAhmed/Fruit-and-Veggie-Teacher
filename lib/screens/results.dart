import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruit_and_veggie_teacher/screens/home_pasge.dart';
import 'package:image_picker/image_picker.dart';

class Results extends StatelessWidget {
  final XFile? image;
  final String title;
  const Results(
      {super.key, required this.title, required this.image, required this.res});
  final String res;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title, textAlign: TextAlign.center),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
                child: Center(
                  child: Text(
                    "It's a $res",
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                  padding: const EdgeInsets.all(5),
                  height: 400,
                  child: image != null
                      ? Image.file(
                          File(image!.path),
                          fit: BoxFit.cover,
                        )
                      : const Center(child: Text("Please try again!"))),
              const SizedBox(height: 20),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyHomePage(title: title)),
                    );
                  },
                  child: Container(
                    height: 60,
                    width: 200,
                    color: Colors.red,
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsetsDirectional.symmetric(horizontal: 20),
                    child: const Text(
                      "Discover More",
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
            ],
          ),
        ));
  }
}
