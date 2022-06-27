import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IconButtonText extends StatelessWidget {
  const IconButtonText(
      {Key? key,
      required this.width,
      required this.height,
      required this.icon,
      required this.catName,
      required this.onTap})
      : super(key: key);

  final double width;
  final double height;
  final IconData icon;
  final String catName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, color: Colors.white, size: 22),
                SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: AutoSizeText(
                    catName,
                    overflow: TextOverflow.visible,
                    maxLines: 1,
                    style: GoogleFonts.raleway(
                      color: Colors.white,
                      letterSpacing: 0.5,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IconBtn extends StatelessWidget {
  const IconBtn({
    Key? key,
    required this.width,
    required this.height,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final double width;
  final double height;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: 15.0, bottom: 15.0),
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Icon(
              icon,
              color: Colors.white,
              size: 22,
            ),
          ),
        ),
      ),
    );
  }
}
