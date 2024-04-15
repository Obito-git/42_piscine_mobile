import 'package:flutter/material.dart';
import 'package:weather_app_proj/widgets/simple_view.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const AppTabBar(),
    );
  }
}

class AppTabBar extends StatefulWidget {
  const AppTabBar({super.key});

  @override
  State<AppTabBar> createState() => _AppTabBarState();
}

class _AppTabBarState extends State<AppTabBar> with TickerProviderStateMixin {
  late final TabController _tabController;
  final TextEditingController _locationController = TextEditingController();
  String _location = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  void handleLocationButton() {
    setState(() {
      _location = "Geolocation";
    });
  }

  void handleSearchFieldSubmit(String value) {
    setState(() {
      _location = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        children: [
          Expanded(
              child: TextField(
                  controller: _locationController,
                  decoration: const InputDecoration(
                    hintText: 'Search location...',
                  ),
                  onSubmitted: (String value) {
                    handleSearchFieldSubmit(value);
                  })),
          IconButton(
              onPressed: handleLocationButton,
              icon: const Icon(Icons.location_on))
        ],
      )),
      bottomNavigationBar: BottomAppBar(
        child: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              icon: Icon(Icons.settings),
              text: 'Currently',
            ),
            Tab(
              icon: Icon(Icons.calendar_today),
              text: 'Today',
            ),
            Tab(
              icon: Icon(Icons.calendar_month),
              text: 'Weekly',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          SimpleView(
            tabName: 'Currently',
            location: _location,
          ),
          SimpleView(
            tabName: 'Today',
            location: _location,
          ),
          SimpleView(
            tabName: 'Weekly',
            location: _location,
          )
        ],
      ),
    );
  }
}
