import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motivation_quotes/controllers/quotes_controller.dart';
import 'package:motivation_quotes/models/quotes.dart';
import 'package:share_plus/share_plus.dart';
import '../controllers/auth_controller.dart';

// ignore: must_be_immutable
class QuoteWidget extends StatelessWidget {
  final int index;
  final Quotes quotes;
  final QuotesController quotesController;

  const QuoteWidget(
      {Key? key,
      required this.index,
      required this.quotes,
      required this.quotesController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onDoubleTap: () {
      //   Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       IconButton(
      //         onPressed: () {
      //           quotesController
      //               .likeQuote(quotesController.currentQuoteId.value);
      //         },
      //         icon: quotesController.currentquotesLike
      //                 .contains(Get.find<AuthController>().user!.uid)
      //             ? Icon(Icons.favorite)
      //             : Icon(Icons.favorite_border),
      //         color: quotesController.currentquotesLike
      //                 .contains(Get.find<AuthController>().user!.uid)
      //             ? Colors.red
      //             : Colors.white,
      //         iconSize: 35,
      //       ),
      //       IconButton(
      //         onPressed: () {
      //           Share.share(quotes.quote!, subject: 'Read This Quote');
      //         },
      //         icon: Icon(Icons.share),
      //         color: Colors.white,
      //         iconSize: 35,
      //       ),
      //     ],
      //   );
      // },
      child: Container(
        color: Colors.black,
        padding: EdgeInsets.only(left: 22, right: 22, top: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText(
              quotes.quote!,
              textAlign: TextAlign.center,
              maxFontSize: 30,
              minFontSize: 25,
              style: TextStyle(
                color: Colors.white,
                fontFamily: quotesController.fontFam.value,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: quotes.author == ''
                  ? Text(
                      '-Anonymous',
                      style: GoogleFonts.cinzel(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    )
                  : Text(
                      '- ${quotes.author!}',
                      style: GoogleFonts.raleway(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                      ),
                    ),
            ),
            // Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            // children: [
            // IconButton(
            //   onPressed: () {
            //     quotesController
            //         .likeQuote(quotesController.currentQuoteId.value);
            //   },
            //   icon: quotesController.currentquotesLike
            //           .contains(Get.find<AuthController>().user!.uid)
            //       ? Icon(Icons.favorite)
            //       : Icon(Icons.favorite_border),
            //   color: quotesController.currentquotesLike
            //           .contains(Get.find<AuthController>().user!.uid)
            //       ? Colors.red
            //       : Colors.white,
            //   iconSize: 35,
            // ),
            // IconButton(
            //   onPressed: () {
            //     Share.share(quotes.quote!, subject: 'Read This Quote');
            //   },
            //   icon: Icon(Icons.share),
            //   color: Colors.white,
            //   iconSize: 35,
            // ),
            // ],
            // ),
          ],
        ),
      ),
    );
  }
}
