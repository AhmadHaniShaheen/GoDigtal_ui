import 'package:bti_flutter/main.dart';
import 'package:bti_flutter/views/data/meal_data.dart';
import 'package:flutter/material.dart';

class PortriatView extends StatefulWidget {
  const PortriatView({super.key});

  @override
  State<PortriatView> createState() => _PortriatViewState();
}

class _PortriatViewState extends State<PortriatView> {
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('restrant'),
          ),
          drawer: const Visibility(
            child: Drawer(
              child: Column(
                children: [
                  UserAccountsDrawerHeader(
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80"),
                    ),
                    accountName: Text('Ahmad Shaheen'),
                    accountEmail: Text('dev.ahmadshaheen@gmail.com'),
                  ),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Home'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Profile'),
                    trailing: Icon(Icons.account_tree),
                  ),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Favarite'),
                    trailing: Icon(Icons.favorite),
                  ),
                  Spacer(),
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Logout'),
                  ),
                ],
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
                children: meals.map((e) {
              return Meal(
                name: e['name'],
                image: e['image'],
                contents: e['contents'],
              );
            }).toList()),
          ),
        ),
      );
    }
}