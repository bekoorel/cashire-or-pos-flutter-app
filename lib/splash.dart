import 'package:flutter/material.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  child: Text(
                "BEKOOREL . POS",
                style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 60,
                    fontWeight: FontWeight.bold),
              )),
              Container(
                  child: Text(
                "الحل الامثل لاداره المنشأت التجاريه",
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 20,
                ),
              )),
              Container(
                  child: Text(
                "مطور بواسطه احمد رمضان",
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 15,
                ),
              )),
              SizedBox(
                height: 20.0,
              ),
              Container(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamedAndRemoveUntil("/pos", (route) => false);
                      },
                      child: Text("Sign In"))),
            ],
          ),
          Container(
            width: 800.0,
            height: 800.0,
            child: Image(
              image: AssetImage("assets/pos.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
