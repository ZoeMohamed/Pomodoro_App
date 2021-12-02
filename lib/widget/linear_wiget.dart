import 'package:flutter/material.dart';
import 'package:timer/screens/music.dart';
import 'package:timer/screens/about_page.dart';

const double buttonSize = 55;

class LinearWidget extends StatefulWidget {
  @override
  _LinearWidgetState createState() => _LinearWidgetState();
}

class _LinearWidgetState extends State<LinearWidget>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  bool check_icon = true;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: FlowMenuDelegate(controller: controller),
      children: [
        SizedBox(
          width: buttonSize,
          height: buttonSize,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MusicChange();
              }));
            },
            child: const Icon(Icons.music_note),
            backgroundColor: Colors.green,
          ),
        ),
        SizedBox(
          width: buttonSize,
          height: buttonSize,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ProfilePage();
              }));
            },
            child: const Icon(Icons.info),
            backgroundColor: Colors.blueAccent,
          ),
        ),
        SizedBox(
          width: buttonSize,
          height: buttonSize,
          child: FloatingActionButton(
            onPressed: () {
              setState(() {});
              check_icon = !check_icon;
              print(check_icon);
              if (controller.status == AnimationStatus.completed) {
                controller.reverse();
              } else {
                controller.forward();
              }
            },
            child: Icon(check_icon == true ? Icons.menu : Icons.cancel),
            backgroundColor: Colors.red,
          ),
        ),
      ],
    );
  }
}

class FlowMenuDelegate extends FlowDelegate {
  final Animation<double> controller;
  const FlowMenuDelegate({this.controller}) : super(repaint: controller);
  @override
  void paintChildren(FlowPaintingContext context) {
    final size = context.size;
    final xStart = size.width - buttonSize;
    final yStart = size.height - buttonSize;
    for (int i = 0; i < context.childCount; i++) {
      final margin = 10;
      final childSize = context.getChildSize(i).width;
      final dx = (childSize + margin) * i;
      final x = xStart - dx * controller.value;
      final y = yStart;
      context.paintChild(i, transform: Matrix4.translationValues(x, y, 0));
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    return true;
  }
}
