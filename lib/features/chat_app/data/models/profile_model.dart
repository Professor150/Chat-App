import 'package:flutter/foundation.dart';

class ProfileModel {
  final String name;
  final String email;

  ProfileModel({required this.name, required this.email});
}

class ProfileProvider with ChangeNotifier {
  ProfileModel? _profile;

  ProfileModel? get profile => _profile;

  void setProfile(ProfileModel profile) {
    _profile = profile;
    notifyListeners();
  }
}
