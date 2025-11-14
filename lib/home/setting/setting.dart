import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_color.dart';
import '../../app_config_provider.dart';
import '../../l10n/app_localizations.dart';
import 'language_bottom_sheet.dart';
class Setting extends StatefulWidget {
  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {

  late AppConfigProvider appProvider;
  @override
  Widget build(BuildContext context) {
    appProvider=Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
          vertical: MediaQuery.of(context).size.height * 0.04),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            Text(AppLocalizations.of(context)!.language,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: AppColors.primaryColor)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            InkWell(
              onTap: () {
                showLanguageBottomSheet(context);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColors.primaryColor,
                    width: 2,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      appProvider.language  == "en"
                          ? AppLocalizations.of(context)!.english
                          : appProvider.language  == "ar"
                          ? AppLocalizations.of(context)!.arabic
                          : AppLocalizations.of(context)!.french,
                      style: TextStyle(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      size: 30,
                      color: AppColors.primaryColor,
                    )
                  ],
                ),
              ),
            ),
          ]),
    );
  }

  void showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: AppColors.whiteColor,
        clipBehavior: Clip.antiAlias,
        builder: (context) => LanguageBottomSheet()
    );
  }
}
