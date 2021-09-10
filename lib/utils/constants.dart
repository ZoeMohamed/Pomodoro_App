import 'package:flutter/material.dart';
import 'package:timer/model/pomodoro_status.dart';

const pomodoroTotalTime = 5;
const shortBreakTime = 3;
const longBreakTime = 6;
const pomodoroPerSet = 4;

const Map<PomodoroStatus, String> statusDescription = {
  PomodoroStatus.runingPomodoro: 'Pomodoro is running time to be focused',
  PomodoroStatus.pausedPomodoro: 'Ready for a focused Pomodoro?',
  PomodoroStatus.runningShortBreak: 'Short break running time to relax',
  PomodoroStatus.pausedShortBreak: 'Let\'s have a short break?',
  PomodoroStatus.runningLongBreak: 'Long break running, time to relax',
  PomodoroStatus.pausedLongBreak: 'Let\'s have a long break?',
  PomodoroStatus.setFinished:
      'Congrats you deserve a long break, ready to start?'
};

const Map<PomodoroStatus, MaterialColor> statusColor = {
  PomodoroStatus.runingPomodoro: Colors.green,
  PomodoroStatus.pausedPomodoro: Colors.orange,
  PomodoroStatus.runningShortBreak: Colors.red,
  PomodoroStatus.pausedShortBreak: Colors.orange,
  PomodoroStatus.runningLongBreak: Colors.red,
  PomodoroStatus.pausedLongBreak: Colors.orange,
  PomodoroStatus.setFinished: Colors.orange
};
