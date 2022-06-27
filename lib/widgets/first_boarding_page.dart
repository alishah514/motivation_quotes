import 'package:flutter/material.dart';

class FirstBoardingPage extends StatelessWidget {
  const FirstBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/1.jpg",
                  )),
            ),
          ),
          SizedBox(height: 50),
          Column(
            children: [
              Text(
                "Self Care",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              Text(
                "Self love",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              Text(
                "Self growth",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
