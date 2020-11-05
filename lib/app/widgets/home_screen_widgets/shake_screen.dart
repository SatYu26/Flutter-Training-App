import 'package:TSWEarn/app/providers/local_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShakeScreen extends StatefulWidget {
  @override
  _ShakeScreenState createState() => _ShakeScreenState();
}

class _ShakeScreenState extends State<ShakeScreen> {
  @override
  void initState() {
    final localStates = Provider.of<LocalState>(context, listen: false);
    super.initState();
    //localStates.shakeHands();
    localStates.loadShakedFromSharedPrefs();
  }

  @override
  void dispose() {
    final localStates = Provider.of<LocalState>(context, listen: false);
    localStates.disposeDetector();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localState = Provider.of<LocalState>(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height * 0.07),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
                Spacer(),
                Text(
                  'Shake your phone',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                Spacer()
              ],
            ),
            Spacer(),
            Center(
              child: Text(
                '${localState.shaked}',
                style: TextStyle(
                  fontSize: 100,
                  color: Colors.white,
                ),
              ),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}