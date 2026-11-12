import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String scholarshipName;

  const DetailScreen({super.key, required this.scholarshipName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Beasiswa')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            Text(
              scholarshipName,
              style: const TextStyle(fontSize: 28),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
           
              onPressed: () => Navigator.pop(context, scholarshipName),
              child: const Text('Pilih Beasiswa'),
            ),
          ],
        ),
      ),
    );
  }
}