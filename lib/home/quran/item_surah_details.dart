import 'package:flutter/material.dart';
import 'package:islami/my_theme.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class ItemSuraDetails extends StatelessWidget {
  String content;
  int index;

  ItemSuraDetails({required this.content, required this.index});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return provider.isDarkMode()
        ? Text(
            '$content {${index + 1}}',
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: MyTheme.yellowColor),
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
          )
        : Text(
            '$content {${index + 1}}',
            style: Theme.of(context).textTheme.titleSmall,
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
          );
  }
}
