import 'package:flutter/material.dart';
import 'package:testing/pages/akili_members.dart';
import 'package:testing/pages/notication_page.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const NotificationPage()),
      );
    }else  if (_selectedIndex == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AkiliMembersPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'ListFetch',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        // selectedFontSize: 10.0,
        onTap: _onItemTapped,
      ),
      appBar: AppBar(
        // leading: Icon(Icons.home),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          "Account",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.logout_outlined,
              color: Colors.black,
            ),
          )
        ],
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //two texts
                Container(
                  child: Column(
                    children: [
                      Text(
                        "Welcome Back",
                        style: TextStyle(fontSize: 15.0),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "Rizwan",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                //two
                Container(
                  child: CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      radius: 23,
                      child: Icon(Icons.home)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
