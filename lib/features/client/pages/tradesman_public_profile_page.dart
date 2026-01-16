import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tradelock_app/core/widgets/common_app_bar.dart';

class TradesmanPublicProfilePage extends StatelessWidget {
  const TradesmanPublicProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryDark = Color(0xFF2C3E38);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CommonAppBar(
        backgroundColor: primaryDark,
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section (Dark Background)
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
              // color: primaryDark, // Assuming header background might be white based on image actually showing white bg for profile info?
              // Looking at image, top bar is dark. Profile info is on white.
              // Wait, image shows top app bar dark. Then profile info (avatar, name) seems to be on white background.
            ),

            // Actually let's follow the image closely.
            // Image has dark app bar.
            // Below that, just white background.
            // Avatar on left, Name and info on right.
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Profile Info
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                          image: DecorationImage(
                            image: AssetImage('assets/images/trad2.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Jhon Bryan',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1B3B36),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Cleaner',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                          Text(
                            'Grimbsy, UK',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[400],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: const [
                              Icon(
                                Icons.star,
                                color: Color(0xFFFBC02D),
                                size: 16,
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xFFFBC02D),
                                size: 16,
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xFFFBC02D),
                                size: 16,
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xFFFBC02D),
                                size: 16,
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xFFFBC02D),
                                size: 16,
                              ),
                              SizedBox(width: 4),
                              Text(
                                '4.8 (28 Reviews)',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF424242),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Main Card Container
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSectionTitle('Bio'),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(12),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade200),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'Reliable tradesman with 10+ years experience in residential an d commercial work.',
                            style: TextStyle(
                              color: Color(0xFF5A6B81),
                              fontSize: 14,
                              height: 1.4,
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        _buildSectionTitle('Skills'),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            _buildSkillChip('Interior painting'),
                            _buildSkillChip('Exterior painting'),
                            _buildSkillChip('Wallpapering'),
                            _buildSkillChip('Spray finishes'),
                          ],
                        ),

                        const SizedBox(height: 20),

                        _buildSectionTitle('Experience'),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(12),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade200),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            '10+ years',
                            style: TextStyle(
                              color: Color(0xFF5A6B81),
                              fontSize: 14,
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),
                        _buildSectionTitle('Coverage area'),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(12),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade200),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'Grimsby, Cleethorpes, surrounding areas',
                            style: TextStyle(
                              color: Color(0xFF5A6B81),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Reviews Section (Inside a card similar to main container?)
                  // Image shows "Reviews" header then list inside a card.
                  // Actually image shows generic card container wraps Bio, Skills, Experience, Coverage.
                  // Then "Reviews" is a separate section in another card below?
                  // Looking at the scroll bar/layout, it seems the "Reviews" title and list are inside another card container or the same style.
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSectionTitle('Reviews'),
                        const SizedBox(height: 16),
                        _buildReviewItem(
                          name: 'Saiful Islam',
                          date: '5 September 2024',
                          rating: 4.8,
                          review:
                              'Very Professional And Reliable. The Cleaning Was Done With Great Attention To Detail, And Everything Was Left Fresh And Spotless. Punctual, Honest, And Easy To Communicate With. Highly Recommended For Anyone Looking For A Trustworthy Cleaner.',
                          avatarPath: 'assets/images/trad2.png', // Placeholder
                        ),
                        const SizedBox(height: 16),
                        const Divider(),
                        const SizedBox(height: 16),
                        _buildReviewItem(
                          name: 'Saiful Islam',
                          date: '5 September 2024',
                          rating: 4.8,
                          review:
                              'Very Professional And Reliable. The Cleaning Was Done With Great Attention To Detail, And Everything Was Left Fresh And Spotless. Punctual, Honest, And Easy To Communicate With. Highly Recommended For Anyone Looking For A Trustworthy Cleaner.',
                          avatarPath: 'assets/images/trad2.png', // Placeholder
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 100), // Space for buttons
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _showConfirmAcceptanceDialog(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2C3E38),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text(
                      'Accept',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => context.push('/client-chat'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2C3E38),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text(
                      'Message',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2C3E38),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'Set Up Job',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Color(0xFF424242),
      ),
    );
  }

  Widget _buildSkillChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.grey[700],
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildReviewItem({
    required String name,
    required String date,
    required double rating,
    required String review,
    required String avatarPath,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(avatarPath),
              backgroundColor: Colors.grey[200],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    date,
                    style: TextStyle(color: Colors.grey[500], fontSize: 12),
                  ),
                ],
              ),
            ),
            Text(
              rating.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const Icon(Icons.star, color: Color(0xFFFBC02D), size: 16),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          review,
          style: const TextStyle(
            color: Color(0xFF757575),
            fontSize: 13,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  void _showConfirmAcceptanceDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Confirm Acceptance',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(
                        Icons.close,
                        size: 20,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Are you sure you want to accept this job offer for £375 ?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300],
                          foregroundColor: Colors.black87,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle confirm logic
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2C3E38),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text(
                          'Confirm',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
