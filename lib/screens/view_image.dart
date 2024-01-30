import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fruit_and_veggie_teacher/screens/results.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

// if we need to make var optional we can use []
class ViewImage extends StatelessWidget {
  final XFile? image;
  final String title;
  var output;

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/model.tflite",
    );
  }

  classifyImage() async {
    output = await Tflite.runModelOnImage(
        path: image!.path,
        imageMean: 0.0, // defaults to 117.0
        imageStd: 255.0, // defaults to 1.0
        numResults: 2, // defaults to 5
        threshold: 0.2, // defaults to 0.1
        asynch: true // defaults to true

        );
  }

  String res = "Apple";
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
                      : const Center(child: Text("Please try again!"))),
              const SizedBox(height: 20),
              TextButton(
                  onPressed: () {
                    try {
                      print("yy");
                      loadModel().then((value) {
                        print("done load model");
                        classifyImage().then((value) {
                          print("done classy");
                          Tflite.close().then((value) {
                            print("done");
                            print(output);
                            res = output[0]["label"];
                            print(res);
                            print(res);
                          });
                        });
                      });
                    } catch (e) {
                      print(e);
                    }
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Results(
                                image: image,
                                title: title,
                                res: output != null ? res : "Apple")));
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
