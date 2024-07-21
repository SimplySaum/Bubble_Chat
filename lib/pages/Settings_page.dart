import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secondtry/themes/theme_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey.shade800,
        title: Text("Settings"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(25),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(color: Theme
            .of(context)
            .colorScheme
            .secondary, 
            borderRadius:BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //dark mode
            Text("Dark Mode"),
            //switch toggle
            CupertinoSwitch(
                value: Provider.of<ThemeProvider>(context, listen: false).isDarkMode,
                onChanged: (value) => Provider.of<ThemeProvider>(context, listen : false). toggleTheme()
            )

          ],
        ),
      ),
    );
  }
}
