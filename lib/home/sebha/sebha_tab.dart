import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/my_theme.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

import 'sebha_rotation.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  List<String> words = ['لا اله الا الله', 'الحمد الله', 'سبحان الله'];
  int index = 0;

  double turns = 0.0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    int track = 0;
    return Column(
      children: [
        InkWell(
            onTap: () {
              counter++;
              changeWord();
              setState(() => turns += 1 / 8);
            },
            child: provider.isDarkMode()
                ? SebhaRotation(
                    imagePath: 'assets/images/sebha_logo_dark.png',
                    turns: turns,
                  )
                : SebhaRotation(
                    imagePath: 'assets/images/sebha_logo.png',
                    turns: turns,
                  )),
        SizedBox(
          height: 70,
        ),
        Text(
          AppLocalizations.of(context)!.number_of_tasbehat,
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Theme.of(context).primaryColor,
          ),
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: Text('${counter}',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelSmall),
        ),
        SizedBox(
          height: 40,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          decoration: provider.isDarkMode()
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: MyTheme.yellowColor,
                )
              : BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Theme.of(context).primaryColor,
                ),
          child: Text(
            words[index],
            style: Theme.of(context).textTheme.labelMedium,
          ),
        )
      ],
    );
  }

  void changeWord() {
    if (counter % 33 == 0) {
      index++;
    }
    if (counter == 99) {
      index = 0;
    }
  }
}
