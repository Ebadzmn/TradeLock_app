import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CommonCalendarView extends StatelessWidget {
  const CommonCalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Calendar',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),

          // Month Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'December 2025',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.arrow_back_ios,
                    size: 16,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 20),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.black,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Calendar Grid (Custom Implementation for pixel perfection)
          _buildCalendarGrid(),

          const SizedBox(height: 24),

          // Daily Agenda Header
          const Text(
            'Friday, December 25',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          // Events
          _buildEventCard(
            title: 'Install lighting',
            time: '09:00 - 11:00',
            person: 'Mr. Jones',
            color: const Color(0xFF0A3F2F), // Dark Green
          ),
          _buildEventCard(
            title: 'Kitchen repaint',
            time: '11:30 - 15:30',
            person: 'Mrs. Smith',
            color: const Color(0xFF4274A5), // Blue
          ),
          _buildEventCard(
            title: 'Bathroom plumbing',
            time: '16:00 - 18:00',
            person: 'Reminder', // "Reminder" text + Bell icon
            color: const Color(0xFF675B8D), // Purple
            isReminder: true,
          ),

          const SizedBox(height: 20),

          // Add Job Button
          SizedBox(
            width: 180,
            height: 48,
            child: ElevatedButton(
              onPressed: () => context.push('/add-job'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2C3E38),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                foregroundColor: Colors.white,
              ),
              child: const Text('Add Job to Calendar'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarGrid() {
    // Image shows Sat Sat? Typo in design likely, assume Sun or Sat Sat. Image shows "Sat Sat". Okay I will copy image blindly or assume typo? Standard is 'Sun'. Let's look closely at image. "Fri Sat Sat". Weird. I will use "Fri Sat Sun" but label as Image if clearly visible. It says "Sat Sat". I will assume standard week "Mon Tue Wed Thu Fri Sat Sun" but the image starts Mon. The checked item is '8'.
    // Let's implement standard grid but try to match visual.
    // Row 1: Mon Tue Wed Thu Fri Sat Sat (Image has Sat twice? strange. I'll stick to Mon-Sun standard).

    // Rows logic...
    return Column(
      children: [
        // Weekdays
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:
              [
                    'Mon',
                    'Tue',
                    'Wed',
                    'Thu',
                    'Fri',
                    'Sat',
                    'Sat',
                  ] // Replicating typo "Sat" if strictly requested, but "Sun" is safer. I'll use "Sat" to match image exactly if user insists "same to same".
                  .map(
                    (day) => SizedBox(
                      width: 40,
                      child: Text(
                        day,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  )
                  .toList(),
        ),
        const SizedBox(height: 16),
        // Dates Mockup
        _buildCalendarRow(['', '', '', '', '1', '2', '3']),
        _buildCalendarRow([
          '4',
          '5',
          '6',
          '7',
          '8',
          '9',
          '10',
        ], selectedDay: '8'),
        _buildCalendarRow(['11', '12', '13', '14', '15', '16', '17']),
        _buildCalendarRow(['18', '19', '20', '21', '22', '23', '24']),
        _buildCalendarRow(['25', '26', '27', '28', '29', '30', '31']),
      ],
    );
  }

  Widget _buildCalendarRow(List<String> dates, {String? selectedDay}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: dates.map((date) {
          final isSelected = date == selectedDay;
          return Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: isSelected
                ? const BoxDecoration(
                    color: Color(0xFF2C3E38),
                    shape: BoxShape.circle,
                  )
                : null,
            child: Text(
              date,
              style: TextStyle(
                color: isSelected
                    ? Colors.white
                    : (date.isEmpty ? Colors.transparent : Colors.grey[700]),
                fontSize: 16,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildEventCard({
    required String title,
    required String time,
    required String person,
    required Color color,
    bool isReminder = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                time,
                style: const TextStyle(color: Colors.white70, fontSize: 13),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                person,
                style: const TextStyle(color: Colors.white, fontSize: 13),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.notifications_none,
                color: Colors.white,
                size: 16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
