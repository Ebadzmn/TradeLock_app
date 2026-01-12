import 'package:flutter/material.dart';
import 'package:tradelock_app/core/widgets/common_app_bar.dart';
import 'package:tradelock_app/features/Tradsman/widgets/traders_bottom_nav_bar.dart';

class TermsConditionsPage extends StatelessWidget {
  const TermsConditionsPage({super.key});

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
              'Terms & Conditions',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF212121),
              ),
            ),
            const SizedBox(height: 24),
            _buildSectionText(
              'Please read these Terms and Conditions carefully before using our tradesperson platform Tradelock.',
            ),
            _buildSectionText(
              'By accessing or using the Platform, you agree to be bound by these Terms and Conditions.',
            ),
            const SizedBox(height: 16),
            _buildSectionHeader('1. Acceptance of Terms'),
            _buildSectionText(
              'By creating an account and using the Tradelock, you confirm that you have read, understood, and agreed to these Terms and Conditions. If you do not agree with any part of these terms, you must not use the Platform.',
            ),
            const SizedBox(height: 16),
            _buildSectionHeader('2. User Accounts'),
            _buildSectionText(
              'To access certain features, you must create an account as a Client, Tradesperson, or Company.',
            ),
            _buildSectionText(
              'You agree to provide accurate, complete, and up-to-date information.',
            ),
            _buildSectionText(
              'You are responsible for maintaining the confidentiality of your account credentials.',
            ),
            _buildSectionText(
              'You are fully responsible for all activities conducted under your account.',
            ),
            _buildSectionText(
              'If you suspect unauthorized access or misuse, you must notify us immediately.',
            ),
            const SizedBox(height: 16),
            _buildSectionHeader('3. Privacy Policy'),
            _buildSectionText(
              'All job details (scope, price, deadline) must be agreed upon before work begins.',
            ),
            _buildSectionText(
              'Once a job is set up and approved, it becomes an official agreement between the Client and the Tradesperson.',
            ),
            const SizedBox(height: 120), // Spacing for floating button
          ],
        ),
      ),
      floatingActionButton: const TradersBottomNavBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color(0xFF212121),
        ),
      ),
    );
  }

  Widget _buildSectionText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          color: Color(0xFF424242),
          height: 1.5,
        ),
      ),
    );
  }
}
