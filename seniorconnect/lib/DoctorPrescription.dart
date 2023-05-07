import 'package:flutter/material.dart';

class DoctorPrescriptionPage extends StatelessWidget {
  final List<Map<String, String>> prescriptions = [
    {
      'medicineName': 'Metformin',
      'dosage': '1 pill',
      'instructions': 'Take one pill daily',
      'date': 'May 10, 2023',
    },
    {
      'medicineName': 'Atorvastatin',
      'dosage': '2 pills',
      'instructions': 'Take two pills after meals',
      'date': 'May 12, 2023',
    },
    {
      'medicineName': 'Warfarin',
      'dosage': '1 pill',
      'instructions': 'Take one pill before bedtime',
      'date': 'May 15, 2023',
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Prescription'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.67,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: prescriptions.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {

            },
            child: Card(
              elevation: 4.0,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Medicine Name: ${prescriptions[index]['medicineName']}',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Dosage: ${prescriptions[index]['dosage']}',
                      style: TextStyle(fontSize: 14.0),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Instructions: ${prescriptions[index]['instructions']}',
                      style: TextStyle(fontSize: 14.0),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Date: ${prescriptions[index]['date']}',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          backgroundColor: Colors.black12),
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
