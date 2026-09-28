import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './detail.dart';
import '../models/destination.dart';
import '../screens/login.dart';

class Home extends StatelessWidget {
  final String username;

  const Home({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFCBE3F7), Color(0xFFE4F0FB), Color(0xFFF7FAFF)],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'Library',
            style: TextStyle(
              color: Color(0xFF0F172A),
              fontWeight: FontWeight.bold,
            ),
          ),
          iconTheme: const IconThemeData(color: Color(0xFF0F172A)),
          actions: [
            IconButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();

                await prefs.remove('logged_in_username');
                await prefs.setBool('is_logged_in', false);

                if (!context.mounted) return;
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (route) => false,
                );
              },
              icon: const Icon(Icons.logout_rounded),
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: destinationList.length,
          itemBuilder: (context, index) {
            final DestinationModel = destinationList[index];
            return ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              leading: SizedBox(
                width: 64,
                height: 88,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    DestinationModel.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: const Color(0xFFE2E8F0),
                        child: const Icon(
                          Icons.menu_book_rounded,
                          color: Color(0xFF475569),
                          size: 32,
                        ),
                      );
                    },
                  ),
                ),
              ),
              title: Text(
                DestinationModel.name,
                style:  TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1E293B),
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   SizedBox(height: 4),
                  Text(
                    DestinationModel.category,
                    style:  TextStyle(color: Color(0xFF64748B)),
                  ),
                  Text(
                    DestinationModel.location,
                    style:  TextStyle(
                      color: Color(0xFF94A3B8),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              trailing:  Icon(
                Icons.favorite,
                size: 25,
                color: Color.fromARGB(255, 206, 39, 128),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Detail(destination: DestinationModel)),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
