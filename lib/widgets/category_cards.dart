import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:motivation_quotes/controllers/category_controller.dart';
import 'package:motivation_quotes/screens/quotes_screen.dart';
import 'package:motivation_quotes/widgets/theme.dart';
import 'package:random_color/random_color.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RandomColor randomColor = RandomColor();
    return Container(
      margin: EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Text(
              "Most Popular",
              style: subTitleTextStle,
            ),
          ),
          Expanded(
            child: GetX<CategoryController>(
                init: Get.put<CategoryController>(CategoryController()),
                builder: (CategoryController categoryController) {
                  return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        // crossAxisSpacing: 15,
                        // mainAxisSpacing: 5,
                        // childAspectRatio: 5 / 2,
                        mainAxisExtent: 110,
                      ),
                      scrollDirection: Axis.vertical,
                      itemCount: categoryController.categories.length,
                      itemBuilder: (BuildContext context, int index) {
                        final _catModel = categoryController.categories[index];
                        return Container(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                            child: Card(
                              color: Colors.grey,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              elevation: 0,
                              child: InkWell(
                                  onTap: () {
                                    Get.to(QuotesScreen(
                                      catId: _catModel.catId,
                                      catName: _catModel.catName,
                                    ));
                                  },
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          AutoSizeText(
                                            '${_catModel.catName}',
                                            style: subTitleTextStle,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Container(),
                                              ),
                                              Image.asset(
                                                "assets/sadness.png",
                                                width: 50,
                                                height: 30,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                        );
                      });
                }),
          ),
        ],
      ),
    );
  }
}
