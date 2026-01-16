import 'package:flutter/material.dart';

class JobListingCard extends StatelessWidget {
  final String title;
  final String budget;
  final String timeLeft;
  final String location;
  final int offers;
  final String listedTime;
  final String status;
  // In a real app, you might pass an image URL or Asset path
  final String imagePath;
  final VoidCallback? onEditTap;
  final VoidCallback? onViewBidsTap;

  const JobListingCard({
    super.key,
    required this.title,
    required this.budget,
    required this.timeLeft,
    required this.location,
    required this.offers,
    required this.listedTime,
    this.status = 'Live',
    required this.imagePath,
    this.onEditTap,
    this.onViewBidsTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Top Section: Image, Details, Status
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    imagePath, // Use asset for now as per design mockup
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 70,
                      height: 70,
                      color: Colors.grey[300],
                      child: const Icon(Icons.image_not_supported),
                    ),
                  ),
                ),
                const SizedBox(width: 12),

                // Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1B3B36), // Dark Green
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF1B3B36),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              status,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Budget: $budget',
                        style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                      ),
                      Text(
                        '$timeLeft left',
                        style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                      ),
                      Row(
                        children: [
                          Text(
                            '$location ',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[600],
                            ),
                          ),
                          const Icon(Icons.check, size: 12, color: Colors.grey),
                          Text(
                            ' Offers: $offers',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),
            Divider(color: Colors.grey.shade200, height: 1),
            const SizedBox(height: 16),

            // Bottom Section: Listed time & Action Buttons
            Row(
              children: [
                Text(
                  'Listed $listedTime',
                  style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                ),
                const Spacer(),

                _buildActionButton('Review Extra'),
                const SizedBox(width: 8),
                _buildActionButton('View Bids', onTap: onViewBidsTap),
                const SizedBox(width: 8),
                _buildActionButton('Edit', onTap: onEditTap), // Pass callback
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(String label, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF2C3E38), // Dark Green Background
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
