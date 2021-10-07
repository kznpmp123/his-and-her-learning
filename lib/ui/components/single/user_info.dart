import 'package:flutter/material.dart';
import 'package:kzn/providers/user_provider.dart';
import 'package:kzn/ui/routes/login_route.dart';
import 'package:provider/provider.dart';

class UserInfo extends StatefulWidget {
  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: (Provider.of<UserProvider>(context, listen: true).user == null) ?
        Container(
          child: GestureDetector(
            onTap: (){
              Navigator.pushReplacementNamed(context, LoginRoute.routeName);
            },
            child: Text("Login",style: TextStyle(color: Colors.white),),
          ),
        ) :
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome "+Provider.of<UserProvider>(context, listen: true).user.username),
            GestureDetector(
              onTap: (){
                Navigator.pushReplacementNamed(context, LoginRoute.routeName);
              },
              child: Text("Logout",style: TextStyle(color: Colors.red),),
            )
          ],
        ),
    );
  }
}
