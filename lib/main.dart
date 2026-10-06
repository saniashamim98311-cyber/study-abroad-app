import 'package:flutter/material.dart';

void main() {
  runApp(const StudyAbroadApp());
}

class University {
  final String name;
  final String country;
  final String course;
  final String fee;

  const University(this.name, this.country, this.course, this.fee);
}

const universities = [
  University('University of Toronto', 'Canada', 'MS Computer Science', 'CAD 60,000/yr'),
  University('University of Melbourne', 'Australia', 'Master of IT', 'AUD 48,000/yr'),
  University('TU Munich', 'Germany', 'MS Informatics', 'EUR 3,000/yr'),
  University('University of Manchester', 'UK', 'MSc Data Science', 'GBP 30,000/yr'),
  University('Arizona State University', 'USA', 'MS Software Engineering', 'USD 32,000/yr'),
];

class StudyAbroadApp extends StatelessWidget {
  const StudyAbroadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Study Abroad',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const UniversityListPage(),
    );
  }
}

class UniversityListPage extends StatelessWidget {
  const UniversityListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Universities')),
      body: ListView.builder(
        itemCount: universities.length,
        itemBuilder: (context, index) {
          final u = universities[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text(u.name),
              subtitle: Text('${u.country} • ${u.course}'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => UniversityDetailPage(university: u),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class UniversityDetailPage extends StatelessWidget {
  final University university;

  const UniversityDetailPage({super.key, required this.university});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(university.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Country: ${university.country}'),
            const SizedBox(height: 8),
            Text('Course: ${university.course}'),
            const SizedBox(height: 8),
            Text('Tuition: ${university.fee}'),
          ],
        ),
      ),
    );
  }
}
