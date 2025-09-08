import 'package:flutter/material.dart';

class listPage extends StatefulWidget {
  @override
  _listPageState createState() => _listPageState();
}

class _listPageState extends State<listPage> {
  // ✅ Data chat dummy
final List<Map<String, dynamic>> chats = [
  {
    'name': 'Eiger Official',
    'message': 'yaudah 1,5jt cash gimana ?',
    'time': '13:00',
    'avatar': 'images/7.png',
    'isUnread': true,
    'messages': [
      {
        'text': 'Lelang tiket coldplay harga 2jt',
        'isMe': false,
        'time': '12:30',
      },
      {
        'text': 'apaan sih calo calo',
        'isMe': true,
        'time': '12:45',
      },
      {
        'text': 'yaudah 1,5jt cash gimana ?',
        'isMe': false,
        'time': '13:00',
      },
    ],
  },
  {
    'name': 'Penjual Jesus Lokal',
    'message': 'iyo, nanti saya kirim',
    'time': '12:05',
    'avatar': 'images/5.webp',
    'isUnread': false,
    'messages': [
      {
        'text': 'Mas, pesen dua ya',
        'isMe': true,
        'time': '10:07',
      },
      {
        'text': 'iyo, nanti saya kirim',
        'isMe': false,
        'time': '12:05',
      },
    ],
  },
];

  bool showUnreadOnly = false;

  @override
  Widget build(BuildContext context) {
    final filteredChats = showUnreadOnly
        ? chats.where((chat) => chat['isUnread'] == true).toList()
        : chats;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'List Chat',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Color(0xFF42B549),
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color(0xFF42B549)),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // 🔹 Filter button
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 19.0, vertical: 8.0),
            color: Colors.white,
            child: Row(
              children: [
                TextButton(
                  onPressed: () => setState(() => showUnreadOnly = false),
                  child: Text(
                    'Semua',
                    style: TextStyle(
                      color: !showUnreadOnly
                          ? const Color(0xFF42B549)
                          : Colors.grey,
                      fontWeight:
                          !showUnreadOnly ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                TextButton(
                  onPressed: () => setState(() => showUnreadOnly = true),
                  child: Text(
                    'Belum Dibaca',
                    style: TextStyle(
                      color: showUnreadOnly
                          ? const Color(0xFF42B549)
                          : Colors.grey,
                      fontWeight:
                          showUnreadOnly ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 🔹 List Chat
          Expanded(
            child: ListView.builder(
              itemCount: filteredChats.length,
              itemBuilder: (context, index) {
                final chat = filteredChats[index];
                return ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(chat['avatar']),
                  ),
                  title: Text(
                    chat['name'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(chat['message']),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        chat['time'],
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      if (chat['isUnread'])
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: const Text(
                            '1',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                    ],
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      "chatDetail",
                      arguments: chat, // 🔹 Kirim semua data chat
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
