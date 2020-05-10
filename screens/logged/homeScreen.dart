import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:fipstack/services/authService.dart';
import 'package:fipstack/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:fipstack/services/authService.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: appBackgroundColor,
      appBar: AppBar(
        title: Text(
          "Welcome Piotr",
          style: dashboardStyle,
        ),
        backgroundColor: appBackgroundColor,
        elevation: 0,
      ),
      drawer: ClipRRect(
        borderRadius: BorderRadius.circular(16),
              child: Drawer(
          elevation: 1,
          child: Container(
            color: lightRed,
            child: getSideMenu(),
          ),
        ),
      ),
      body: Container(
        color: appBackgroundColor,
        child: getAllArticles(),
      ),
    );
  }

  Widget getSideMenu() {
    return ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
            accountEmail: Text("test@tescik.pl"),
            accountName: Text("Piotr"),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        "https://images-cdn.9gag.com/photo/aDgwAVx_460s.jpg")))),
        ListTile(
          title: Text(
            "My profile",
            style: impactFont,
          ),
          trailing: Icon(FeatherIcons.user),
        ),
        Divider(
          height: 5,
        ),
        ListTile(
          title: Text(
            "About us",
            style: impactFont,
          ),
          trailing: Icon(Icons.accessibility_new),
        ),
        Divider(
          height: 5,
        ),
        ListTile(
          title: Text(
            "Settings",
            style: impactFont,
          ),
          trailing: Icon(FeatherIcons.settings),
        ),
        Divider(
          height: 5,
        ),
        ListTile(
          title: Text(
            "log out",
            style: impactFont,
          ),
          trailing: Icon(FeatherIcons.logOut),
          onTap: _auth.signOut,
        ),
        Divider(
          height: 5,
        ),
      ],
    );
  }

  Widget getAllArticles() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
       
      ],
    );
  }
}
