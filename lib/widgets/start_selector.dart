import 'package:flutter/material.dart';
import 'package:flutterappvictory03/locale/app_local.dart';

class StartSelector extends StatefulWidget {
  @override
  _StartSelectorState createState() => _StartSelectorState();
}

class _StartSelectorState extends State<StartSelector> {
  var _pageReady = false;

  _getPage() async {
    setState(() {
      _pageReady = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    _getPage();

    return (!_pageReady)
        ? Container(child: CircularProgressIndicator())
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                Text(
                  AppLocal.of(context).title,
                  textAlign: TextAlign.center,
                ),
              ]);
  }
}
