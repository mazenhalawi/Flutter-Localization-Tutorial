import 'package:flutter/material.dart';
import 'package:localization/app_localizations.dart';
import 'package:localization/ext_strings.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  Text(AppLocalizations.of(context).translate('hello')),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              //The below text is translated using extension
              Row(
                children: [
                  Text('how are you?'.translate(context)),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'This text can not be translated. Try to switch from English to Arabic in Settings then open the app again to check.'
                          .translate(context),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
