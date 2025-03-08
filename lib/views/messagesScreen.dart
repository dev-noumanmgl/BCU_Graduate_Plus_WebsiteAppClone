import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus_app/utilities/appColors.dart';

class MessagesScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size =
        MediaQuery.of(context).size; // Get screen size for responsive design

    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipOval(
              child: Container(
                height: 44,
                width: 44,
                color: blackColor.withOpacity(.7),
                child: Center(
                  child: Icon(Icons.arrow_back_rounded, color: whiteColor),
                ),
              ),
            ),
          ),
          titleSpacing: 0,
          title: Text(
            "Messages",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Text(
            "No messages",
          ), // Placeholder text when no messages exist,
        ),
      ),
    );
  }
}
