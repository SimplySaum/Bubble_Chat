import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secondtry/components/user_tile.dart';
import 'package:secondtry/services/auth/auth_service.dart';
import 'package:secondtry/components/my_drawer.dart';
import 'package:secondtry/services/chat/chat_service.dart';

import '../themes/theme_provider.dart';
import 'chat_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  //PLAYGROUND

  //chat & auth service
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();





  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        Provider.of<ThemeProvider>(context, listen: false).isDarkMode;
    return Scaffold(
      backgroundColor: (isDarkMode ? Colors.black : Colors.grey.shade200),
      appBar: AppBar(
        backgroundColor: (isDarkMode ? Colors.grey.shade700 : Colors.green),
        foregroundColor: (isDarkMode ? Colors.white : Colors.white),
        title: Text("Home", style: TextStyle(
          fontWeight: FontWeight.w600
        ),),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0), // Adjust as needed
        ),

      ),

      drawer: const MyDrawer(),

      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: _buildUserList(),
      ),


    );
  }


  //BUILDERS

  // build a list of users except currently logged in user
  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUsersStream(),
      builder: (context, snapshot) {
        // ERRORS
        if (snapshot.hasError){
          return const Text("ERROR");
        }

        //LOADING
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Text("Loading..");
        }

        //return LIST VIEW
        return ListView(
          children: snapshot.data!.map<Widget>((userData) => _buildUserListItem(userData, context)).toList(),
        );

      },
    );
  }

  Widget _buildUserListItem(Map<String, dynamic> userData, BuildContext context) {
    // Get the current user's email and convert to lowercase
    final currentUserEmail = _authService.getCurrentUser()!.email!.toLowerCase();
    // Get the email from userData and convert to lowercase
    final userEmail = userData['email'].toLowerCase();

    // Display all users except the current user
    if (userEmail != currentUserEmail) {
      return UserTile(
        text: userData['email'],
        onTap: () {
          // Tapped on a user -> go to a chat
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                receiverEmail: userData["email"],
                receiverID: userData["uid"],
              ),
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }




}
