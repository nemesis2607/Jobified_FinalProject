import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobified/models/job.dart';
import 'package:jobified/pages/JobDetailScreen.dart';
import 'package:jobified/pages/success.dart';

class JobPostings extends StatelessWidget {
  // Remove the const keyword from the constructor
  JobPostings({Key? key}) : super(key: key);

  final List<Job> jobList = [
    Job(
      title: 'Software Engineer',
      companyName: 'ABC Technologies',
      location: 'New York, USA',
      description: 'We are looking for a skilled Software Engineer...',
      type: 'Full-time',
    ),
    Job(
      title: 'UX Designer',
      companyName: 'XYZ Designs',
      location: 'San Francisco, USA',
      description: 'We are seeking a talented UX Designer to join our team...',
      type: 'Part-time',
    ),
    Job(
      title: 'Supply Chain',
      companyName: 'XYZ Designs',
      location: 'San Francisco, USA',
      description: 'We are seeking a talented Supply Chain to join our team...',
      type: 'Full-time',
    ),
    Job(
      title: 'Front-End Designer',
      companyName: 'XYZ Designs',
      location: 'San Francisco, USA',
      description: 'We are seeking a talented Front-End Designer to join our team...',
      type: 'Part-time',
    ),
    Job(
      title: 'Full Stack Developer',
      companyName: 'XYZ Designs',
      location: 'San Francisco, USA',
      description: 'We are seeking a talented Full Stack Developer to join our team...',
      type: 'Full-time',
    ),
    // Add more job objects as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Postings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: jobList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    side: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  color: Colors.white,
                  child: ListTile(
                    title: Text(jobList[index].title),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(jobList[index].companyName),
                        Text(jobList[index].location),
                        Text(jobList[index].description),
                        Text(jobList[index].type),
                        SizedBox(height: 8), 
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push( // Navigate to CreatePage when FAB is pressed
                                context,
                                MaterialPageRoute(builder: (context) => SuccessScreen()),
                              );
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue), // Set the background color to blue
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0), // Set the border radius to 4
                                ),
                              ),
                            ),
                            child: Text('Apply Now', style: TextStyle(color: Colors.white),),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder: (context) => JobDetailScreen(job: jobList[index]),
                          ),
                      );
                      // You can define what happens when a job item is tapped
                    },
                  ),
                ),
                SizedBox(height: 16), // Add some space between the cards
              ],
            );
          },
        ),
      ),


    );
  }
}
