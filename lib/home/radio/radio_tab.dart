import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
        ),
        Image.asset('assets/images/radio_logo.png'),
        SizedBox(
          height: 40,
        ),
        Text(
          AppLocalizations.of(context)!.holy_quran_radio,
          style: Theme.of(context).textTheme.labelSmall,
        ),
        SizedBox(
          height: 40,
        ),
        provider.isDarkMode()
            ? Image.asset('assets/images/radio_controls_dark.png')
            : Image.asset('assets/images/radio_controls.png')
      ],
    );
  }
}
