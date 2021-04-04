import 'package:flutter/material.dart';
import 'package:flutter_social_ui/data/data.dart';
import 'package:flutter_social_ui/screens/auth_screen.dart';
import 'package:flutter_social_ui/screens/home_screen.dart';
import 'package:flutter_social_ui/screens/profile_screen.dart';

class CustomDrawer extends StatelessWidget {
  _buildDrawerOption(Icon icon, String title, Function onTap) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image(
                height: 200,
                width: double.infinity,
                image: AssetImage(currentUser.backgroundImageUrl),
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 3,
                            color: Theme.of(context).primaryColor,
                          )),
                      child: ClipOval(
                        child: Image(
                          image: AssetImage(currentUser.profileImageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      currentUser.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5),
                    )
                  ],
                ),
              ),
            ],
          ),
          _buildDrawerOption(
              Icon(Icons.dashboard),
              'Home',
              () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => HomeScreen()))),
          _buildDrawerOption(Icon(Icons.chat), 'chat', () {}),
          _buildDrawerOption(Icon(Icons.location_on), 'Map', () {}),
          _buildDrawerOption(
              Icon(Icons.account_circle),
              'Your Profile',
              () => Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (_) => ProfileScreen(currentUser)))),
          _buildDrawerOption(Icon(Icons.dashboard), 'Home', () {}),
          _buildDrawerOption(Icon(Icons.settings), 'Settings', () {}),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: _buildDrawerOption(
                  Icon(Icons.directions_run),
                  'Logout',
                  () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => AuthScreen()))),
            ),
          ),
        ],
      ),
    );
  }
}
