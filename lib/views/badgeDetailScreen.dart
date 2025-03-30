import 'dart:ui' as ui;
import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:graduate_plus_app/utilities/appColors.dart';

/// Badge Detail Screen: Displays a badge with share functionality.
class BadgeDetailScreenView extends StatefulWidget {
  @override
  _BadgeDetailScreenViewState createState() => _BadgeDetailScreenViewState();
}

class _BadgeDetailScreenViewState extends State<BadgeDetailScreenView> {
  final GlobalKey _globalKey = GlobalKey(); // Key for capturing the widget

  // Function to capture and share the card
  Future<void> _captureAndShare() async {
    try {
      RenderRepaintBoundary boundary =
          _globalKey.currentContext!.findRenderObject()
              as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(
        format: ui.ImageByteFormat.png,
      );
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      // Save image to a temporary directory
      final tempDir = await getTemporaryDirectory();
      final file = await File(
        '${tempDir.path}/badge.png',
      ).writeAsBytes(pngBytes);

      // Share the image
      await Share.shareXFiles([
        XFile(file.path),
      ], text: "Check out my achievement!");
    } catch (e) {
      print("Error sharing: $e");
    }
  }

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
            child: InkWell(
              onTap: () => Navigator.pop(context),
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
        ),
      ),
      extendBodyBehindAppBar: true,

      body: Stack(
        children: [
          // Background image
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/backgroundPic.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Centered Badge Card
          Center(
            child: RepaintBoundary(
              key: _globalKey, // Key for capturing image
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8.0,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Share Button
                    Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        onPressed:
                            _captureAndShare, // Capture and Share function
                        icon: Icon(Icons.share),
                      ),
                    ),

                    // University Logo
                    Image.asset('assets/images/bcuLogo.png', height: 60.0),
                    SizedBox(height: 16.0),

                    // User Name
                    Text(
                      'Ismail Kilani',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(height: 4.0),

                    // Date
                    Text(
                      'SEP 20, 2024',
                      style: TextStyle(fontSize: 14.0, color: Colors.grey),
                    ),
                    SizedBox(height: 16.0),

                    // Badge Image
                    Image.asset(
                      'assets/images/bcuBronzeAward.png',
                      height: 150.0,
                    ),
                    SizedBox(height: 16.0),

                    // Badge Title
                    Text(
                      'Bronze Award - BCU Graduate+',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(height: 8.0),

                    // Badge Description
                    Text(
                      'Graduate Plus Bronze Award for engaging in Extracurricular Activities',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14.0, color: Colors.black87),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
