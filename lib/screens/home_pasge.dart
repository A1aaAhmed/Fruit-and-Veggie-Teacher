import 'package:flutter/material.dart';
import 'package:fruit_and_veggie_teacher/screens/view_image.dart';
import 'package:image_picker/image_picker.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  XFile? image;
  final ImagePicker picker = ImagePicker();
  Future getImage(ImageSource media) async {
    image = await picker.pickImage(source: media);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, textAlign: TextAlign.center),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 400,
              child: const Image(
                image: AssetImage('assets/Guess_who.jpg'),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
                onPressed: () {
                  getImage(ImageSource.gallery).then((value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ViewImage(image: image, title: widget.title)),
                      ));
                },
                child: Container(
                  height: 60,
                  width: 200,
                  color: Colors.red,
                  padding:
                      const EdgeInsetsDirectional.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.image, color: Colors.white),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Upload Picture",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                )),
            TextButton(
                onPressed: () {
                  getImage(ImageSource.camera).then((value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ViewImage(image: image, title: widget.title)),
                      ));
                },
                child: Container(
                  width: 200,
                  height: 60,
                  color: Colors.red,
                  padding:
                      const EdgeInsetsDirectional.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Take Picture",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
