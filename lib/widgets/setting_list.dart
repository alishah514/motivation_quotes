import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motivation_quotes/widgets/theme.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile(
      {Key? key,
      required this.onTap,
      required this.iconData,
      required this.title})
      : super(key: key);

  final IconData iconData;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      minLeadingWidth: 2,
      leading: Icon(
        iconData,
        size: 20,
        color: iconClr,
      ),
      title: Text(title,
          style: GoogleFonts.raleway(
            fontSize: 16,
          )),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: iconClr,
        size: 20,
      ),
    );
  }
}
