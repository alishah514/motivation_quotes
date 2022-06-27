import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motivation_quotes/widgets/category_cards.dart';

import '../widgets/theme.dart';

class CategpriesScreen extends StatelessWidget {
  const CategpriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xE4E5EA),
        appBar: AppBar(
          backgroundColor: Color(0xE4E5EA),
          elevation: 0.0,
          title: Text(
            "Categories",
            style: appBarTextStyle,
          ),
          leading: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: () {
              Get.back();
            },
            color: context.theme.iconTheme.color,
          ),
          // actions: [
          //   IconButton(
          //       onPressed: () {},
          //       icon: Icon(
          //         Icons.search,
          //         color: context.theme.iconTheme.color,
          //       ))
          // ],
        ),
        body: CategoryCard());
  }
}
