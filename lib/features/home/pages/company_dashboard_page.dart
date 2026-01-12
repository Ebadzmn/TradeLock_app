import 'package:flutter/material.dart';

class CompanyDashboardPage extends StatelessWidget {
  const CompanyDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Company Dashboard'),
        backgroundColor: const Color(0xFF1B3B36),
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: Text(
          'Company Dashboard Content',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
