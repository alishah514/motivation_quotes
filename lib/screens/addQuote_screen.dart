import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motivation_quotes/Services/firestore_services.dart';
import 'package:motivation_quotes/controllers/auth_controller.dart';
import 'package:motivation_quotes/controllers/ownQuotes_controller.dart';
import 'package:share_plus/share_plus.dart';

import '../widgets/theme.dart';

class AddQuote extends StatelessWidget {
  AddQuote({Key? key}) : super(key: key);

  final TextEditingController _quoteController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final OwnQuotesController ownQuotesController =
      Get.put(OwnQuotesController());

  @override
  Widget build(BuildContext context) {
    ownQuotesController.fetchOwnQuotes();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.backgroundColor,
        elevation: 0.0,
        leadingWidth: 30,
        title: Text(
          "Added",
          style: appBarTextStyle,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
          color: context.theme.iconTheme.color,
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
                flex: 10,
                child: GetX<OwnQuotesController>(
                    init: Get.put<OwnQuotesController>(OwnQuotesController()),
                    builder: (OwnQuotesController ownQuotesController) {
                      if (ownQuotesController.quotes.isNotEmpty) {
                        return ListView.builder(
                            itemCount: ownQuotesController.quotes.length,
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
                                            ownQuotesController
                                                .quotes[index].quote!,
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
                                              backgroundColor: lightGreyClr,
                                              content: Column(
                                                children: [
                                                  TextButton(
                                                      onPressed: () {
                                                        Share.share(
                                                            ownQuotesController
                                                                .quotes[index]
                                                                .quote!,
                                                            subject:
                                                                'Read This Quote');
                                                        Get.back();
                                                      },
                                                      child: Text(
                                                          "Share this quote")),
                                                  TextButton(
                                                      onPressed: () {
                                                        ownQuotesController
                                                            .removeFav(
                                                                ownQuotesController
                                                                    .quotes[
                                                                        index]
                                                                    .id!);
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
                            }));
                      } else {
                        return Container(
                            child: Center(
                                child: Text(
                          "No Quotes From You",
                          style: headingTextStyle,
                        )));
                      }
                    })),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () {
                    Get.defaultDialog(
                        title: '',
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Add New Quote",
                              style: headingTextStyle,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                "Write Your And Share Your Own Quote",
                                style: bodyTextStyle,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: new ConstrainedBox(
                                  constraints: new BoxConstraints(
                                    minWidth: MediaQuery.of(context).size.width,
                                    maxWidth: MediaQuery.of(context).size.width,
                                    minHeight: 55,
                                    maxHeight: 75.0,
                                  ),
                                  child: new SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    reverse: true,

                                    // here's the actual text box
                                    child: new TextField(
                                      keyboardType: TextInputType.multiline,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: BorderSide.none),
                                        filled: true,
                                      ),
                                      maxLines: null, //grow automatically

                                      controller: _quoteController,
                                      onSubmitted: (value) {},
                                    ),
                                    // ends the actual text box
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide.none),
                                  filled: true,
                                  hintText: 'Author',
                                ),
                                controller: _authorController,
                                onSubmitted: (value) {},
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (_quoteController.text != "") {
                                  FirestoreDb().addOwnQuote(
                                      quote: _quoteController.text,
                                      author: _authorController.text == ''
                                          ? ''
                                          : _authorController.text,
                                      uid:
                                          Get.find<AuthController>().user!.uid);
                                  Get.snackbar('SUCCES', 'Quote Added',
                                      backgroundColor: lightGreyClr,
                                      icon: Icon(Icons.check),
                                      snackPosition: SnackPosition.BOTTOM,
                                      duration: (Duration(seconds: 2)));
                                  _quoteController.clear();
                                  _authorController.clear();
                                  Get.back();
                                } else {
                                  Get.snackbar('ALERT !', 'Add Quote',
                                      barBlur: 20,
                                      icon: Icon(Icons.add_alert),
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor: lightGreyClr,
                                      duration: (Duration(seconds: 2)));
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black,
                                  ),
                                  child: Center(
                                    child: Text('Save',
                                        style: TextStyle(
                                          color: Colors.white,
                                        )),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black,
                      ),
                      child: Center(
                        child: Text('Add quote',
                            style: TextStyle(
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
