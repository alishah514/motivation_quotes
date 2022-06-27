import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motivation_quotes/controllers/quotes_controller.dart';
import 'package:motivation_quotes/widgets/theme.dart';
import 'package:share_plus/share_plus.dart';

import '../controllers/favourite_controller.dart';

class FavouritesScreen extends StatelessWidget {
  FavouritesScreen({Key? key}) : super(key: key);
  final FavController favController = Get.put(FavController());
  final QuotesController quotesController = Get.put(QuotesController());

  @override
  Widget build(BuildContext context) {
    favController.fetchFav();
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: context.theme.backgroundColor,
        elevation: 0.0,
        title: Text(
          "Favorites",
          style: appBarTextStyle,
        ),
        leading: IconButton(
          icon: Icon(Icons.close),
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
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Obx(
            () => ListView.builder(
              itemCount: favController.favQuotes.length,
              itemBuilder: ((context, index) {
                return Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    width: 0.4,
                    color: lightGreyClr,
                  ))),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 20.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              favController.favQuotes[index].quote!,
                              style: GoogleFonts.raleway(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            Get.defaultDialog(
                                title: '',
                                barrierDismissible: true,
                                backgroundColor: context.theme.backgroundColor,
                                content: Column(
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          Share.share(
                                              favController
                                                  .favQuotes[index].quote!,
                                              subject: 'Read This Quote');
                                          Get.back();
                                        },
                                        child: Text("Share this quote")),
                                    TextButton(
                                        onPressed: () {
                                          quotesController.removeFav(
                                              favController
                                                  .favQuotes[index].id!);
                                          Get.back();
                                        },
                                        child: Text("Remove"))
                                  ],
                                ));
                          },
                          icon: Icon(Icons.more_vert))
                    ],
                  ),
                );
              }),
            ),
          )),
    );
  }
}
