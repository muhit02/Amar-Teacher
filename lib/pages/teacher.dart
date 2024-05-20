import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/profile_pages/bioprofilepage.dart';
import 'package:flutter_application_1/pages/profile_pages/chemistryprofilepage.dart';
import 'package:flutter_application_1/pages/profile_pages/englishprofilepage.dart';
import 'package:flutter_application_1/pages/profile_pages/ictprofilepage.dart';
import 'package:flutter_application_1/pages/profile_pages/mathprofilepage.dart';

class Teacher {
  final String name;
  final String email;
  final String phone;
  final String location;
  final String education;
  final String summary;
  final String skills;
  final String experiences;
  final String imagePath;

  Teacher({
    required this.name,
    required this.email,
    required this.phone,
    required this.location,
    required this.education,
    required this.summary,
    required this.skills,
    required this.experiences,
    required this.imagePath,
  });
}

Widget buildTeacherCard(BuildContext context, Teacher teacher, Function onTap) {
  return Card(
    elevation: 2.0,
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    child: ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      leading: CircleAvatar(backgroundImage: AssetImage(teacher.imagePath)),
      title: Text(teacher.name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(teacher.summary),
          const SizedBox(height: 10),
          Text('Skills: ${teacher.skills}'),
          const SizedBox(height: 5),
          Text('Experience: ${teacher.experiences}'),
          const ButtonBar(
            alignment: MainAxisAlignment.end,
            children: <Widget>[
            ],
          ),
        ],
      ),
      onTap: () => onTap(),
    ),
  );
}

class TeachersPage extends StatelessWidget {
  final String title;
  final List<Teacher> teachers;
  final Widget profilePage;

  TeachersPage({
    required this.title,
    required this.teachers,
    required this.profilePage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
      body: ListView.builder(
        itemCount: teachers.length,
        itemBuilder: (context, index) {
          return buildTeacherCard(
            context,
            teachers[index],
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => profilePage),
              );
            },
          );
        },
      ),
    );
  }
}

class MathTeachersPage extends StatelessWidget {
  final List<Teacher> teachers = [
    Teacher(
      name: "Devid",
      email: "devid@gmail.com",
      phone: "017xxxxxxxx",
      location: "Gosh Para Mor, Laxmipur, Rajshahi",
      education: "Bachelor of Science in Mathematics Education from University of Rajshahi",
      summary: "Math Teacher with 7+ years of experience in teaching",
      skills: "Mathematics, Teaching, Curriculum, Classroom Management, Technology, Communication",
      experiences: "Recent: Math Teacher at ABC College",
      imagePath: 'lib/assets/images/devid.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return TeachersPage(
      title: "Math Teachers",
      teachers: teachers,
      profilePage: MathProfilePage1(),
    );
  }

  
}

class BioTeachersPage extends StatelessWidget {
  final List<Teacher> teachers = [
    Teacher(
      name: "Fahad",
      email: "fahad@gmail.com",
      phone: "017xxxxxxxx",
      location: "Kadirgonj, Rajshahi",
      education: "MBBS from Dhaka Medical College",
      summary: "MBBS from Dhaka Medical College",
      skills: "Teaching, Curriculum, Classroom Management, Technology, Communication",
      experiences: "Recent: Biology Teacher at ABC College",
      imagePath: 'lib/assets/images/fahad.jpeg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return TeachersPage(
      title: "Biology Teachers",
      teachers: teachers,
      profilePage: BioProfilePage1(),
    );
  }
}

class EnglishTeachersPage extends StatelessWidget {
  final List<Teacher> teachers = [
    Teacher(
      name: "Mr. English",
      email: "english@gmail.com",
      phone: "017xxxxxxxx",
      location: "Kadirgonj, Rajshahi",
      education: "BA in Philosophy University of Rajshahi",
      summary: "MA in English University of Rajshahi",
      skills: "Teaching, Curriculum, Classroom Management, Technology, Communication",
      experiences: "Recent: English Teacher at ABC College",
      imagePath: 'lib/assets/images/english.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return TeachersPage(
      title: "English Teachers",
      teachers: teachers,
      profilePage: EnglishProfilePage1(),
    );
  }
}

class ICTTeachersPage extends StatelessWidget {
  final List<Teacher> teachers = [
    Teacher(
      name: "Mr. ICT",
      email: "ict@gmail.com",
      phone: "017xxxxxxxx",
      location: "Kadirgonj, Rajshahi",
      education: "BSC in Computer Science University of Rajshahi",
      summary: "BSC in Computer Science University of Rajshahi",
      skills: "Teaching, Curriculum, Classroom Management, Technology, Communication",
      experiences: "Recent: ICT Teacher at ABC College",
      imagePath: 'lib/assets/images/ict.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return TeachersPage(
      title: "ICT Teachers",
      teachers: teachers,
      profilePage: ICTProfilePage1(),
    );
  }
}

class ChemistryTeachersPage extends StatelessWidget {
  final List<Teacher> teachers = [
    Teacher(
      name: "Mr. Chemistry",
      email: "chemistry@gmail.com",
      phone: "017xxxxxxxx",
      location: "Kadirgonj, Rajshahi",
      education: "Masters Degrees in Chemistry University of Rajshahi",
      summary: "Masters Degrees in Chemistry University of Rajshahi",
      skills: "Teaching, Curriculum, Classroom Management, Technology, Communication",
      experiences: "Recent: ICT Teacher at ABC College",
      imagePath: 'lib/assets/images/chemistry.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return TeachersPage(
      title: "Chemistry Teachers",
      teachers: teachers,
      profilePage: ChemistryProfilePage1(),
    );
  }
}



