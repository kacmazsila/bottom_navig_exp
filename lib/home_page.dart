import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPage = 0;
  Widget selectedWidget = Container();

  changePage(int index) {
    setState(() {
      selectedPage = index;
      selectedWidget = showPage(selectedPage);
    });
  }

  Widget showPage(int index) {
    switch (index) {
      case 0:
        return page1();
      case 1:
        return page2();
      case 2:
        return page3();
      case 3:
        return page4();
      default:
        return Container();
    }
  }

  Widget page1() {
    return Container(
      child: Center(child: Text("AnaSayfa")),
    );
  }

  Widget page2() {
    return Container(
      child: Center(child: Text("Son Dakika")),
    );
  }

  Widget page3() {
    return Container(
      child: Center(child: Text("Kategoriler")),
    );
  }

  Widget page4() {
    return Container(
      child: Center(child: Text("İletişim")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gazete")),
      body: selectedWidget,
      bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.green),
          child: BottomNavigationBar(
            currentIndex: selectedPage,
            onTap: changePage,
            type: BottomNavigationBarType.shifting,
            fixedColor: Colors.white,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: 'AnaSayfa'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.last_page),
                  label: 'Son Dakika',
                  tooltip: 'Son dakika haberlerine gider'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category),
                  label: 'Kategoriler',
                  activeIcon: Icon(Icons.delete)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.contact_phone),
                  label: 'İletişim',
                  backgroundColor: Colors.orange),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category),
                  label: 'Yazarlar',
                  activeIcon: Icon(Icons.delete)),
            ],
          )),
    );
  }
}
