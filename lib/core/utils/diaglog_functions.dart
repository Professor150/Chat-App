import 'dart:io';

import 'package:chat/core/constants/constants.dart';
import 'package:flutter/material.dart';

Future<bool> onBackPress(BuildContext context) {
  openDialog(context);
  return Future.value(false);
}

Future<void> openDialog(BuildContext context) async {
  switch (await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          contentPadding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              color: AppColors.backgroundColor,
              padding: const EdgeInsets.only(bottom: 10, top: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: const Icon(
                      Icons.exit_to_app,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'Exit app',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Are you sure to exit app?',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context, 0);
                  },
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: const Icon(
                          Icons.cancel,
                          color: AppColors.backgroundColor,
                        ),
                      ),
                      const Text(
                        'Cancel',
                        style: TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context, 1);
                  },
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: const Icon(
                          Icons.check_circle,
                          color: AppColors.backgroundColor,
                        ),
                      ),
                      const Text(
                        'Yes',
                        style: TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        );
      })) {
    case 0:
      break;
    case 1:
      exit(0);
  }
}
