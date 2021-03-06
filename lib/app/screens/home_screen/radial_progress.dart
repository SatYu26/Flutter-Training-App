import 'package:TSWEarn/app/providers/local_state.dart';
import 'package:TSWEarn/app/providers/pedometer_steps_provider.dart';
import 'package:TSWEarn/app/providers/levels_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vector_math/vector_math_64.dart' as math;
import 'package:shared_preferences/shared_preferences.dart';

class RadialProgress extends StatefulWidget {
  final double goalCompleted = 0.8;

  final int totalActivity;
  RadialProgress({@required this.totalActivity});

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  AnimationController _radialProgressAnimationController;
  Animation<double> _progressAnimation;
  final Duration fadeInDuration = Duration(milliseconds: 500);
  final Duration fillDuration = Duration(seconds: 2);

  double progressDegrees = 0;
  var count = 0;
  var coinCounter = 0;
  var levelCounter = 0;
  var level = 0;

  @override
  void initState() {
    super.initState();
    _radialProgressAnimationController =
        AnimationController(vsync: this, duration: fillDuration);
    _progressAnimation = Tween(begin: 0.0, end: 360.0).animate(CurvedAnimation(
        parent: _radialProgressAnimationController, curve: Curves.easeIn))
      ..addListener(() {
        setState(() {
          progressDegrees = widget.goalCompleted * _progressAnimation.value;
        });
      });

    _radialProgressAnimationController.forward();

    final steps = Provider.of<PedometerStepsProvider>(context, listen: false);
    final localStates = Provider.of<LocalState>(context, listen: false);
    localStates.shakeHands();
    //steps.startListening();
    steps.setUpPedometer();
    localStates.loadTapsFromSharedPrefs();
    localStates.loadShakedFromSharedPrefs();
    // steps.loadStepsFromSharedPrefs();
  }

  @override
  void dispose() {
    _radialProgressAnimationController.dispose();
    final localStates = Provider.of<LocalState>(context, listen: false);
    localStates.disposeDetector();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localStates = Provider.of<LocalState>(context);
    final steps = Provider.of<PedometerStepsProvider>(context);
    steps.getBurnedRun(steps.steps);
    level = Provider.of<LevelProvider>(context, listen: true).level;
    Provider.of<LevelProvider>(context, listen: true).addListener(() {
      level = Provider.of<LevelProvider>(context, listen: false).level;
    });

    return CustomPaint(
      child: Container(
        height: 170.0,
        width: 170.0,
        decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.circular(100)),
        padding: EdgeInsets.only(top: 30),
        child: AnimatedOpacity(
          opacity: progressDegrees > 30 ? 1.0 : 0.0,
          duration: fadeInDuration,
          child: Column(
            children: <Widget>[
              Text(
                'Level ${level}',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Color(0xFF4D59DE),
                ),
              ),
              Text(
                '$coinCounter', // HERE
                style: TextStyle(
                  fontSize: 45.0,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF4D59DE),
                ),
              ),
              Text(
                'Total Activity',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Color(0xFF4D59DE),
                ),
              ),
              Text(
                '${widget.totalActivity}',
                style: TextStyle(
                  fontSize: 17.0,
                  color: Color(0xFF4D59DE),
                ),
              ),
            ],
          ),
        ),
      ),
      painter: RadialPainter(progressDegrees),
    );
  }
}

class RadialPainter extends CustomPainter {
  double progressInDegrees;

  RadialPainter(this.progressInDegrees);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 30.0;

    Offset center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, size.width / 2, paint);

    Paint progressPaint = Paint()
      ..shader = LinearGradient(colors: [Colors.purpleAccent, Colors.blue])
          .createShader(Rect.fromCircle(center: center, radius: size.width / 2))
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 30.0;

    canvas.drawArc(
        Rect.fromCircle(center: center, radius: size.width / 2),
        math.radians(-90),
        math.radians(progressInDegrees),
        false,
        progressPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
