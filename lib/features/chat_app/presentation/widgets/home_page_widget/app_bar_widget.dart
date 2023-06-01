import 'package:chat/features/chat_app/data/models/popup_choices.dart';
import 'package:chat/features/chat_app/presentation/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:chat/core/constants/constants.dart';
import 'package:provider/provider.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({super.key});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  late final AuthProvider authProvider = context.read<AuthProvider>();
  final List<PopupChoices> choices = <PopupChoices>[
    const PopupChoices(title: 'Settings', icon: Icons.settings),
    const PopupChoices(title: 'Log out', icon: Icons.exit_to_app),
  ];
  void onItemMenuPress(PopupChoices choice) {
    if (choice.title == 'Log out') {
      authProvider.handleSignOut(context);
    } else {
      Navigator.pushNamed(context, '/settingsPage');
    }
  }

  Widget build(BuildContext context) {
    return Container(
      height: fullHeight(context) * 0.1,
      width: fullWidth(context),
      color: AppColors.backgroundColor,
      child: Padding(
        padding: edgeInsetsAll(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              ImagePath.vurilo,
            ),
            const Spacer(),
            const Text(
              'Recent Chat',
              style: TextStyle(fontSize: 20),
            ),
            const Spacer(),
            const SizedBox(
              width: 4,
            ),
            buildPopUp(context)
          ],
        ),
      ),
    );
  }

  Widget buildPopUp(BuildContext context) {
    return PopupMenuButton<PopupChoices>(
      onSelected: onItemMenuPress,
      itemBuilder: (BuildContext context) {
        return choices.map((PopupChoices choice) {
          return PopupMenuItem<PopupChoices>(
              value: choice,
              child: Row(
                children: <Widget>[
                  Icon(
                    choice.icon,
                    color: AppColors.backgroundColor,
                  ),
                  Container(
                    width: 10,
                  ),
                  Text(
                    choice.title,
                    style: const TextStyle(color: AppColors.textColor),
                  ),
                ],
              ));
        }).toList();
      },
    );
  }
}
