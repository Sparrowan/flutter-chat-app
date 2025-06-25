import 'package:flutter/material.dart';
import 'package:flutter_chat_app/components/my_drawer.dart';
import 'package:flutter_chat_app/components/user_tile.dart';
import 'package:flutter_chat_app/pages/chat_page.dart';
import 'package:flutter_chat_app/services/auth/auth_service.dart';
import 'package:flutter_chat_app/services/chat/chat_service.dart';

class HomePage extends StatelessWidget {
  final AuthService _authService = AuthService();
  final ChatService _chatService = ChatService();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      drawer: MyDrawer(),
      body: _builUserList(),
    );
  }

  //  build list of users except for the current logged in user

  Widget _builUserList() {
    return StreamBuilder(
      stream: _chatService.getUsersStream(),
      builder: (context, snapshot) {
        // error
        if (snapshot.hasError) {
          return const Text("Error");
        }
        // loading

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        //  return list view
        return ListView(
          children: snapshot.data!
              .map<Widget>((userData) => _buildUserListItem(userData, context))
              .toList(),
        );
      },
    );
  }

  Widget _buildUserListItem(
    Map<String, dynamic> userData,
    BuildContext context,
  ) {
    return UserTile(
      text: userData["email"],
      onTap: () {
        //  tapped on a user go to chat page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatPage(receiverEmail: userData["email"]),
          ),
        );
      },
    );
  }
}
