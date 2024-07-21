import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secondtry/themes/theme_provider.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCureentUser;

  const ChatBubble(
      {super.key, required this.message, required this.isCureentUser});

  @override
  Widget build(BuildContext context) {
    //light mode vs dark mode for correct bubble colors
    bool isDarkMode =
        Provider.of<ThemeProvider>(context, listen: false).isDarkMode;

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isCureentUser
              ? (isDarkMode ? Colors.green.shade600 : Colors.green)
              : (isDarkMode ? Colors.grey.shade800 : Colors.grey.shade900)),
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 2.5),
      child: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
