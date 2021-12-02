import 'dart:io';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MusicChange extends StatefulWidget {
  @override
  _MusicChangeState createState() => _MusicChangeState();
}

class _MusicChangeState extends State<MusicChange> {
  var url_music;
  final player = AudioPlayer();
  var position;
  @override
  void initState() {
    super.initState();
    getSound();
  }

  getSound() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      url_music = prefs.getString('url_sound');
      position = prefs.getInt('index');
    });
  }

  setSound(data, index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('url_sound', data);
    prefs.setInt('index', index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Setting music"),
      ),
      body: ListView(
        children: <Widget>[
          Card(
              //pembanding google drive
              color: (position == 1) ? Colors.red : Colors.white,
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
                            setState(() {});
                            setState(() {
                              position = (position == 1) ? 0 : 1;
                            });
                            await setSound(
                                'https://drive.google.com/uc?export=view&id=13GxEiSMv_ss9C5a-70B8kdDPEjUuAGzf',
                                position);
                          },
                          color: Colors.green,
                          icon:
                              Icon(position == 1 ? Icons.minimize : Icons.add))
                    ],
                  ),
                ),
              )),
          Card(
              color: (position == 2) ? Colors.red : Colors.white,
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
                            setState(() {});
                            setState(() {
                              position = (position == 2) ? 0 : 2;
                            });
                            await setSound(
                                'https://drive.google.com/uc?export=view&id=1x38u1aINm-rQrZSD-Fb6VsMRAtPjIPse',
                                position);
                          },
                          color: Colors.green,
                          icon:
                              Icon(position == 2 ? Icons.minimize : Icons.add))
                    ],
                  ),
                ),
              )),
          Card(
              color: (position == 3) ? Colors.red : Colors.white,
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
                            setState(() {});
                            setState(() {
                              position = (position == 3) ? 0 : 3;
                            });
                            await setSound(
                                'https://drive.google.com/uc?export=view&id=1MPSoQz4oOhRK0BAa2wvVTe3unZQSBfJL',
                                position);
                          },
                          color: Colors.green,
                          icon:
                              Icon(position == 3 ? Icons.minimize : Icons.add))
                    ],
                  ),
                ),
              )),
          Card(
              color: (position == 4) ? Colors.red : Colors.white,
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
                            setState(() {});
                            setState(() {
                              position = (position == 4) ? 0 : 4;
                            });
                            await setSound(
                                'https://drive.google.com/uc?export=view&id=1vhgHylgbPjSUySK0_cyixK8Anidpl26K',
                                position);
                          },
                          color: Colors.green,
                          icon:
                              Icon(position == 4 ? Icons.minimize : Icons.add))
                    ],
                  ),
                ),
              )),
          Card(
              color: (position == 5) ? Colors.red : Colors.white,
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
                            setState(() {});
                            setState(() {
                              position = (position == 5) ? 0 : 5;
                            });
                            await setSound(
                                'https://drive.google.com/uc?export=view&id=1VJ9w1xLFufKKBrboiTIMsD8QWoEH20Hf',
                                position);
                          },
                          color: Colors.green,
                          icon:
                              Icon(position == 5 ? Icons.minimize : Icons.add))
                    ],
                  ),
                ),
              )),
          Card(
              color: (position == 6) ? Colors.red : Colors.white,
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
                            setState(() {});
                            setState(() {
                              position = (position == 6) ? 0 : 6;
                            });
                            await setSound(
                                'https://drive.google.com/uc?export=view&id=12-0aJM7lbXPRTMUPrIZluaJJNHKG7spu',
                                position);
                          },
                          color: Colors.green,
                          icon:
                              Icon(position == 6 ? Icons.minimize : Icons.add))
                    ],
                  ),
                ),
              )),
          Card(
              color: (position == 7) ? Colors.red : Colors.white,
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
                            setState(() {});
                            setState(() {
                              position = (position == 7) ? 0 : 7;
                            });
                            await setSound(
                                'https://drive.google.com/uc?export=view&id=1ThE1zGu9eMKhRB4YJWmTPpJSTfjFqeLi',
                                position);
                          },
                          color: Colors.green,
                          icon:
                              Icon(position == 7 ? Icons.minimize : Icons.add))
                    ],
                  ),
                ),
              )),
          Card(
              color: (position == 8) ? Colors.red : Colors.white,
              child: ListTile(
                title: Text("Bell"),
                onLongPress: () {},
                subtitle: Text("Bell sound effect"),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/bell.png'),
                ),
                trailing: Container(
                  width: 100,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                          onPressed: () async {
                            await player.setUrl(
                                'https://drive.google.com/uc?export=view&id=1oJzPy7vkgkV8PoXEsKFzp84qFVUE26GT');

                            player.play();
                          },
                          color: Colors.blue,
                          icon: Icon(Icons.play_arrow)),
                      IconButton(
                          onPressed: () async {
                            setState(() {});
                            setState(() {
                              position = (position == 8) ? 0 : 8;
                            });
                            await setSound(
                                'https://drive.google.com/uc?export=view&id=1oJzPy7vkgkV8PoXEsKFzp84qFVUE26GT',
                                position);
                          },
                          color: Colors.green,
                          icon:
                              Icon(position == 8 ? Icons.minimize : Icons.add))
                    ],
                  ),
                ),
              )),
          Card(
              color: (position == 9) ? Colors.red : Colors.white,
              child: ListTile(
                title: Text("Game"),
                onLongPress: () {},
                subtitle: Text("Game Sound Effect"),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/among-us.jpeg'),
                ),
                trailing: Container(
                  width: 100,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                          onPressed: () async {
                            await player.setUrl(
                                'https://drive.google.com/uc?export=view&id=1kqHySpE8G_mKkjrlaH-xHykp4vZM0IDy');

                            player.play();
                          },
                          color: Colors.blue,
                          icon: Icon(Icons.play_arrow)),
                      IconButton(
                          onPressed: () async {
                            setState(() {});
                            setState(() {
                              position = (position == 9) ? 0 : 9;
                            });
                            await setSound(
                                'https://drive.google.com/uc?export=view&id=1kqHySpE8G_mKkjrlaH-xHykp4vZM0IDy',
                                position);
                          },
                          color: Colors.green,
                          icon:
                              Icon(position == 9 ? Icons.minimize : Icons.add))
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
