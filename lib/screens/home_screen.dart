import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:timer/main.dart';
import 'package:timer/screens/music.dart';
import 'package:timer/widget/linear_wiget.dart';
import 'package:timer/utils/constants.dart';
import 'package:timer/widget/progress_icons.dart';
import 'package:timer/widget/custom_button.dart';
import 'package:timer/model/pomodoro_status.dart';
import 'dart:async';
import 'package:just_audio/just_audio.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakelock/wakelock.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

const _btnTextStart = "START POMODORO";
const _btnTextResumePomodoro = "RESUME POMODORO";
const _btnTextResumeBreak = "RESUME BREAK";
const _btnTextStartShortBreak = "TAKE A SHORT BREAK";
const _btnTextStartLongBreak = "TAKE A LONG BREAK";
const _btnTextStartNewSet = "START NEW SET";
const _btnTextPause = "PAUSE";
const _btnTextReset = "RESET";
GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

class _HomeState extends State<Home> {
  int remainingTime = pomodoroTotalTime;
  String mainBtnText = _btnTextStart;
  PomodoroStatus pomodoroStatus = PomodoroStatus.pausedPomodoro;
  Timer _timer;
  int PomodoroNum = 0;
  int setNum = 0;
  String url_music;

  getSound() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      url_music = prefs.getString('url_sound') ??
          'https://drive.google.com/uc?export=view&id=13GxEiSMv_ss9C5a-70B8kdDPEjUuAGzf';
    });
  }

  AudioPlayer player;
  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
  }

  @override
  void dispose() {
    _cancelTimer();
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Scaffold(
        backgroundColor: Colors.grey[900],
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(padding: const EdgeInsets.all(8.0)),
                Text(
                  'Pomodoro number : $PomodoroNum',
                  style: TextStyle(fontSize: 32, color: Colors.white),
                ),
                Padding(padding: const EdgeInsets.all(8.0)),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Set : $setNum',
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularPercentIndicator(
                        radius: 220.0,
                        lineWidth: 15.0,
                        percent: __getPomodoroPercentage(),
                        circularStrokeCap: CircularStrokeCap.round,
                        center: Text(
                          _secondsToFormatedString(remainingTime),
                          style: TextStyle(fontSize: 40, color: Colors.white),
                        ),
                        progressColor: statusColor[pomodoroStatus],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ProgressIcons(
                        total: pomodoroPerSet,
                        done: PomodoroNum - (setNum * pomodoroPerSet),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        statusDescription[pomodoroStatus],
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                        onTap: _mainButtonPressed,
                        text: mainBtnText,
                      ),
                      CustomButton(
                        onTap: _resetButtonPressed,
                        text: _btnTextReset,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: LinearWidget());
  }

  _secondsToFormatedString(int seconds) {
    int roundedMinutes = seconds ~/ 60;
    int remainingSeconds = seconds - (roundedMinutes * 60);
    String remainingSecondsFormated;
    if (remainingSeconds < 10) {
      remainingSecondsFormated = '0$remainingSeconds';
    } else {
      remainingSecondsFormated = remainingSeconds.toString();
    }
    return '$roundedMinutes:$remainingSecondsFormated';
  }

  __getPomodoroPercentage() {
    int totalTime;
    switch (pomodoroStatus) {
      case PomodoroStatus.runingPomodoro:
        totalTime = pomodoroTotalTime;
        break;
      case PomodoroStatus.pausedPomodoro:
        totalTime = pomodoroTotalTime;
        break;
      case PomodoroStatus.runningShortBreak:
        totalTime = shortBreakTime;
        break;
      case PomodoroStatus.pausedShortBreak:
        totalTime = shortBreakTime;
        break;
      case PomodoroStatus.runningLongBreak:
        totalTime = longBreakTime;
        break;
      case PomodoroStatus.pausedLongBreak:
        totalTime = longBreakTime;
        break;
      case PomodoroStatus.setFinished:
        totalTime = pomodoroTotalTime;
        break;
    }

    double percentage = (totalTime - remainingTime) / totalTime;
    return percentage;
  }

  _mainButtonPressed() {
    switch (pomodoroStatus) {
      case PomodoroStatus.pausedPomodoro:
        {
          _startPomodoroCountdown();
          getSound();
          break;
        }

      case PomodoroStatus.runingPomodoro:
        _pausePomodoroCountdown();
        break;
      case PomodoroStatus.runningShortBreak:
        _pauseShortBreakCountdown();
        break;
      case PomodoroStatus.pausedShortBreak:
        _startShortBreak();
        break;
      case PomodoroStatus.runningLongBreak:
        _pauseLongBreakCountdown();
        break;
      case PomodoroStatus.pausedLongBreak:
        _startLongBreak();
        break;
      case PomodoroStatus.setFinished:
        setNum++;
        _startPomodoroCountdown();
        break;
    }
  }

  _startPomodoroCountdown() {
    Wakelock.enable();

    pomodoroStatus = PomodoroStatus.runingPomodoro;
    _cancelTimer();

    _timer = Timer.periodic(
        Duration(seconds: 1),
        (timer) => {
              if (remainingTime > 0)
                {
                  setState(() {
                    remainingTime--;
                    mainBtnText = _btnTextPause;
                  })
                }
              else
                {
                  _playSound(),
                  PomodoroNum++,
                  _cancelTimer(),
                  if (PomodoroNum % pomodoroPerSet == 0)
                    {
                      pomodoroStatus = PomodoroStatus.pausedLongBreak,
                      setState(() {
                        remainingTime = longBreakTime;
                        mainBtnText = _btnTextStartLongBreak;
                      }),
                    }
                  else
                    {
                      pomodoroStatus = PomodoroStatus.pausedShortBreak,
                      setState(() {
                        remainingTime = shortBreakTime;
                        mainBtnText = _btnTextStartShortBreak;
                      }),
                    }
                }
            });
  }

  _startShortBreak() {
    Wakelock.enable();

    pomodoroStatus = PomodoroStatus.runningShortBreak;
    getSound();
    setState(() {
      mainBtnText = _btnTextPause;
    });
    _cancelTimer();
    _timer = Timer.periodic(
        Duration(seconds: 1),
        (timer) => {
              if (remainingTime > 0)
                {
                  setState(() {
                    remainingTime--;
                  }),
                }
              else
                {
                  _playSound(),
                  remainingTime = pomodoroTotalTime,
                  _cancelTimer(),
                  pomodoroStatus = PomodoroStatus.pausedPomodoro,
                  setState(() {
                    mainBtnText = _btnTextStart;
                  }),
                }
            });
  }

  _startLongBreak() {
    Wakelock.enable();

    pomodoroStatus = PomodoroStatus.runningLongBreak;
    getSound();
    setState(() {
      mainBtnText = _btnTextPause;
    });
    _cancelTimer();
    _timer = Timer.periodic(
        Duration(seconds: 1),
        (timer) => {
              if (remainingTime > 0)
                {
                  setState(() {
                    remainingTime--;
                  }),
                }
              else
                {
                  _playSound(),
                  remainingTime = pomodoroTotalTime,
                  _cancelTimer(),
                  pomodoroStatus = PomodoroStatus.setFinished,
                  setState(() {
                    mainBtnText = _btnTextStartNewSet;
                  }),
                }
            });
  }

  _pausePomodoroCountdown() {
    pomodoroStatus = PomodoroStatus.pausedPomodoro;
    _cancelTimer();
    setState(() {
      mainBtnText = _btnTextResumePomodoro;
    });
  }

  _resetButtonPressed() {
    PomodoroNum = 0;
    setNum = 0;
    _cancelTimer();
    _stopCountdown();
  }

  _stopCountdown() {
    pomodoroStatus = PomodoroStatus.pausedPomodoro;
    setState(() {
      mainBtnText = _btnTextStart;
      remainingTime = pomodoroTotalTime;
    });
  }

  _pauseShortBreakCountdown() {
    pomodoroStatus = PomodoroStatus.pausedShortBreak;
    _pauseBreakCountdown();
  }

  _pauseLongBreakCountdown() {
    pomodoroStatus = PomodoroStatus.pausedLongBreak;
    _pauseBreakCountdown();
  }

  _pauseBreakCountdown() {
    _cancelTimer() {
      setState(() {
        mainBtnText = _btnTextResumeBreak;
      });
    }
  }

  _cancelTimer() {
    if (_timer != null) {
      _timer.cancel();
      Wakelock.disable();
    }
  }

  _playSound() {
    player.setUrl(url_music);
    player.play();
  }
}
