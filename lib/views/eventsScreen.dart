import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus_app/utilities/appColors.dart';
import 'package:graduate_plus_app/views/eventsDetailScreen.dart';

// Event model class to store event details
class Event {
  final String title;
  final String date;
  final String location;
  final bool isOnline;

  Event({
    required this.title,
    required this.date,
    required this.location,
    required this.isOnline,
  });
}

class EventsScreenView extends StatelessWidget {
  // List of events displayed on the screen
  final List<Event> events = [
    Event(
      title: "Wellbeing Session",
      date: "SEP 20, 2024 21:00",
      location: "Curzon Building Room C423",
      isOnline: false,
    ),
    Event(
      title: "Wellbeing Session",
      date: "SEP 20, 2024 21:00",
      location: "Online",
      isOnline: true,
    ),
    Event(
      title: "Wellbeing Session",
      date: "SEP 20, 2024 21:00",
      location: "Curzon Building C423",
      isOnline: false,
    ),
    Event(
      title: "Wellbeing Session",
      date: "SEP 20, 2024 21:00",
      location: "Online",
      isOnline: true,
    ),
    Event(
      title: "Wellbeing Session",
      date: "SEP 20, 2024 21:00",
      location: "Curzon Building Room C423",
      isOnline: false,
    ),
  ];

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
        title: Image.asset('assets/images/bcuLogo.png', height: 60.0),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}), // Search icon
          IconButton(
            icon: Icon(Icons.filter_alt_rounded),
            onPressed: () {},
          ), // Filter icon
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.0),
            // Header Image
            Card(
              elevation: 4,
              margin: EdgeInsets.all(0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/bcuFreelancingCourse.png',
                  width: double.infinity,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10),
            // Section Title
            Text(
              'Upcomming',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16.0),
            // List of events displayed using ListView.builder
            Expanded(
              child: ListView.builder(
                itemCount: events.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EventsDetailScreenView(),
                        ),
                      );
                    },
                    child: EventCard(event: events[index]),
                  ); // Display event card
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final Event event;

  // Constructor: Accepts an Event object as input
  const EventCard({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 4.0, // Provides a shadow effect for better UI
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EventsDetailScreenView()),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Event Image Placeholder (Optional)
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              child: Image.asset(
                'assets/images/bcuFB.png', // Replace with an appropriate image
                width: 100.0,
                height: 100.0,
                fit: BoxFit.cover,
              ),
            ),

            // Event Details Section
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Event Title
                    Text(
                      event.title,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 8.0),

                    // Event Date
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month,
                          size: 16.0,
                          color: Colors.black54,
                        ),
                        SizedBox(width: 4.0),
                        Text(
                          event.date,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),

                    // Event Location (or Online status)
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 16.0,
                          color: Colors.black54,
                        ),
                        SizedBox(width: 4.0),

                        // Ensures text remains within available space
                        Expanded(
                          child: Text(
                            event.isOnline ? "Online" : event.location,
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black54,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.bookmark),
            ),
          ],
        ),
      ),
    );
  }
}
