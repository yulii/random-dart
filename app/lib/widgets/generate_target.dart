import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class Target {
  int min;
  int max;

  Target(this.min, this.max);

  int generate() {
    return Random().nextInt(max - min + 1) + 1;
  }
}

class GenerateTarget extends StatefulWidget {
  const GenerateTarget({Key? key}) : super(key: key);

  @override
  State<GenerateTarget> createState() => GenerateTargetState();
}

class GenerateTargetState extends State<GenerateTarget> {
  final formKey = GlobalKey<FormState>();
  final _minController = TextEditingController();
  final _maxController = TextEditingController();

  Target getFormValues() {
    var min = int.tryParse(_minController.text);
    var max = int.tryParse(_maxController.text);
    return Target(min ?? 1, max ?? 100);
  }

  @override
  void dispose() {
    _minController.dispose();
    _maxController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Text('Min'),
          ),
          Container(
            width: 60,
            child: TextFormField(
              controller: _minController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(4),
              ],
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 6,
                ),
                isDense: true,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Text('Max'),
          ),
          Container(
            width: 60,
            child: TextFormField(
              controller: _maxController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(4),
              ],
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 6,
                ),
                isDense: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
