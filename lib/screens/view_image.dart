import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fruit_and_veggie_teacher/screens/results.dart';
import 'package:image_picker/image_picker.dart';

// if we need to make var optional we can use []
class ViewImage extends StatelessWidget {
  final XFile? image;
  final String title;
  String res = "blah";
  ViewImage({super.key, required this.title, required this.image});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title, textAlign: TextAlign.center),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
                child: Text(
                  "Let's play a guessing game! Can you figure out what's in front of you?",
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
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
                      : const Center(child: Text("Please try again!"))
                  // const Image(
                  //   image: AssetImage('assets/Guess_who.jpg'),
                  // ),
                  ),
              const SizedBox(height: 20),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Results(image: image, title: title, res: res)));
                  },
                  child: Container(
                    height: 60,
                    width: 200,
                    color: Colors.red,
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsetsDirectional.symmetric(horizontal: 20),
                    child: const Text(
                      "Let's find out!",
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
            ],
          ),
        ));
  }
}
