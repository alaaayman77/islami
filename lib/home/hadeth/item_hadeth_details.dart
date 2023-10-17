import 'package:flutter/material.dart';
import 'package:islami/home/quran/sura_details_screen.dart';
import 'package:islami/my_theme.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class ItemHadethDetails extends StatelessWidget {
  String content;

  ItemHadethDetails({required this.content});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return provider.isDarkMode()
        ? Text(
            content,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: MyTheme.yellowColor),
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
          )
        : Text(
            content,
            style: Theme.of(context).textTheme.titleSmall,
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
          );
  }
}
