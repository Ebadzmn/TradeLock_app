import 'package:flutter/material.dart';

class ClientDashboardPage extends StatelessWidget {
  const ClientDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Client Dashboard'),
        backgroundColor: const Color(0xFF1B3B36),
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: Text('Client Dashboard Content', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
