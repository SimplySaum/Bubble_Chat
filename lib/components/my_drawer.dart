import 'package:flutter/material.dart';
import 'package:secondtry/pages/Settings_page.dart';

import '../services/auth/auth_service.dart';

class MyDrawer extends StatelessWidget {
  void logout(){
    // get auth service
    final auth = AuthService();
    auth.signOut();
  }
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //logo
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 120, bottom: 80),
                child: Container(child: Builder(builder: (context) {
                  return Icon(
                    Icons.message,
                    color: Theme.of(context).colorScheme.primary,
                    size: 50,
                  );
                })),
              ),


              //home list tile
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  title: Text("H O M E"),
                  leading: Icon(Icons.home, color: Theme.of(context).colorScheme.primary,),
                  onTap: (){
                    //POP the drawer
                    Navigator.pop(context);
                  },
                ),
              ),

              //settings list tile
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  title: Text("S E T T I N G S"),
                  leading: Icon(Icons.settings, color: Theme.of(context).colorScheme.primary,),
                  onTap: (){
                    //navigate to settings page
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SettingsPage()));
                  },
                ),
              ),
            ],
          ),

          //logout tile
          Padding(
            padding: const EdgeInsets.only(left: 25, bottom: 25),
            child: ListTile(
              title: Text("L O G O U T"),
              leading: Icon(Icons.logout,  color: Theme.of(context).colorScheme.primary,),
              onTap: (){
                logout();
              },
            ),
          ),
        ],
      ),
    );
  }
}
