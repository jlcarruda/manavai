import 'package:ManaVai/pages/home.dart';
import 'package:ManaVai/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './config.dart';

class ManaVai extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ManaVaiState();
  }
}

class _ManaVaiState extends State<ManaVai> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return new MaterialApp(
      title: kAppTitle,
      debugShowCheckedModeBanner: false,
      theme: _buildThemeDark(),
      home: new Login(),
    );
  }

  ThemeData _buildThemeLight () {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      primaryIconTheme: base.iconTheme.copyWith(color: kMVTextColor),
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme, kMVTextColor),
      bottomAppBarColor: kMVBottomAppBar,
      buttonColor: kMVBottomAppBar,
      accentColor: kMVPrimaryColor,
      textSelectionColor: kMVDetail,
      textSelectionHandleColor: kMVDetail,
      scaffoldBackgroundColor: kMVScaffoldBackground,
      cardColor: Colors.white,
      textTheme: _buildTextTheme(base.textTheme, kMVTextColor),
      accentTextTheme: _buildTextTheme(base.accentTextTheme, kMVTextColor),
      buttonTheme: new ButtonThemeData(
        textTheme: ButtonTextTheme.accent
      )
    );
  }

  ThemeData _buildThemeDark () {
    final ThemeData base = ThemeData.dark();
    return base.copyWith(
        primaryIconTheme: base.iconTheme.copyWith(color: kMVTextColorDark),
        primaryTextTheme: _buildTextTheme(base.primaryTextTheme, kMVTextColorDark),
//      primaryColor: kMVScaffoldBackground,
        bottomAppBarColor: kMVBottomAppBarDark,
        buttonColor: kMVBottomAppBarDark,
        accentColor: kMVDetailDark,
        textSelectionColor: kMVDetailDark2,
        textSelectionHandleColor: kMVDetailDark2,
        scaffoldBackgroundColor: kMVScaffoldBackgroundDark,
        cardColor: Colors.white,
        textTheme: _buildTextTheme(base.textTheme, kMVTextColorDark),
        accentTextTheme: _buildTextTheme(base.accentTextTheme, kMVTextColorDark),
        buttonTheme: new ButtonThemeData(
            textTheme: ButtonTextTheme.accent
        )
    );
  }

  TextTheme _buildTextTheme(TextTheme base, Color color) {
    return base.copyWith(
      title: base.title.copyWith(fontSize: 18.0),
      headline: base.headline.copyWith(
        fontWeight: FontWeight.w500
      ),
      caption: base.caption.copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.w400
      )
    ).apply(
      fontFamily: 'Rubik',
      displayColor: color,
      bodyColor: color
    );
  }
}
