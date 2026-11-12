import 'package:flutter/material.dart';

import 'detail_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _scholarships = [
    'Beasiswa Unggulan',
    'KIP Kuliah',
    'LPDP',
  ];

  String? _selectedScholarship;

  Future<void> _openDetail(String name) async {
    final selected = await Navigator.push<String>(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(scholarshipName: name),
      ),
    );

    if (!mounted) return;

    if (selected != null) {
      setState(() {
        _selectedScholarship = selected;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pencarian Beasiswa'),
        actions: [
          IconButton(
            tooltip: 'Profil',
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => const ProfileScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              _selectedScholarship == null
                  ? 'Belum ada beasiswa dipilih'
                  : 'Beasiswa dipilih: $_selectedScholarship',
              style: const TextStyle(fontSize: 20),
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: _scholarships.length,
              itemBuilder: (context, index) {
                final name = _scholarships[index];
                return ListTile(
                  title: Text(name),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => _openDetail(name),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
