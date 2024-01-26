import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: const Image(
                image: AssetImage('assets/Guess_who.jpg'),
              ),
            ),
            TextButton(
                onPressed: () {},
                child: Container(
                  padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 100, vertical: 20),
                  child: Row(
                    children: const [
                      Text("Upload Picture"),
                      Icon(Icons.image, color: Colors.white)
                    ],
                  ),
                )),
            TextButton(
                onPressed: () {},
                child: Container(
                  padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 100, vertical: 20),
                  child: Row(
                    children: const [
                      Text("Upload Picture"),
                      Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
