import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileDesign extends StatelessWidget {
  const ProfileDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(title: const Text("Profile")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 20),

              const CircleAvatar(
                radius: 50,
                child: Icon(Icons.person, size: 50),
              ),

              const SizedBox(height: 20),

              ItemProfile(
                title: 'Name',
                subtitle: 'Labeebah Inam',
                iconData: CupertinoIcons.person,
              ),

              ItemProfile(
                title: 'Phone',
                subtitle: '+923009300161',
                iconData: CupertinoIcons.phone,
              ),

              ItemProfile(
                title: 'Email',
                subtitle: 'labeebahinam@gmail.com',
                iconData: CupertinoIcons.mail_solid,
              ),

              ItemProfile(
                title: 'Address',
                subtitle: 'B244, Block A, North Nazimabad',
                iconData: CupertinoIcons.house,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemProfile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData iconData;

  const ItemProfile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(iconData, color: Colors.pink),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}