import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';

class StepsCount extends StatefulWidget {
  const StepsCount({super.key});

  @override
  State<StepsCount> createState() => _StepsCountState();
}

class _StepsCountState extends State<StepsCount> {
  String _stepCountValue = '0';
  String totalCount = "0";
  late Stream<StepCount> stepCountStream;
  Pedometer pedometer = Pedometer();
  // StepCount? stepCount;

  @override
  void initState() {
    super.initState();
    _startListening();
  }

  void _startListening() {
    pedometer = Pedometer();
    totalCount = Pedometer.stepCountStream.toString();
    Pedometer.stepCountStream.listen((StepCount event) {
      setState(() {
        _stepCountValue = '${event.steps}';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Step Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'total Step Count: ',
            ),
            Text(
              'Step Count:',
            ),
            Text(
              '$_stepCountValue',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
