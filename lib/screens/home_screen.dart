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
        title: const Text('Inicio'),
        backgroundColor: Colors.deepPurple,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              backgroundColor: Colors.blue[500],
              child: const Text('OB'),
            ),
          )
        ],
        centerTitle: true,
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

        // Pagina de inicio
        Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 10.0,),
            const Card(
              color: Colors.blue,
              elevation: 5,
              child: ListTile(
                contentPadding: EdgeInsets.all(16.0),
                leading: Icon(Icons.home, size: 50,),
                title: Text('Inicio'),
                subtitle: Text('Esta es la pagina de inicio'),
              )
            ),
            const SizedBox(height: 16.0,),
            const Card(
              color: Colors.green,
              elevation: 5,
              child: ListTile(
                contentPadding: EdgeInsets.all(16.0),
                leading: Icon(Icons.insights_sharp, size: 50,),
                title: Text('Servicios'),
                subtitle: Text('Esta es la pagina de servicios'),
              )
            ),
            const SizedBox(height: 16.0,),
            Card(
              color: Colors.blue[600],
              elevation: 5,
              child: const ListTile(
                contentPadding: EdgeInsets.all(16.0),
                leading: Icon(Icons.calendar_month, size: 50,),
                title: Text('Calendario'),
                subtitle: Text('Esta es la pagina de calendario'),
              )
            ),
          ],
        ),
       ),

        // Pagina de notificaciones
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Card(
                child: ListTile(
                  leading: Icon(Icons.notifications_sharp),
                  title: Text('Notification 1'),
                  subtitle: Text('Esta es una notificación'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.notifications_sharp),
                  title: Text('Notification 2'),
                  subtitle: Text('Esta es una notificación'),
                ),
              ),
            ],
          ),
        ),

        // Pagina de configuracion
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            shadowColor: Colors.transparent,
            child: ListView(
              children:  <Widget>[
                const ListTile(
                  leading: Icon(Icons.person_2, color: Colors.green,),
                  title: Text('Perfil'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                const Divider(),
                ListTile(
                  leading: Icon(Icons.book, color: Colors.amber[400],),
                  title: const Text('Terminos y Condiciones'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
                const Divider(),
                const ListTile(
                  leading: Icon(Icons.privacy_tip, color: Colors.red,),
                  title: Text('privacidad'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                const Divider(),
                const ListTile(
                  leading: Icon(Icons.help, color: Colors.lightBlueAccent,),
                  title: Text('Preguntas frecuentes'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                const Divider(),
                const ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Cerrar sesión'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                const Divider(),
              ],
            ),
          )
        )
      ][_selectedIndex]
    );
  }
}