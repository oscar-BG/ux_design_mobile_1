import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Inicio')),
        backgroundColor: Colors.deepPurple,
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedIndex: _selectedIndex,
        // backgroundColor: Colors.deepPurple.withOpacity(0.8),

        destinations: const  <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home_filled),
            icon: Icon(Icons.home_outlined
            
            
            ),
            label: 'Inicio',
          ),
          
          NavigationDestination(
            selectedIcon: Icon(Icons.notifications),
            icon: Badge(child: Icon(Icons.notifications_none),),
            label: 'Notificaciones',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.settings),
            icon: Icon(Icons.settings_outlined),
            label: 'Configuración',
          )
        ],
      ),
      body: <Widget>[
        const Card(
          shadowColor: Colors.transparent,
          margin:  EdgeInsets.all(8.0),
          child: SizedBox.expand(
            child: Center(
              child: Text(
                'Home page',
              ),
            ),
          ),
        ),

        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Card(
                child: ListTile(
                  leading: Icon(Icons.notifications_sharp),
                  title: Text('Notification 1'),
                  subtitle: Text('This is a notification'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.notifications_sharp),
                  title: Text('Notification 2'),
                  subtitle: Text('This is a notification'),
                ),
              ),
            ],
          ),
        ),

        const Card(
          shadowColor: Colors.transparent,
          margin:  EdgeInsets.all(8.0),
          child: SizedBox.expand(
            child: Center(
              child: Text(
                'Configuración',
              ),
            ),
          ),
        ),
      ][_selectedIndex]
    );
  }
}