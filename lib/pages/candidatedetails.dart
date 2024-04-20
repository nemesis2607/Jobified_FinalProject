import 'package:flutter/material.dart';
import 'package:jobified/models/candidate.dart';

class CandidateDetail extends StatefulWidget {
  final Candidate candidate;

  const CandidateDetail({Key? key, required this.candidate}) : super(key: key);

  @override
  _CandidateDetailState createState() => _CandidateDetailState();
}

class _CandidateDetailState extends State<CandidateDetail> {
  bool isConnected = false;

  @override
  Widget build(BuildContext context) {
    Color buttonColor = isConnected ? Colors.red : Colors.blue;
    String buttonText = isConnected ? 'Remove Connection' : 'Connect';

    return Scaffold(
      appBar: AppBar(
        title: Text('Candidate Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200, // Adjust the height of the image container
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  widget.candidate.image,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              widget.candidate.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              widget.candidate.position,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Experience: ${widget.candidate.experience}',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 16),
            Text(
              widget.candidate.desc,
              style: TextStyle(
                fontSize: 16,
              ),
            ),

            SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
                ),
                onPressed: () {
                  setState(() {
                    isConnected = !isConnected;
                  });
                },
                child: Text(
                  buttonText,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}