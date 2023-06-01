import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class NetworkController extends ChangeNotifier {
  final Connectivity _connectivity = Connectivity();

  late BuildContext context;

  NetworkController() {
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      final snackBar = SnackBar(
        content: const Text(
          'PLEASE CONNECT TO THE INTERNET',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        duration: const Duration(days: 1),
        backgroundColor: Colors.red[400],
        behavior: SnackBarBehavior.fixed,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        padding: EdgeInsets.zero,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
    }
  }
}
