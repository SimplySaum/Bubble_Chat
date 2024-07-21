import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../themes/theme_provider.dart';

class UserTile extends StatelessWidget {
  final String text;
  void Function()? onTap;
  UserTile({super.key,required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        Provider.of<ThemeProvider>(context, listen: false).isDarkMode;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color:(isDarkMode ? Colors.green : Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12)
        ),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            //icon
            Icon(Icons.radio_button_unchecked, color: (isDarkMode ? Colors.green.shade600 : Colors.grey.shade800),),

            const SizedBox(width: 20,),
            //username
            Text(text, style: TextStyle(
              fontSize: 15
            ),)
          ],
        ),
      ),
    );
  }
}
