import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/teacher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: const Text(
          'Amar Teacher',
          style: TextStyle(
            fontFamily: 'Schyler',
            fontSize: 90,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),
          const SizedBox(width: 8.0),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(64.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: TextFormField(
                controller: _searchController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                  hintText: 'Search for Teachers',
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: TeacherCategories(searchQuery: _searchController.text),
      ),
    );
  }
}

class TeacherCategories extends StatefulWidget {
  final String searchQuery;

  const TeacherCategories({Key? key, required this.searchQuery}) : super(key: key);

  @override
  State<TeacherCategories> createState() => _TeacherCategoriesState();
}

class _TeacherCategoriesState extends State<TeacherCategories> {
  final List<String> _allTeachers = ['Math', 'Biology', 'Chemistry', 'English', 'ICT'];
  List<String> _filteredTeachers = [];

  @override
  void initState() {
    super.initState();
    _filterTeachers();
  }

  @override
  void didUpdateWidget(covariant TeacherCategories oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.searchQuery != widget.searchQuery) {
      _filterTeachers();
    }
  }

  void _filterTeachers() {
    setState(() {
      if (widget.searchQuery.isEmpty) {
        _filteredTeachers = _allTeachers;
      } else {
        _filteredTeachers = _allTeachers
            .where((teacher) =>
                teacher.toLowerCase().contains(widget.searchQuery.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Teacher Categories',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: _filteredTeachers.map((teacher) {
            return CategoryChip(
              category: teacher,
              icon: _getIconForCategory(teacher),
              onPressed: () {
                _navigateToCategoryPage(context, teacher);
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  IconData _getIconForCategory(String category) {
    switch (category) {
      case 'Math':
        return Icons.calculate;
      case 'Biology':
        return Icons.medical_information_outlined;
      case 'Chemistry':
        return Icons.science_outlined;
      case 'English':
        return Icons.language;
      case 'ICT':
        return Icons.computer_outlined;
      default:
        return Icons.help_outline;
    }
  }

  void _navigateToCategoryPage(BuildContext context, String category) {
    switch (category) {
      case 'Math':
        Navigator.push(context, MaterialPageRoute(builder: (context) => MathTeachersPage()));
        break;
      case 'Biology':
        Navigator.push(context, MaterialPageRoute(builder: (context) => BioTeachersPage()));
        break;
      case 'Chemistry':
        Navigator.push(context, MaterialPageRoute(builder: (context) => ChemistryTeachersPage()));
        break;
      case 'English':
        Navigator.push(context, MaterialPageRoute(builder: (context) => EnglishTeachersPage()));
        break;
      case 'ICT':
       Navigator.push(context, MaterialPageRoute(builder: (context) => ICTTeachersPage()));
        break;
      default:
        break;
    }
  }
}

class CategoryChip extends StatelessWidget {
  final String category;
  final IconData? icon;
  final VoidCallback? onPressed;

  const CategoryChip({
    Key? key,
    required this.category,
    this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      avatar: icon != null ? Icon(icon) : null,
      label: Text(category),
      onPressed: onPressed,
      backgroundColor: const Color.fromARGB(235, 255, 179, 0),
    );
  }
}
