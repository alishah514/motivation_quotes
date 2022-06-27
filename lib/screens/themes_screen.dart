import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motivation_quotes/controllers/themes_controller.dart';
import 'package:motivation_quotes/screens/quotes_screen.dart';

import '../widgets/theme.dart';

class ThemesScreen extends StatelessWidget {
  ThemesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: context.theme.backgroundColor,
        elevation: 0.0,
        title: Text(
          "Themes",
          style: appBarTextStyle,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: context.theme.iconTheme.color,
          ),
          onPressed: () {
            Get.back();
          },
          color: context.theme.iconTheme.color,
        ),
      ),
      body: Container(
          child: GetX<ThemingController>(
              init: Get.put<ThemingController>(ThemingController()),
              builder: (ThemingController themingController) {
                return GridView.builder(
                  itemCount: themingController.fonts.length,
                  itemBuilder: (context, index) {
                    return ItemTile(
                      path: themingController.fonts[index].themeBackground!,
                      font: themingController.fonts[index].themeName!,
                      specificFont: themingController.fonts[index].themeFont!,
                      onTap: () {
                        themingController
                            .saveBackground(
                                themingController.fonts[index].themeFont!,
                                themingController.fonts[index].themeBackground!)
                            .then((value) => {Get.to(() => QuotesScreen())});
                        // themingController.getMyFont();
                      },
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.8,
                  ),
                );
              })),
    );
  }
}

class ItemTile extends StatelessWidget {
  final String font;
  final String specificFont;
  final String path;
  final VoidCallback onTap;

  const ItemTile(
      {required this.font,
      required this.specificFont,
      required this.path,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Stack(
          children: [
            Container(
              height: 170,
              width: 130,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8),
              ),
              child: CachedNetworkImage(
                imageUrl: path,
                fit: BoxFit.fill,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress)),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Center(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(
                font,
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: specificFont, fontSize: 25),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
