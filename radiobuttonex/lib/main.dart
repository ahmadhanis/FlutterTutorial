import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SharedPreferences prefs;
  int _radioValue = 0;
  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
      switch (_radioValue) {
        case 0:
          break;
        case 1:
          break;
        case 2:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: Column(
              children: [
                Text("Option 0"),
                new Radio(
                  value: 0,
                  groupValue: _radioValue,
                  onChanged: _handleRadioValueChange,
                ),
                Text("Option 1"),
                new Radio(
                  value: 1,
                  groupValue: _radioValue,
                  onChanged: _handleRadioValueChange,
                ),
                Text("Option 2"),
                new Radio(
                  value: 2,
                  groupValue: _radioValue,
                  onChanged: _handleRadioValueChange,
                ),
                ElevatedButton(
                  onPressed: onsafePref,
                  child: Text("Save Selected Pref"),
                ),
                ElevatedButton(
                  onPressed: onloadPref,
                  child: Text("Load Selected Pref"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onsafePref() async {
    prefs = await SharedPreferences.getInstance();
    await prefs.setInt("radioval", _radioValue);
    Fluttertoast.showToast(
        msg: "Radio Value $_radioValue stored",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Color.fromRGBO(191, 30, 46, 50),
        textColor: Colors.white,
        fontSize: 16.0);
  }

  Future<void> onloadPref() async {
    prefs = await SharedPreferences.getInstance();
    var prefval = prefs.getInt("radioval");
    if (prefval == null) {
      _radioValue = 1;
    } else {
      _radioValue = prefval;
      Fluttertoast.showToast(
          msg: "Radio Value $_radioValue loaded",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromRGBO(191, 30, 46, 50),
          textColor: Colors.white,
          fontSize: 16.0);
    }
    setState(() {});
  }
}
