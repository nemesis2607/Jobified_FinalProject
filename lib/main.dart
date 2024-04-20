import 'package:flutter/material.dart';
import 'package:jobified/models/feed.dart';
import 'package:jobified/pages/createpost.dart';
import 'package:jobified/pages/jobpostings.dart';
import 'package:jobified/pages/candidatepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white60),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Jobified'),
    );
  }
}


List<Feed> feeds = [
  Feed(
    username:"Smit Shah",
    userPhoto: "assets/smitshah.jpg",
    description: "A am happy to announce that I got a postion as a developer at Google."
  ),
  Feed(
      username:"Ayush Patel",
      userPhoto: "assets/ayush.jpg",
      description: "A am happy to announce that I got a postion as a developer at Google."
  ),
  Feed(
      username:"Jigyasa Chabra",
      userPhoto: "assets/anna.jpg",
      description: "A am open to work for the position of Graphic Designer do let me know if you guys are hiring."
  ),
  Feed(
      username:"Harsh Mehta",
      userPhoto: "assets/harry.jpg",
      description: "A am open to work for the position of Project Manager do let me know if you guys are hiring."
  ),
  Feed(
      username:"Heli Mehta",
      userPhoto: "assets/anna.jpg",
      description: "A am open to work for the position of Business Analyst do let me know if you guys are hiring."
  ),
  Feed(
      username:"Kishan Patel",
      userPhoto: "assets/ayush.jpg",
      description: "A am open to work for the position of Graphic Designer do let me know if you guys are hiring."
  ),
];

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 240, // Set the desired height for the image
              width: double.infinity, // Make the image take the full width
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/logobg.jpg'), // Replace 'path/to/your/image.jpg' with the actual path to your image asset
                  fit: BoxFit.cover, // Adjust how the image fits the container
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.people), // Icon for the first item
                    title: Text('Candidates'),
                    onTap: () {
                      Navigator.push( // Navigate to CreatePage when FAB is pressed
                        context,
                        MaterialPageRoute(builder: (context) => CandidatePage()),
                      );
                    },
                  ),


                  ListTile(
                    leading: Icon(Icons.work), // Icon for the second item
                    title: Text('Job Postings'),
                    onTap: () {
                      Navigator.push( // Navigate to CreatePage when FAB is pressed
                        context,
                        MaterialPageRoute(builder: (context) => JobPostings()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Feeds',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: feeds.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0), // Adjust the border radius here
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(feeds[index].userPhoto),
                                radius: 20,
                              ),
                              SizedBox(width: 8.0),
                              Text(
                                feeds[index].username,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.0),
                          Text(feeds[index].description),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),



      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push( // Navigate to CreatePage when FAB is pressed
            context,
            MaterialPageRoute(builder: (context) => CreatePage()),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
