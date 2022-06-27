import 'package:flutter/material.dart';
import 'package:motivation_quotes/widgets/theme.dart';

class SecBoardingPage extends StatelessWidget {
  SecBoardingPage({Key? key}) : super(key: key);

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
                "What is your name?",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Your name",
                      fillColor: lightGreyClr),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
