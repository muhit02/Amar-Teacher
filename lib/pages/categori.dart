import 'package:flutter/material.dart';

class AllDoctorsPage extends StatelessWidget {
  final List<Doctor> doctors = [
    Doctor(
        name: "Dr. Pawan",
        bio: "Lorem ipsum dolor, consectetur adipiscing elit. Nunc v libero et velit interdum, ac mattis.",
        imageUrl: "assets/dr_pawan.png",
        rating: 5.0),
    Doctor(
        name: "Dr. Wanitha",
        bio: "Lorem ipsum dolor, consectetur adipiscing elit. Nunc v libero et velit interdum, ac mattis.",
        imageUrl: "assets/dr_wanitha.png",
        rating: 5.0),
    Doctor(
        name: "Dr. Udara",
        bio: "Lorem ipsum dolor, consectetur adipiscing elit. Nunc v libero et velit interdum, ac mattis.",
        imageUrl: "assets/dr_udara.png",
        rating: 5.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Doctors'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search a Doctor',
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: doctors.length,
              itemBuilder: (context, index) {
                return DoctorCard(doctor: doctors[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  final Doctor doctor;

  DoctorCard({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(doctor.imageUrl),
        title: Text(doctor.name),
        subtitle: Text(doctor.bio),
        trailing: IconButton(
          icon: Icon(Icons.star),
          color: Colors.yellow,
          onPressed: () {}, // This should be linked to the rating system or favorites
        ),
        onTap: () {
          // This could navigate to the doctor's details or booking page
        },
      ),
    );
  }
}

class Doctor {
  String name;
  String bio;
  String imageUrl;
  double rating;

  Doctor({required this.name, required this.bio, required this.imageUrl, required this.rating});
}
