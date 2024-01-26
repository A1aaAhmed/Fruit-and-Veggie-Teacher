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
        title: Text(widget.title, textAlign: TextAlign.center),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                height: 400,
                child: const Image(
                  image: AssetImage('assets/Guess_who.jpg'),
                ),
              ),
              const SizedBox(height: 40),
              TextButton(
                  onPressed: () {},
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
              const SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {},
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
                          "Upload Picture",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
