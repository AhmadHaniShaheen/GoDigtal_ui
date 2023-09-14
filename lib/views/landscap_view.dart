import 'package:bti_flutter/main.dart';
import 'package:bti_flutter/views/data/meal_data.dart';
import 'package:flutter/material.dart';

class LandscapeView extends StatefulWidget {
  const LandscapeView({super.key});

  @override
  State<LandscapeView> createState() => _LandscapeViewState();
}

class _LandscapeViewState extends State<LandscapeView> {
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Restrant'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Expanded(
                  flex: 2,
                  child: SizedBox(
                    width: 300,
                    child: Expanded(
                      child: SingleChildScrollView(
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
                            ListTile(
                              leading: Icon(Icons.logout),
                              title: Text('Logout'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: SingleChildScrollView(
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
              ],
            ),
          ),
        ),
      );
    
  }
}