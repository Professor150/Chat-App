import 'dart:ffi';

import 'package:chat/core/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = 'Pradeep Tharu';
  String profession = 'Mobile App Developer';
  String school = 'Kathmandu University';
  String email = 'pradeeptharu535@gmail.com';
  String phoneNumber = '+9779812345678';
  String facebook = 'Pradeep Tharu';
  bool isEditing = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController professionController = TextEditingController();
  TextEditingController schoolController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getUserProfile();
  }

  void getUserProfile() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      if (snapshot.exists) {
        setState(() {
          name = snapshot['name'];
          profession = snapshot['profession'];
          school = snapshot['school'];
          email = snapshot['email'];
          phoneNumber = snapshot['phoneNumber'];
          facebook = snapshot['facebook'];
        });
      }
    }
  }

  void updateUserProfile() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'name': name,
        'profession': profession,
        'school': school,
        'email': email,
        'phoneNumber': phoneNumber,
        'facebook': facebook,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                print('edit succesful');
                setState(() {
                  isEditing = !isEditing;
                });
                if (!isEditing) {
                  print('updateuserProfile');
                  updateUserProfile();
                }
              },
              icon: isEditing
                  ? const Icon(
                      Icons.done,
                      color: Colors.green,
                      size: 30,
                    )
                  : const Icon(
                      Icons.edit,
                      color: Colors.white,
                    )),
        ],
        title: normalText(text: 'Profile'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  color: AppColors.backgroundColor,
                ),
                height: fullHeight(context) * 0.4,
                width: fullWidth(context),
                child: Column(
                  children: [
                    SizedBox(
                      height: fullHeight(context) * 0.01,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      height: fullHeight(context) * 0.15,
                      width: fullWidth(context) * 0.3,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          ImagePath.profileImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: fullHeight(context) * 0.01,
                    ),
                    isEditing
                        ? Container(
                            height: fullHeight(context) * 0.05,
                            width: fullWidth(context) * 0.8,
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              controller: nameController,
                              onChanged: (value) {
                                setState(() {
                                  name = value;
                                });
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText: 'Name',
                              ),
                            ),
                          )
                        : normalText(
                            text: name,
                            color: Colors.white,
                            size: 18,
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.w500,
                          ),
                    SizedBox(
                      height: fullHeight(context) * 0.01,
                    ),
                    isEditing
                        ? Container(
                            height: fullHeight(context) * 0.05,
                            width: fullWidth(context) * 0.8,
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText: 'Profession',
                              ),
                              controller: professionController,
                              onChanged: (value) {
                                setState(() {
                                  profession = value;
                                });
                              },
                            ),
                          )
                        : normalText(
                            text: profession,
                            color: Colors.white,
                            size: 16,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.3,
                          ),
                    SizedBox(
                      height: fullHeight(context) * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        isEditing
                            ? Container(
                                height: fullHeight(context) * 0.05,
                                width: fullWidth(context) * 0.8,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      hintText: 'University'),
                                  controller: schoolController,
                                  onChanged: (value) {
                                    setState(() {
                                      school = value;
                                    });
                                  },
                                ),
                              )
                            : normalText(
                                text: school,
                                color: Colors.white,
                                size: 20,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1.3,
                              ),
                        isEditing
                            ? Container()
                            : const Icon(
                                Icons.school_rounded,
                                color: Colors.white,
                              ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: fullHeight(context) * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: fullWidth(context) * 0.02,
                    ),
                    const Icon(
                      Icons.email,
                      size: 25,
                    ),
                    SizedBox(
                      width: fullWidth(context) * 0.03,
                    ),
                    isEditing
                        ? Expanded(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Email',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  email = value;
                                });
                              },
                              initialValue: email,
                            ),
                          )
                        : normalText(text: 'Email \n$email'),
                  ],
                ),
              ),
              Divider(
                endIndent: fullWidth(context) * 0.05,
                indent: fullWidth(context) * 0.05,
                color: Colors.grey.shade400,
              ),
              SizedBox(
                height: fullHeight(context) * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: fullWidth(context) * 0.02,
                    ),
                    const Icon(
                      Icons.phone,
                      size: 25,
                    ),
                    SizedBox(
                      width: fullWidth(context) * 0.03,
                    ),
                    isEditing
                        ? Expanded(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Phone Number',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  phoneNumber = value;
                                });
                              },
                              initialValue: phoneNumber,
                            ),
                          )
                        : normalText(text: 'Phone Number \n$phoneNumber'),
                  ],
                ),
              ),
              Divider(
                endIndent: fullWidth(context) * 0.05,
                indent: fullWidth(context) * 0.05,
                color: Colors.grey.shade400,
              ),
              SizedBox(
                height: fullHeight(context) * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: fullWidth(context) * 0.02,
                    ),
                    const Icon(
                      Icons.person_2_rounded,
                      size: 25,
                    ),
                    SizedBox(
                      width: fullWidth(context) * 0.03,
                    ),
                    isEditing
                        ? Expanded(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Facebook',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  facebook = value;
                                });
                              },
                              initialValue: facebook,
                            ),
                          )
                        : normalText(text: 'Facebook \n$facebook'),
                  ],
                ),
              ),
              SizedBox(
                width: fullWidth(context) * 0.5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
