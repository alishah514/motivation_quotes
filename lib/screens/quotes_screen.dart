// import 'dart:io';
// import 'dart:math';
// import 'dart:typed_data';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
// import 'package:motivation_quotes/controllers/quotes_controller.dart';
// import 'package:motivation_quotes/models/quotes.dart';
// import 'package:motivation_quotes/screens/category_screen.dart';
// import 'package:motivation_quotes/screens/user_screen.dart';
// import 'package:motivation_quotes/widgets/theme.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:share/share.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:url_launcher/url_launcher.dart';
// import '../widgets/button.dart';
// import '../widgets/quotes_widget.dart';
// import 'themes_screen.dart';
// import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter.dart';
// import 'package:screenshot/screenshot.dart';

// class QuotesScreen extends StatefulWidget {
//   final String? catId;
//   final String? catName;
//   QuotesScreen({Key? key, this.catId, this.catName}) : super(key: key);

//   @override
//   State<QuotesScreen> createState() => _QuotesScreenState();
// }

// class _QuotesScreenState extends State<QuotesScreen> {
//   final QuotesController quotesController = Get.put(QuotesController());

//   bool _isFavorite = false;
//   int _favoriteCount = 0;

//   var $text;

//   ScreenshotController screenshotController = ScreenshotController();

//   void _toggleFavorite() {
//     setState(() {
//       if (_isFavorite) {
//         _favoriteCount -= 1;
//         _isFavorite = false;
//       } else {
//         _favoriteCount + -1;
//         _isFavorite = true;
//       }
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     quotesController.getIndex();
//     quotesController
//         .fetchQuotes(widget.catId == null ? 'General' : widget.catId!);

//     return Scaffold(
//         backgroundColor: Color(0xE4E5EA),
//         body: Obx(
//           () {
//             return Container(
//               height: MediaQuery.of(context).size.height,
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                 color: Color(0xE4E5EA),
//                 image: DecorationImage(
//                   image: NetworkImage(quotesController.backImage.value),
//                   fit: BoxFit.none,
//                 ),
//               ),
//               child: Stack(
//                 alignment: Alignment.bottomCenter,
//                 children: [
//                   Obx(
//                     () {
//                       if (quotesController.quotes.isEmpty) {
//                         return Center(
//                           child: Text(
//                             $text = "No Quotes in this Category",
//                             style: TextStyle(
//                               fontFamily: 'Cinzel',
//                               color: Colors.white,
//                             ),
//                           ),
//                         );
//                       }
//                       return PageView.builder(
//                           itemCount: quotesController.quotes.length,
//                           scrollDirection: Axis.vertical,
//                           controller: quotesController.pageControll,
//                           physics: BouncingScrollPhysics(),
//                           onPageChanged: quotesController.selectedPagexNumber,
//                           itemBuilder: (context, index) {
//                             quotesController.currentQuoteId.value =
//                                 quotesController.quotes[index].id!;
//                             quotesController.currentquotesLike.value =
//                                 quotesController.quotes[index].likes!;
//                             return QuoteWidget(
//                               quotesController: quotesController,
//                               index: index,
//                               quotes: Quotes(
//                                   author: quotesController
//                                               .quotes[index].author ==
//                                           ''
//                                       ? ''
//                                       : quotesController.quotes[index].author,
//                                   quote: quotesController.quotes[index].quote),
//                             );
//                           });
//                     },
//                   ),
//                   Center(
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 400.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Row(
//                             children: [
//                               IconButton(
//                                 icon: Icon(
//                                   Icons.share,
//                                   size: 30,
//                                   color: Colors.white,
//                                 ),
//                                 // onPressed: () async {
//                                 //   await Share.share(text);
//                                 // },
//                                 onPressed: () {
//                                   _bottomSheet(context);
//                                 },
//                               ),
//                               SizedBox(width: 2),
//                               IconButton(
//                                 icon: Icon(
//                                   _isFavorite
//                                       ? Icons.favorite
//                                       : Icons.favorite_border,
//                                   size: 30,
//                                   color:
//                                       _isFavorite ? Colors.red : Colors.white,
//                                 ),
//                                 onPressed: _toggleFavorite,
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(15.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(bottom: 15.0),
//                           child: Row(
//                             children: [
//                               IconButtonText(
//                                   height: 50,
//                                   width: 110,
//                                   icon: Icons.dashboard_outlined,
//                                   catName: widget.catName == null
//                                       ? 'General'
//                                       : widget.catName!,
//                                   onTap: () => Get.to(CategpriesScreen())),
//                             ],
//                           ),
//                         ),
//                         Row(
//                           children: [
//                             IconBtn(
//                               height: 50,
//                               width: 50,
//                               icon: Icons.format_paint_outlined,
//                               onTap: () {
//                                 Get.to(() => ThemesScreen());
//                                 // quotesController.isFavorite.value = true;
//                               },
//                             ),
//                             IconBtn(
//                               height: 50,
//                               width: 50,
//                               icon: Icons.person_outline,
//                               onTap: () {
//                                 Get.to(() => UserScreen());
//                               },
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             );
//           },
//         ));
//   }

//   _bottomSheet(context) {
//     showModalBottomSheet(
//         backgroundColor: Colors.transparent,
//         context: context,
//         builder: (BuildContext context) {
//           return Container(
//             decoration: new BoxDecoration(
//                 color: Colors.white, //new Color.fromRGBO(255, 0, 0, 0.0),
//                 borderRadius: new BorderRadius.only(
//                     topLeft: const Radius.circular(30.0),
//                     topRight: const Radius.circular(30.0))),
//             height: 200,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(top: 18.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Column(
//                         children: [
//                           IconButton(
//                             onPressed: () {
//                               share(SocialMedia.whatsapp);
//                             },
//                             icon: Icon(
//                               FontAwesomeIcons.whatsappSquare,
//                               size: 35,
//                             ),
//                           ),
//                           SizedBox(height: 6),
//                           Text("Whatsapp")
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           IconButton(
//                             onPressed: () {
//                               share(SocialMedia.instagram);
//                             },
//                             icon: Icon(
//                               FontAwesomeIcons.instagramSquare,
//                               size: 35,
//                             ),
//                           ),
//                           SizedBox(height: 6),
//                           Text("Instagram")
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           IconButton(
//                             onPressed: () {
//                               share(SocialMedia.facebook);
//                             },
//                             icon: Icon(
//                               FontAwesomeIcons.facebookSquare,
//                               size: 35,
//                             ),
//                           ),
//                           SizedBox(height: 6),
//                           Text("Facebook")
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           IconButton(
//                             onPressed: () {
//                               share(SocialMedia.twitter);
//                             },
//                             icon: Icon(
//                               FontAwesomeIcons.twitterSquare,
//                               size: 35,
//                             ),
//                           ),
//                           SizedBox(height: 6),
//                           Text("Twitter")
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           IconButton(
//                             onPressed: () async {
//                               await Share.share($text);
//                             },
//                             icon: Icon(
//                               Icons.more_outlined,
//                               size: 30,
//                             ),
//                           ),
//                           SizedBox(height: 6),
//                           Text("More")
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Column(
//                       children: [
//                         IconButton(
//                           onPressed: () {
//                             Clipboard.setData(new ClipboardData(text: $text))
//                                 .then((_) {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                   SnackBar(
//                                       behavior: SnackBarBehavior.floating,
//                                       margin: EdgeInsets.only(bottom: 200.0),
//                                       content:
//                                           Text('Copied to your clipboard !')));
//                             });
//                           },
//                           icon: Icon(
//                             Icons.copy_rounded,
//                             size: 35,
//                           ),
//                         ),
//                         SizedBox(height: 6),
//                         Text(
//                           "Copy Text",
//                           style: TextStyle(fontSize: 12),
//                         )
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         IconButton(
//                           onPressed: () {},
//                           icon: Icon(
//                             Icons.add_box,
//                             size: 35,
//                           ),
//                         ),
//                         SizedBox(height: 6),
//                         Text(
//                           "Add to Collection",
//                           style: TextStyle(fontSize: 12),
//                         )
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         IconButton(
//                           onPressed: () {
//                             _takeScreenShot(1);
//                           },
//                           icon: Icon(
//                             Icons.image,
//                             size: 35,
//                           ),
//                         ),
//                         SizedBox(height: 6),
//                         Text(
//                           "Save Image",
//                           style: TextStyle(fontSize: 12),
//                         )
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         IconButton(
//                           onPressed: () async {
//                             _takeScreenShot(2);
//                           },
//                           icon: Icon(
//                             Icons.wallpaper_rounded,
//                             size: 35,
//                           ),
//                         ),
//                         SizedBox(height: 6),
//                         Text(
//                           "Save as Wallpaper",
//                           style: TextStyle(fontSize: 12),
//                         )
//                       ],
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           );
//         });
//   }

//   Future share(SocialMedia socialPlatform) async {
//     final text = $text;
//     final urlShare = Uri.encodeComponent('https://www.youtube.com');

//     final urls = {
//       SocialMedia.whatsapp: 'https://api.whatsapp.com/send?text=$text$urlShare',
//       SocialMedia.instagram:
//           'https://www.instagram.com/sharer.php?text=$text&url=$urlShare',
//       SocialMedia.facebook:
//           'https://www.facebook.com/sharer/sharer.php?u=$urlShare&t=$text',
//       SocialMedia.twitter:
//           'https://www.twitter.com/intent/tweet?url=$urlShare&text=$text',
//     };

//     final url = urls[socialPlatform]!;

//     if (await canLaunch(url)) {
//       await launch(url);
//     }
//   }

//   saveImage(Uint8List bytes, int task) async {
//     await [Permission.storage].request();

//     // result['filePath'].toString().contains("file://")
//     //     ? result['filePath'].toString().replaceAll(RegExp('file://'), '')
//     //     : result['filePath'].toString().replaceAll(RegExp('content://'), '');

//     if (task == 2) {
//       final directory = await getApplicationDocumentsDirectory();
//       final imagePath = await File('${directory.path}/image.png').create();
//       await imagePath.writeAsBytes(bytes);

//       int location = WallpaperManagerFlutter.BOTH_SCREENS; //Choose screen type

//       WallpaperManagerFlutter().setwallpaperfromFile(
//           imagePath, location); // Wrap with try catch for error management.

//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           behavior: SnackBarBehavior.floating,
//           margin: EdgeInsets.only(bottom: 200.0),
//           content: Text('Wallpaper Saved Successfully')));

//       Navigator.pop(context);
//     } else {
//       final result = await ImageGallerySaver.saveImage(bytes,
//           name: 'Motivation' + new Random().nextInt(100000).toString());

//       final path = result['filePath'];

//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           behavior: SnackBarBehavior.floating,
//           margin: EdgeInsets.only(bottom: 200.0),
//           content: Text('Image Saved Successfully')));

//       Navigator.pop(context);

//       return path;
//     }
//   }

//   void _takeScreenShot(int task) async {
//     final img = await screenshotController.captureFromWidget(Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         decoration: BoxDecoration(
//           color: Color(0xE4E5EA),
//           image: DecorationImage(
//             image: NetworkImage(quotesController.backImage.value),
//             fit: BoxFit.none,
//           ),
//         ),
//         child: Stack(alignment: Alignment.bottomCenter, children: [
//           Obx(
//             () {
//               if (quotesController.quotes.isEmpty) {
//                 return Center(
//                   child: Text(
//                     $text = "No Quotes in this Category",
//                     style: TextStyle(
//                       fontFamily: 'Cinzel',
//                       color: Colors.white,
//                     ),
//                   ),
//                 );
//               }
//               return PageView.builder(
//                   itemCount: quotesController.quotes.length,
//                   scrollDirection: Axis.vertical,
//                   controller: quotesController.pageControll,
//                   physics: BouncingScrollPhysics(),
//                   onPageChanged: quotesController.selectedPagexNumber,
//                   itemBuilder: (context, index) {
//                     quotesController.currentQuoteId.value =
//                         quotesController.quotes[index].id!;
//                     quotesController.currentquotesLike.value =
//                         quotesController.quotes[index].likes!;
//                     return QuoteWidget(
//                       quotesController: quotesController,
//                       index: index,
//                       quotes: Quotes(
//                           author: quotesController.quotes[index].author == ''
//                               ? ''
//                               : quotesController.quotes[index].author,
//                           quote: quotesController.quotes[index].quote),
//                     );
//                   });
//             },
//           ),
//         ])));

//     await saveImage(img, task);
//   }
// }

// enum SocialMedia {
//   whatsapp,
//   instagram,
//   facebook,
//   twitter,
// }
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:motivation_quotes/controllers/quotes_controller.dart';
import 'package:motivation_quotes/models/quotes.dart';
import 'package:motivation_quotes/screens/category_screen.dart';
import 'package:motivation_quotes/screens/user_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/button.dart';
import '../widgets/quotes_widget.dart';
import 'themes_screen.dart';
import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter.dart';
import 'package:screenshot/screenshot.dart';

class QuotesScreen extends StatefulWidget {
  final String? catId;
  final String? catName;
  QuotesScreen({Key? key, this.catId, this.catName}) : super(key: key);

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  late QuotesController quotesController;
  bool _isFavorite = false;
  int _favoriteCount = 0;

  var $text;

  ScreenshotController screenshotController = ScreenshotController();

  void _toggleFavorite() {
    setState(() {
      if (_isFavorite) {
        _favoriteCount -= 1;
        _isFavorite = false;
      } else {
        _favoriteCount + -1;
        _isFavorite = true;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    Get.put(QuotesController());
  }

  @override
  Widget build(BuildContext context) {
    quotesController = Get.find<QuotesController>();
    quotesController.getIndex();
    quotesController
        .fetchQuotes(widget.catId == null ? 'General' : widget.catId!);

    return Scaffold(
        backgroundColor: Color(0xE4E5EA),
        body: Obx(
          () {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                // color: Color(0xE4E5EA),
                image: DecorationImage(
                  image: NetworkImage(quotesController.backImage.value),
                  fit: BoxFit.fill,
                ),
              ),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Obx(
                    () {
                      if (quotesController.quotes.isEmpty) {
                        return Center(
                          child: Text(
                            $text = "No Quotes in this Category",
                            style: TextStyle(
                              fontFamily: 'Cinzel',
                              color: Colors.white,
                            ),
                          ),
                        );
                      }
                      return PageView.builder(
                          itemCount: quotesController.quotes.length,
                          scrollDirection: Axis.vertical,
                          controller: quotesController.pageControll,
                          physics: BouncingScrollPhysics(),
                          onPageChanged: quotesController.selectedPagexNumber,
                          itemBuilder: (context, index) {
                            quotesController.currentQuoteId.value =
                                quotesController.quotes[index].id!;
                            quotesController.currentquotesLike.value =
                                quotesController.quotes[index].likes!;
                            return QuoteWidget(
                              quotesController: quotesController,
                              index: index,
                              quotes: Quotes(
                                  author: quotesController
                                              .quotes[index].author ==
                                          ''
                                      ? ''
                                      : quotesController.quotes[index].author,
                                  quote: quotesController.quotes[index].quote),
                            );
                          });
                    },
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 400.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.share,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                // onPressed: () async {
                                //   await Share.share(text);
                                // },
                                onPressed: () {
                                  _bottomSheet(context);
                                },
                              ),
                              SizedBox(width: 2),
                              IconButton(
                                icon: Icon(
                                  _isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  size: 30,
                                  color:
                                      _isFavorite ? Colors.red : Colors.white,
                                ),
                                onPressed: _toggleFavorite,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: Row(
                            children: [
                              IconButtonText(
                                  height: 50,
                                  width: 110,
                                  icon: Icons.dashboard_outlined,
                                  catName: widget.catName == null
                                      ? 'General'
                                      : widget.catName!,
                                  onTap: () => Get.to(CategpriesScreen())),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            IconBtn(
                              height: 50,
                              width: 50,
                              icon: Icons.format_paint_outlined,
                              onTap: () {
                                Get.to(() => ThemesScreen());
                                // quotesController.isFavorite.value = true;
                              },
                            ),
                            IconBtn(
                              height: 50,
                              width: 50,
                              icon: Icons.person_outline,
                              onTap: () {
                                Get.to(() => UserScreen());
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }

  _bottomSheet(context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return Container(
            decoration: new BoxDecoration(
                color: Colors.white, //new Color.fromRGBO(255, 0, 0, 0.0),
                borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(30.0),
                    topRight: const Radius.circular(30.0))),
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              share(SocialMedia.whatsapp);
                            },
                            icon: Icon(
                              FontAwesomeIcons.whatsappSquare,
                              size: 35,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text("Whatsapp")
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              share(SocialMedia.instagram);
                            },
                            icon: Icon(
                              FontAwesomeIcons.instagramSquare,
                              size: 35,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text("Instagram")
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              share(SocialMedia.facebook);
                            },
                            icon: Icon(
                              FontAwesomeIcons.facebookSquare,
                              size: 35,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text("Facebook")
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              share(SocialMedia.twitter);
                            },
                            icon: Icon(
                              FontAwesomeIcons.twitterSquare,
                              size: 35,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text("Twitter")
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () async {
                              await Share.share($text);
                            },
                            icon: Icon(
                              Icons.more_outlined,
                              size: 30,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text("More")
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            Clipboard.setData(new ClipboardData(text: $text))
                                .then((_) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      behavior: SnackBarBehavior.floating,
                                      margin: EdgeInsets.only(bottom: 200.0),
                                      content:
                                          Text('Copied to your clipboard !')));
                            });
                          },
                          icon: Icon(
                            Icons.copy_rounded,
                            size: 35,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "Copy Text",
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add_box,
                            size: 35,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "Add to Collection",
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            _takeScreenShot(1);
                          },
                          icon: Icon(
                            Icons.image,
                            size: 35,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "Save Image",
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () async {
                            _takeScreenShot(2);
                          },
                          icon: Icon(
                            Icons.wallpaper_rounded,
                            size: 35,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "Save as Wallpaper",
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  Future share(SocialMedia socialPlatform) async {
    final text = $text;
    final urlShare = Uri.encodeComponent('https://www.youtube.com');

    final urls = {
      SocialMedia.whatsapp: 'https://api.whatsapp.com/send?text=$text$urlShare',
      SocialMedia.instagram:
          'https://www.instagram.com/sharer.php?text=$text&url=$urlShare',
      SocialMedia.facebook:
          'https://www.facebook.com/sharer/sharer.php?u=$urlShare&t=$text',
      SocialMedia.twitter:
          'https://www.twitter.com/intent/tweet?url=$urlShare&text=$text',
    };

    final url = urls[socialPlatform]!;

    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  saveImage(Uint8List bytes, int task) async {
    await [Permission.storage].request();

    // result['filePath'].toString().contains("file://")
    //     ? result['filePath'].toString().replaceAll(RegExp('file://'), '')
    //     : result['filePath'].toString().replaceAll(RegExp('content://'), '');

    if (task == 2) {
      final directory = await getApplicationDocumentsDirectory();
      final imagePath = await File('${directory.path}/image.png').create();
      await imagePath.writeAsBytes(bytes);

      int location = WallpaperManagerFlutter.BOTH_SCREENS; //Choose screen type

      WallpaperManagerFlutter().setwallpaperfromFile(
          imagePath, location); // Wrap with try catch for error management.

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(bottom: 200.0),
          content: Text('Wallpaper Saved Successfully')));

      Navigator.pop(context);
    } else {
      final result = await ImageGallerySaver.saveImage(bytes,
          name: 'Motivation' + new Random().nextInt(100000).toString());

      final path = result['filePath'];

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(bottom: 200.0),
          content: Text('Image Saved Successfully')));

      Navigator.pop(context);

      return path;
    }
  }

  void _takeScreenShot(int task) async {
    final img = await screenshotController.captureFromWidget(Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color(0xE4E5EA),
          image: DecorationImage(
            image: NetworkImage(quotesController.backImage.value),
            fit: BoxFit.none,
          ),
        ),
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Obx(
            () {
              if (quotesController.quotes.isEmpty) {
                return Center(
                  child: Text(
                    $text = "No Quotes in this Category",
                    style: TextStyle(
                      fontFamily: 'Cinzel',
                      color: Colors.white,
                    ),
                  ),
                );
              }
              return PageView.builder(
                  itemCount: quotesController.quotes.length,
                  scrollDirection: Axis.vertical,
                  controller: quotesController.pageControll,
                  physics: BouncingScrollPhysics(),
                  onPageChanged: quotesController.selectedPagexNumber,
                  itemBuilder: (context, index) {
                    quotesController.currentQuoteId.value =
                        quotesController.quotes[index].id!;
                    quotesController.currentquotesLike.value =
                        quotesController.quotes[index].likes!;
                    return QuoteWidget(
                      quotesController: quotesController,
                      index: index,
                      quotes: Quotes(
                          author: quotesController.quotes[index].author == ''
                              ? ''
                              : quotesController.quotes[index].author,
                          quote: quotesController.quotes[index].quote),
                    );
                  });
            },
          ),
        ])));

    await saveImage(img, task);
  }
}

enum SocialMedia {
  whatsapp,
  instagram,
  facebook,
  twitter,
}
