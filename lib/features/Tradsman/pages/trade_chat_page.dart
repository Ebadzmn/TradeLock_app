import 'package:flutter/material.dart';
import 'package:tradelock_app/core/widgets/common_app_bar.dart';
import 'package:tradelock_app/features/Tradsman/widgets/traders_bottom_nav_bar.dart';

class TradeChatPage extends StatelessWidget {
  const TradeChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color headerBgColor = Color(0xFF23322E);
    const Color myMessageBgColor = Color(0xFFDCF8C6);
    const Color sendButtonColor = Color(0xFF1B2B27);

    final List<Map<String, dynamic>> messages = [
      {
        'isMe': false,
        'name': 'ABC Plumbing Ltd',
        'nameColor': Colors.red[800],
        'text':
            'Hey guys, anyone here looking for any extra plumbing work this week? Got some downtime and could help out.',
        'time': '21:54',
      },
      {
        'isMe': true,
        'text':
            "I've got a bunch of landscaping jobs lined up for the next few weeks, could use an extra pair of hands on some of them",
        'time': '21:56',
        'status': 'read',
      },
      {
        'isMe': false,
        'name': 'Elite Electrical Inc.',
        'nameColor': Colors.purple[800],
        'text':
            "We're swamped with jobs right now, but let me know if any electrical work comes up that you can't handle.",
        'time': '21:59',
      },
      {
        'isMe': true,
        'text':
            "Any of you guys have smaller jobs you need an extra set of hands for? Got some availability I'd like to fill.",
        'time': '22:00',
        'status': 'read',
      },
      {
        'isMe': false,
        'name': 'Bright Paintworks',
        'nameColor': Colors.orange[800],
        'text':
            'Just finished a big commercial project, have 2 guys free for the next 3 days if anyone needs help.',
        'time': '22:00',
      },
      {
        'isMe': false,
        'name': 'Smithson Carpentry',
        'nameColor': Colors.blue[800],
        'text':
            "I'm looking for someone who could help out a couple of days a week with...",
        'time': '22:05',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CommonAppBar(
        backgroundColor: headerBgColor,
        showBackButton: true,
        titleText: 'TradeChat (9)',
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                final bool isMe = msg['isMe'];

                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Row(
                    mainAxisAlignment: isMe
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!isMe)
                        const Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: CircleAvatar(
                            radius: 18,
                            backgroundImage: NetworkImage(
                              'https://via.placeholder.com/150',
                            ),
                          ),
                        ),
                      Flexible(
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: isMe ? myMessageBgColor : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: isMe
                                ? null
                                : Border.all(color: Colors.black12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (!isMe)
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 4.0),
                                  child: Text(
                                    msg['name'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: msg['nameColor'],
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              Text(
                                msg['text'],
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF424242),
                                  height: 1.4,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Spacer(),
                                  Text(
                                    msg['time'],
                                    style: const TextStyle(
                                      fontSize: 10,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  if (isMe) ...[
                                    const SizedBox(width: 4),
                                    const Icon(
                                      Icons.done_all,
                                      size: 14,
                                      color: Colors.green,
                                    ),
                                  ],
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildInputBar(sendButtonColor),
      floatingActionButton: const TradersBottomNavBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildInputBar(Color sendColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.black12)),
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black12),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Type a message ...',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.attach_file, color: Colors.grey),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 12),
            Container(
              decoration: BoxDecoration(
                color: sendColor,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.send, color: Colors.white, size: 20),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
