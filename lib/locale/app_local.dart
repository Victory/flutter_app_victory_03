import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'messages_all.dart';

class AppLocal {
  AppLocal(this.localeName);

  static Future<AppLocal> load(Locale locale) {
    final String name = locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((_) {
      return AppLocal(localeName);
    });
  }

  static AppLocal of(BuildContext context) {
    return Localizations.of<AppLocal>(context, AppLocal);
  }

  final String localeName;

  String get title {
    return Intl.message(
      'The Way Way Out',
      name: 'title',
      desc: 'Title for the application',
      locale: localeName,
    );
  }
}

class AppLocalDelegate extends LocalizationsDelegate<AppLocal> {
  const AppLocalDelegate();

  @override
  bool isSupported(Locale locale) => ['en'].contains(locale.languageCode);

  @override
  Future<AppLocal> load(Locale locale) => AppLocal.load(locale);

  @override
  bool shouldReload(AppLocalDelegate old) => false;
}

/*
class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(DemoLocalizations.of(context).title),
      ),
      body: Center(
        child: Text(DemoLocalizations.of(context).title),
      ),
    );
  }
}
 */