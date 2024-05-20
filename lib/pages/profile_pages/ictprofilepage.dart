import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ICTProfilePage1 extends StatelessWidget {
  const ICTProfilePage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {
              
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('lib/assets/images/ict.jpg'),
            ),
            const SizedBox(height: 10),
            const Text(
              'Mr. ICT',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'ICT Teacher',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.email),
                  onPressed: () {
                    _showBottomSheet(context, 'Email', 'ict@gmail.com');
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.phone),
                  onPressed: () {
                    _showBottomSheet(context, 'Phone', '017xxxxxxxx');
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.message),
                  onPressed: () {
                    _showBottomSheet(context, 'Message', '017xxxxxxxx');
                  },
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('About', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text('BSC in Computer Science University of Rajshahi.', style: TextStyle(fontSize: 16)),
                  SizedBox(height: 20),
                  Text('Address', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text('Gosh Para Mor, Laxmipur, Rajshahi', style: TextStyle(fontSize: 16)),
                  SizedBox(height: 20),
                  Text('Daily Activity', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text('Saturday - Thursday\nOpen till 7 PM', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 251, 194, 5), 
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SchedulePage()),
                    );
                  },
                  child: const Text('List Of Schedule'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 251, 194, 5), 
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const TeacherPostPage()),
                    );
                  },
                  child: const Text("Teacher's Daily Post"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context, String title, String content) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(content, style: const TextStyle(fontSize: 16)),
                  IconButton(
                    icon: const Icon(Icons.copy),
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: content));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('$title copied to clipboard')),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Class Schedule',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: DataTable(
          columns: const <DataColumn>[
            DataColumn(
              label: Text(
                'Day',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'Time',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'Batch',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ],
          rows: const <DataRow>[
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Monday')),
                DataCell(Text('9:00 AM - 10:30 AM')),
                DataCell(Text('A')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Monday')),
                DataCell(Text('10:45 AM - 12:15 PM')),
                DataCell(Text('B')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Tuesday')),
                DataCell(Text('9:00 AM - 10:30 AM')),
                DataCell(Text('C')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Tuesday')),
                DataCell(Text('10:45 AM - 12:15 PM')),
                DataCell(Text('D')),
              ],
            ),
            // Add more DataRow widgets here for other days and subjects
          ],
        ),
      ),
    );
  }
}

class TeacherPostPage extends StatelessWidget {
  const TeacherPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Teacher\'s Daily Post',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Teacher\'s Daily Post',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Today\'s post content goes here...',
              style: TextStyle(fontSize: 16),
            ),
            
          ],
        ),
      ),
    );
  }
}
