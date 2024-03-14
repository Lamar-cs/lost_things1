import 'package:flutter/material.dart';

void main() {
  runApp(AllUsersScreen());
}

class AllUsersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Admin Screen'),
        ),
        body: ListView.builder(
          itemCount: userList.length,
          itemBuilder: (context, index) {
            return UserItem(user: userList[index]);
          },
        ),
      ),
    );
  }
}

class Usser {
  final String name;
  final String email;
  final String imageUrl;
  bool isBlocked;

  Usser({
    required this.name,
    required this.email,
    required this.imageUrl,
    this.isBlocked = false,
  });
}

List<Usser> userList = [
  Usser(name: 'John Doe', email: 'john@example.com', imageUrl: 'https://via.placeholder.com/150', isBlocked: false),
  Usser(name: 'Jane Smith', email: 'jane@example.com', imageUrl: 'https://via.placeholder.com/150', isBlocked: true),
  Usser(name: 'Alice Johnson', email: 'alice@example.com', imageUrl: 'https://via.placeholder.com/150', isBlocked: false),
  // Add more users as needed
];

class UserItem extends StatelessWidget {
  final Usser user;

  UserItem({required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(user.imageUrl),
      ),
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: IconButton(
        icon: Icon(user.isBlocked ? Icons.block : Icons.verified),
        onPressed: () {
          // Toggle user block status
          user.isBlocked = !user.isBlocked;
          // Update UI
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('${user.name} ${user.isBlocked ? 'blocked' : 'unblocked'}'),
            ),
          );
        },
      ),
    );
  }
}
