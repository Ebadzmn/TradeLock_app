import 'package:flutter/material.dart';
import 'package:tradelock_app/core/widgets/common_app_bar.dart';
import 'package:tradelock_app/features/Tradsman/widgets/traders_bottom_nav_bar.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({super.key});

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  final List<Map<String, dynamic>> _faqs = [
    {
      'id': '01',
      'question': '1. What is Tradelock?',
      'answer':
          'Tradelock is a platform for tradesmen and job seekers to discover and apply for jobs, manage communication, and organize hiring in one place.',
      'isExpanded': false,
    },
    {
      'id': '02',
      'question': 'Is Tradelock suitable for solo job seekers?',
      'answer':
          'Absolutely! Whether you are an individual or a company, Tradelock provides the tools you need to succeed.',
      'isExpanded': false,
    },
    {
      'id': '03',
      'question': 'Can companies and individuals both create accounts?',
      'answer':
          'Yes, our platform is designed to accommodate both business entities and independent professional tradesmen.',
      'isExpanded': false,
    },
    {
      'id': '04',
      'question': 'Is Tradelock free to use?',
      'answer':
          'Tradelock offers various pricing tiers, including a free option for basic features.',
      'isExpanded': false,
    },
    {
      'id': '05',
      'question': 'How does Tradelock ensure quality matches?',
      'answer':
          'We use advanced algorithms and verification processes to ensure that job requirements align with tradesman skills.',
      'isExpanded': false,
    },
    {
      'id': '06',
      'question': 'Can I manage everything in one place?',
      'answer':
          'Absolutely. From job discovery and applications to hiring and communication, HireMe keeps everything organized in one platform.',
      'isExpanded': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    const Color headerBgColor = Color(0xFF23322E);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CommonAppBar(
        backgroundColor: headerBgColor,
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Frequently Asked Question',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
                color: Color(0xFF212121),
              ),
            ),
            const SizedBox(height: 32),
            ..._faqs.map((faq) => _buildFAQItem(faq)).toList(),
            const SizedBox(height: 120), // Spacing for floating button
          ],
        ),
      ),
      floatingActionButton: const TradersBottomNavBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildFAQItem(Map<String, dynamic> faq) {
    bool isExpanded = faq['isExpanded'];
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                faq['isExpanded'] = !faq['isExpanded'];
              });
            },
            child: Row(
              children: [
                Text(
                  faq['id'],
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Color(0xFF212121),
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: Text(
                    faq['question'],
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Color(0xFF212121),
                    ),
                  ),
                ),
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black45),
                  ),
                  child: Icon(
                    isExpanded ? Icons.remove : Icons.add,
                    size: 20,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          if (isExpanded) ...[
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 56.0),
              child: Text(
                faq['answer'],
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF424242),
                  height: 1.5,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
