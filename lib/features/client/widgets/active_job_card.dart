import 'package:flutter/material.dart';

class ActiveJobCard extends StatelessWidget {
  final String title;
  final String date;
  final String time;
  final String escrowBalance;
  final VoidCallback onJobDetailsTap;
  final VoidCallback onPayTap;

  const ActiveJobCard({
    super.key,
    required this.title,
    required this.date,
    required this.time,
    required this.escrowBalance,
    required this.onJobDetailsTap,
    required this.onPayTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue.withOpacity(0.3), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1B3B36),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '$date • $time',
            style: TextStyle(fontSize: 14, color: Colors.grey[700]),
          ),
          const SizedBox(height: 8),
          Text(
            'Escrow balance: $escrowBalance remaining',
            style: TextStyle(fontSize: 14, color: Colors.grey[700]),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: onJobDetailsTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2C3E38),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Job Details',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: onPayTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2C3E38),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Pay',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
