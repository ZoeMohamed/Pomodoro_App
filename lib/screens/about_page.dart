import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: <Widget>[
          Stack(
            overflow: Overflow.visible,
            alignment: Alignment.center,
            children: <Widget>[
              Image(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 3,
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1597733336794-12d05021d510?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=774&q=80'),
              ),
              Positioned(
                bottom: -60.0,
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/avatar.png'),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 60,
          ),
          ListTile(
            title: Center(
                child: Text(
              'Pomodoro App',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            )),
            subtitle: Center(
                child: Text('Version 1.0',
                    style: TextStyle(
                        fontFamily: 'Poppins', fontWeight: FontWeight.w700))),
          ),
          ListTile(
            title: Text('About App', style: TextStyle(fontFamily: 'Poppins')),
            subtitle: Text(
                'This App help people to manage their time using the so called pomodoro technique.The technique which is developed by Francesco Cirillo in the late 1980s.The Pomodoro Technique itself is a time management system that encourages people to work with the time they have—rather than against it. Using this method, you break your workday into 25-minute chunks separated by five-minute breaks. ... After about four pomodoros, you take a longer break of about 15 to 20 minutes.',
                style: TextStyle(fontFamily: 'Poppins', letterSpacing: 1)),
          ),
          SizedBox(
            height: 90,
          ),
          Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Copyright © 2021 Zoe Mohamed All Rights Reserved",
                style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                    fontWeight: FontWeight.w700),
              ))
        ],
      ),
    );
  }
}
