import 'package:flutter/material.dart';
import 'hostjoin.dart';


class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SOS Game'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Open the Drawer
            },
          ),
        ],
      ),
      drawer: const GameDrawer(), // Side Drawer
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Game Selection Title
            const Text(
              'Welcome to SOS Game',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 20),

            // Game Selection Button
            ElevatedButton(
              onPressed: () {
                // Navigate to HostJoinScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HostJoinScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                backgroundColor: Colors.blueAccent, // Correct property for background color
              ),
              child: const Text(
                'Start SOS Game',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 40),

            // Placeholder for additional features
            const Text(
              'More games coming soon!',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class GameDrawer extends StatelessWidget {
  const GameDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Drawer Header
          UserAccountsDrawerHeader(
            accountName: const Text('Player Name'),
            accountEmail: const Text('player@example.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.blueAccent,
              child: Text(
                'P',
                style: const TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          ),

          // Profile Option
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Edit Profile'),
            onTap: () {
              // Handle profile editing
              Navigator.pop(context);
            },
          ),

          // System Mode (Dark/Light)
          ListTile(
            leading: const Icon(Icons.brightness_6),
            title: const Text('System Mode'),
            onTap: () {
              // Handle theme switching
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Switching System Mode...')),
              );
            },
          ),

          // Settings Option
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // Handle settings navigation
              Navigator.pop(context);
            },
          ),

          // Invite Friends Option
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text('Invite Friends'),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Invite link sent to your friends!')),
              );
            },
          ),

          // Privacy and Policies
          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text('Privacy and Policies'),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Redirecting to Privacy Policies...')),
              );
            },
          ),

          // Logout Option
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('You have been logged out!')),
              );
            },
          ),
        ],
      ),
    );
  }
}
