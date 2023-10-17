import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/home/hadeth/hadeth_tab.dart';
import 'package:islami/home/hadeth/item_hadeth_details.dart';
import 'package:islami/home/quran/item_surah_details.dart';
import 'package:islami/my_theme.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class HadethDetailsScreen extends StatefulWidget {
  static const String routeName = 'hadeth_details';

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;
    var provider = Provider.of<AppConfigProvider>(context);

    return Stack(
      children: [
        provider.isDarkMode()
            ? Image.asset(
                'assets/images/bg.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              )
            : Image.asset(
                'assets/images/main_background.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
        Scaffold(
          appBar: AppBar(
            title: provider.isDarkMode()
                ? Text(args.title,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: MyTheme.yellowColor))
                : Text(args.title,
                    style: Theme.of(context).textTheme.titleLarge),
          ),
          body: Container(
            padding: EdgeInsets.only(top: 30),
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: MediaQuery.of(context).size.height * 0.06),
            decoration: provider.isDarkMode()
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: MyTheme.primaryDark)
                : BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: MyTheme.whiteColor,
                  ),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ItemHadethDetails(content: args.content[index]);
              },
              itemCount: args.content.length,
            ),
          ),
        )
      ],
    );
  }
}
