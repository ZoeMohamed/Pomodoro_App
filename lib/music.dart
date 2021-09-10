import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MusicChange extends StatefulWidget {
  @override
  _MusicChangeState createState() => _MusicChangeState();
}

class _MusicChangeState extends State<MusicChange> {
  List<Color> _colors = <Color>[
    Colors.white,
    Colors.blue,
    Colors.red,
    Colors.black,
    Colors.green
  ];
  var url_music;
  @override
  void initState() {
    super.initState();
    getSound();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    setState(() {});
    super.dispose();
  }

  getSound() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {});
    setState(() {
      url_music = prefs.getString('url_sound');
    });
    print(url_music);
  }

  int _currentColorIndex = 0;

  void _incrementColorIndex() {
    setState(() {
      if (_currentColorIndex < _colors.length - 1) {
        _currentColorIndex++;
      } else {
        _currentColorIndex = 0;
      }
    });
  }

  final player = AudioPlayer();
  var position;

  setSound(data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('url_sound', data);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Setting music"),
      ),
      body: Column(
        children: <Widget>[
          Card(
              //pembanding google drive
              color: (url_music ==
                      'https://drive.google.com/uc?export=view&id=13GxEiSMv_ss9C5a-70B8kdDPEjUuAGzf')
                  ? Colors.red
                  : Colors.white,
              child: ListTile(
                title: Text("Rooster"),
                subtitle: Text("Rooster Sound Effect"),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/rooster.jpg'),
                ),
                trailing: Container(
                  width: 100,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                          onPressed: () async {
                            await player.setUrl(
                                'https://drive.google.com/uc?export=view&id=13GxEiSMv_ss9C5a-70B8kdDPEjUuAGzf');

                            player.play();
                          },
                          color: Colors.blue,
                          icon: Icon(Icons.play_arrow)),
                      IconButton(
                          onPressed: () async {
                            setState(() {
                              position = 1;
                            });

                            await setSound(
                                'https://drive.google.com/uc?export=view&id=13GxEiSMv_ss9C5a-70B8kdDPEjUuAGzf');
                            setState(() {});
                          },
                          color: Colors.green,
                          icon: Icon(Icons.add))
                    ],
                  ),
                ),
              )),
          Card(
              color: (url_music ==
                      'https://drive.google.com/uc?export=view&id=1x38u1aINm-rQrZSD-Fb6VsMRAtPjIPse')
                  ? Colors.red
                  : Colors.white,
              child: ListTile(
                title: Text("Cow"),
                subtitle: Text("Cow Sound Effect"),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/cow.jpg'),
                ),
                trailing: Container(
                  width: 100,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                          onPressed: () async {
                            await player.setUrl(
                                'https://drive.google.com/uc?export=view&id=1x38u1aINm-rQrZSD-Fb6VsMRAtPjIPse');

                            player.play();
                          },
                          color: Colors.blue,
                          icon: Icon(Icons.play_arrow)),
                      IconButton(
                          onPressed: () async {
                            setState(() {
                              position = 2;
                            });
                            await setSound(
                                'https://drive.google.com/uc?export=view&id=1x38u1aINm-rQrZSD-Fb6VsMRAtPjIPse');
                            setState(() {});
                          },
                          color: Colors.green,
                          icon: Icon(Icons.add))
                    ],
                  ),
                ),
              )),
          Card(
              color: (url_music ==
                      'https://drive.google.com/uc?export=view&id=1MPSoQz4oOhRK0BAa2wvVTe3unZQSBfJL')
                  ? Colors.red
                  : Colors.white,
              child: ListTile(
                title: Text("Tiger"),
                subtitle: Text("Tiger Sound Effect"),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/tiger.jpg'),
                ),
                trailing: Container(
                  width: 100,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                          onPressed: () async {
                            await player.setUrl(
                                'https://drive.google.com/uc?export=view&id=1MPSoQz4oOhRK0BAa2wvVTe3unZQSBfJL');

                            player.play();
                          },
                          color: Colors.blue,
                          icon: Icon(Icons.play_arrow)),
                      IconButton(
                          onPressed: () async {
                            setState(() {
                              position = 3;
                            });
                            await setSound(
                                'https://drive.google.com/uc?export=view&id=1MPSoQz4oOhRK0BAa2wvVTe3unZQSBfJL');
                            setState(() {});
                          },
                          color: Colors.green,
                          icon: Icon(Icons.add))
                    ],
                  ),
                ),
              )),
          Card(
              color: (url_music ==
                      'https://drive.google.com/uc?export=view&id=1vhgHylgbPjSUySK0_cyixK8Anidpl26K')
                  ? Colors.red
                  : Colors.white,
              child: ListTile(
                title: Text("Explosion"),
                subtitle: Text("Explosion Sound Effect"),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/explosion.jpg'),
                ),
                trailing: Container(
                  width: 100,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                          onPressed: () async {
                            await player.setUrl(
                                'https://drive.google.com/uc?export=view&id=1vhgHylgbPjSUySK0_cyixK8Anidpl26K');

                            player.play();
                          },
                          color: Colors.blue,
                          icon: Icon(Icons.play_arrow)),
                      IconButton(
                          onPressed: () async {
                            setState(() {
                              position = 4;
                            });
                            await setSound(
                                'https://drive.google.com/uc?export=view&id=1vhgHylgbPjSUySK0_cyixK8Anidpl26K');
                            setState(() {});
                          },
                          color: Colors.green,
                          icon: Icon(Icons.add))
                    ],
                  ),
                ),
              )),
          Card(
              color: (url_music ==
                      'https://drive.google.com/uc?export=view&id=1VJ9w1xLFufKKBrboiTIMsD8QWoEH20Hf')
                  ? Colors.red
                  : Colors.white,
              child: ListTile(
                title: Text("Cat"),
                subtitle: Text("Cat Sound Effect"),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/cat.jpg'),
                ),
                trailing: Container(
                  width: 100,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                          onPressed: () async {
                            await player.setUrl(
                                'https://drive.google.com/uc?export=view&id=1VJ9w1xLFufKKBrboiTIMsD8QWoEH20Hf');

                            player.play();
                          },
                          color: Colors.blue,
                          icon: Icon(Icons.play_arrow)),
                      IconButton(
                          onPressed: () async {
                            setState(() {
                              position = 5;
                            });
                            await setSound(
                                'https://drive.google.com/uc?export=view&id=1VJ9w1xLFufKKBrboiTIMsD8QWoEH20Hf');
                            setState(() {});
                          },
                          color: Colors.green,
                          icon: Icon(Icons.add))
                    ],
                  ),
                ),
              )),
          Card(
              color: (url_music ==
                      'https://drive.google.com/uc?export=view&id=12-0aJM7lbXPRTMUPrIZluaJJNHKG7spu')
                  ? Colors.red
                  : Colors.white,
              child: ListTile(
                title: Text("Gorilla"),
                subtitle: Text("Gorila Sound effect"),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/gorilla.jpg'),
                ),
                trailing: Container(
                  width: 100,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                          onPressed: () async {
                            await player.setUrl(
                                'https://drive.google.com/uc?export=view&id=12-0aJM7lbXPRTMUPrIZluaJJNHKG7spu');

                            player.play();
                          },
                          color: Colors.blue,
                          icon: Icon(Icons.play_arrow)),
                      IconButton(
                          onPressed: () async {
                            setState(() {
                              position = 6;
                            });
                            await setSound(
                                'https://drive.google.com/uc?export=view&id=12-0aJM7lbXPRTMUPrIZluaJJNHKG7spu');
                            setState(() {});
                          },
                          color: Colors.green,
                          icon: Icon(Icons.add))
                    ],
                  ),
                ),
              )),
          Card(
              color: (url_music ==
                      'https://drive.google.com/uc?export=view&id=1ThE1zGu9eMKhRB4YJWmTPpJSTfjFqeLi')
                  ? Colors.red
                  : Colors.white,
              child: ListTile(
                title: Text("Monster"),
                onLongPress: () {},
                subtitle: Text("Monster sound effect"),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/monster.jpg'),
                ),
                trailing: Container(
                  width: 100,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                          onPressed: () async {
                            await player.setUrl(
                                'https://drive.google.com/uc?export=view&id=1ThE1zGu9eMKhRB4YJWmTPpJSTfjFqeLi');

                            player.play();
                          },
                          color: Colors.blue,
                          icon: Icon(Icons.play_arrow)),
                      IconButton(
                          onPressed: () async {
                            setState(() {
                              position = 7;
                            });
                            await setSound(
                                'https://drive.google.com/uc?export=view&id=1ThE1zGu9eMKhRB4YJWmTPpJSTfjFqeLi');
                            setState(() {});
                          },
                          color: Colors.green,
                          icon: Icon(Icons.add))
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
