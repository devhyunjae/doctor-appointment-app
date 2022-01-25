import 'package:flutter/material.dart';
import 'package:medicare/colors.dart';
import 'package:medicare/tabs/HomeTab.dart';
import 'package:medicare/tabs/ScheduleTab.dart';
import 'package:medicare/widgets/SliverDoctorDetail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        final MediaQueryData data = MediaQuery.of(context);
        return MediaQuery(
          data: data.copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/detail': (context) => SliverDoctorDetail(),
      },
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  void goToSchedule() {
    setState(() {
      _selectedIndex = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      HomeTab(
        onPressedScheduleCard: goToSchedule,
      ),
      ScheduleTab(),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(MyColors.primary),
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: screens[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        selectedItemColor: Color(MyColors.primary),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              height: 55,
              decoration: BoxDecoration(
                border: Border(
                  top: _selectedIndex == 0
                      ? BorderSide(color: Color(MyColors.bg01), width: 5)
                      : BorderSide.none,
                ),
              ),
              child: Icon(
                Icons.local_hospital,
                color: _selectedIndex == 0
                    ? Color(MyColors.bg01)
                    : Color(MyColors.bg02),
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 55,
              decoration: BoxDecoration(
                border: Border(
                  top: _selectedIndex == 1
                      ? BorderSide(color: Color(MyColors.bg01), width: 5)
                      : BorderSide.none,
                ),
              ),
              child: Icon(
                Icons.calendar_today,
                color: _selectedIndex == 1
                    ? Color(MyColors.bg01)
                    : Color(MyColors.bg02),
              ),
            ),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (value) => setState(() {
          _selectedIndex = value;
        }),
      ),
    );
  }
}
