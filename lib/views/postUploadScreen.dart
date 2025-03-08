import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus_app/utilities/appColors.dart';
import 'package:graduate_plus_app/utilities/commonButton.dart';
import 'package:graduate_plus_app/utilities/textStyles.dart';

class PostUploadScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Upload Post",
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Title", style: textStyleBold(blackColor)),
                    ),
                    const SizedBox(height: 8),
                    // Post Title
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Post Title',
                        prefixIcon: Icon(Icons.title),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Description",
                        style: textStyleBold(blackColor),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      maxLines: 5,
                      decoration: InputDecoration(
                        labelText: 'Post Description',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),

                    // Upload Post Images
                    Text(
                      'Upload Post Images',
                      style: textStyleBold(blackColor),
                    ),
                    SizedBox(height: 8.0),
                    Container(
                      padding: EdgeInsets.all(8),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Tap on boxes to upload image',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                          SizedBox(height: 12.0),
                          Wrap(
                            spacing: 8.0,
                            runSpacing: 8.0,
                            children: List.generate(1, (index) {
                              return Container(
                                width: 70.0,
                                height: 70.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: Colors.grey.shade200,
                                ),
                                child: Center(
                                  child: Icon(Icons.image, color: Colors.grey),
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.0),

                    // Upload Post Related Files
                    Text(
                      'Upload Post Related Files',
                      style: textStyleBold(blackColor),
                    ),
                    SizedBox(height: 8.0),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Tap on boxes to upload files (PDF, Word, etc.)',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                          SizedBox(height: 12.0),
                          Wrap(
                            spacing: 8.0,
                            runSpacing: 8.0,
                            children: List.generate(1, (index) {
                              return Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: Colors.grey.shade200,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.file_present,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(width: 8.0),
                                    Text(
                                      'File',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 32.0),
                  ],
                ),
              ),
            ),
            // Add Post Button
            commonButton(context: context, label: "Add Post"),
          ],
        ),
      ),
    );
  }
}
