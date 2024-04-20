import 'package:flutter/material.dart';
import 'package:jobified/models/candidate.dart';
import 'package:jobified/pages/candidatedetails.dart';

class CandidatePage extends StatelessWidget {
  // Dummy data for candidates
  final List<Candidate> candidates = [
    Candidate(
      name: "Harry Anderson",
      image: "assets/harry.jpg",
      position: "Software Engineer",
      experience: "5 years",
      desc:
          "Experienced software engineer with a strong background in mobile app development.",
    ),
    Candidate(
      name: "Anna Minna",
      image: "assets/anna.jpg",
      position: "UX/UI Designer",
      experience: "3 years",
      desc:
          "Creative and detail-oriented UX/UI designer with a passion for user-centered design.",
    ),
    Candidate(
      name: "Smit Shah",
      image: "assets/smitshah.jpg",
      position: "Graphic Designer",
      experience: "3 years",
      desc:
          "Creative and detail-oriented UX/UI designer with a passion for user-centered design.",
    ),
    Candidate(
      name: "Ayush Patel",
      image: "assets/ayush.jpg",
      position: "Mobile Game Developer",
      experience: "3 years",
      desc:
          "Creative and detail-oriented UX/UI designer with a passion for user-centered design.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Candidates'),
      ),
      body: ListView.builder(
        itemCount: candidates.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CandidateDetail(candidate: candidates[index]),
                  ),
                );
              },
              child: Card(
                elevation: 4,
                shadowColor: Colors.grey.withOpacity(0.1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        child: Image.asset(
                          candidates[index].image,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            candidates[index].name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            candidates[index].position,
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
