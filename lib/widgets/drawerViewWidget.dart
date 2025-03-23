import 'package:flutter/material.dart';
import 'package:graduate_plus_app/utilities/appColors.dart';
import 'package:graduate_plus_app/views/academicSuccessScreen.dart';
import 'package:graduate_plus_app/views/beyondGraduatePlusScreen.dart';
import 'package:graduate_plus_app/views/embeddedCoursesScreen.dart';
import 'package:graduate_plus_app/views/employabilityFrameworkScreen.dart';
import 'package:graduate_plus_app/views/eventsScreen.dart';
import 'package:graduate_plus_app/views/gradcrackerJobs/personalInfoScreen.dart';
import 'package:graduate_plus_app/views/graduateWeekEventsScreen.dart';
import 'package:graduate_plus_app/views/graduateWeekVideosScreen.dart';
import 'package:graduate_plus_app/views/jiscDiscoveryToolScreen.dart';
import 'package:graduate_plus_app/views/messagesScreen.dart';
import 'package:graduate_plus_app/views/myContentScreen.dart';
import 'package:graduate_plus_app/views/postUploadScreen.dart';
import 'package:graduate_plus_app/views/profileScreen.dart';

// List of Drawer Items
final List<DrawerItem> mainDrawerItems = [
  DrawerItem(title: "My Content", icon: Icons.folder),
  DrawerItem(title: "Events", icon: Icons.event),
  DrawerItem(title: "New Posts", icon: Icons.post_add),
  DrawerItem(title: "Messages", icon: Icons.message),
  DrawerItem(title: "Jobs", icon: Icons.join_full_sharp),
  DrawerItem(title: "My Account", icon: Icons.account_circle),
  DrawerItem(title: "Sign Out", icon: Icons.logout),
];

// List of Subitems for "Birmingham City University"
final List<String> birminghamSubItems = [
  "Jisc discovery tool",
  "Embedded Courses",
  "Graduate+ Week Events",
  "Graduate+ Week Videos",
  "Centre for Academic Success",
  "Employability Framework",
  "BeyondGraduatePlus",
];

Widget DrawerViewWidget(BuildContext context) {
  return Drawer(
    backgroundColor: whiteColor,
    shape: Border.all(style: BorderStyle.none),
    child: Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.77,
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              // Header Section
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/bcuLogo.png', height: 60),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        // Avatar
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: const AssetImage(
                            'assets/images/profileImage.png',
                          ), // Replace with your avatar asset
                          backgroundColor: Colors.grey[200],
                        ),
                        const SizedBox(width: 12),
                        // Name and Email
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Mr. Ismail Kilani',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: appThemeColor,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'ismail.kilani@gmail.com',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Dropdown Section
              ExpansionTile(
                shape: Border.all(style: BorderStyle.none),
                leading: Icon(Icons.school),
                title: Text(
                  "Birmingham City University",
                  style: TextStyle(fontSize: 16.0),
                ),
                children: [
                  ...birminghamSubItems.map(
                    (subItem) => ListTile(
                      title: Text(subItem, style: TextStyle(fontSize: 14.0)),
                      onTap: () {
                        Navigator.of(context).pop(); // Close the drawer

                        // Handle navigation based on the selected subitem
                        switch (subItem) {
                          case "Jisc discovery tool":
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => JiscDiscoveryToolScreenView(),
                              ),
                            );
                            break;
                          case "Embedded Courses":
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => EmbeddedCoursesScreenView(),
                              ),
                            );
                            break;
                          case "Graduate+ Week Events":
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => GraduateWeekEventsScreenView(),
                              ),
                            );
                            break;
                          case "Graduate+ Week Videos":
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => GraduateWeekVideosScreenView(),
                              ),
                            );
                            break;
                          case "Centre for Academic Success":
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => AcademicSuccessScreenView(),
                              ),
                            );
                            break;
                          case "Employability Framework":
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) =>
                                        EmployabilityFrameworkScreenView(),
                              ),
                            );
                            break;
                          case "BeyondGraduatePlus":
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => BeyondGraduatePlusScreenView(),
                              ),
                            );
                            break;
                        }
                      },
                    ),
                  ),
                ],
              ),

              // Main Drawer Items
              ...mainDrawerItems.map((item) {
                if (item.title == "My Account") {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 16),
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: Divider(),
                      ),
                      ListTile(
                        leading: Icon(item.icon, color: Colors.black),
                        title: Text(
                          item.title,
                          style: TextStyle(fontSize: 16.0),
                        ),
                        onTap: () {
                          // Close the drawer and navigate
                          Navigator.of(context).pop(); // Close the drawer
                          // Navigate to "My Account" screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileScreenView(),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                }
                return ListTile(
                  leading: Icon(item.icon, color: Colors.black),
                  title: Text(item.title, style: TextStyle(fontSize: 16.0)),
                  onTap: () {
                    // Close the drawer and navigate
                    Navigator.of(context).pop(); // Close the drawer
                    if (item.title == "My Content") {
                      // Navigate to My Content screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyContentScreenView(),
                        ),
                      );
                    } else if (item.title == "Events") {
                      // Navigate to Events screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EventsScreenView(),
                        ),
                      );
                    } else if (item.title == "New Posts") {
                      // Navigate to New Posts screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PostUploadScreenView(),
                        ),
                      );
                    } else if (item.title == "Messages") {
                      // Navigate to Messages screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MessagesScreenView(),
                        ),
                      );
                    } else if (item.title == "Jobs") {
                      // Navigate to Messages screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PersonalInfoScreenView(),
                        ),
                      );
                    }
                  },
                );
              }).toList(),
            ],
          ),
        ),

        // Close Drawer Gesture
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop(); // Close the drawer
            },
            child: Container(color: Colors.black.withOpacity(0.5)),
          ),
        ),
      ],
    ),
  );
}

// Drawer Item Class
class DrawerItem {
  final String title;
  final IconData icon;

  DrawerItem({required this.title, required this.icon});
}
