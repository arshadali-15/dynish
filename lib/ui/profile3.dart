import 'package:demo_flutter/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:demo_flutter/Constants/custom_colors.dart';

import 'package:demo_flutter/Widgets/profile3_list.dart';

class Profile3 extends StatelessWidget {
  const Profile3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          backgroundColor: CustomColors.white,
          expandedHeight:10.h,
          title: Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Text(
              'Profile',
              style: TextStyle(color: CustomColors.black),
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.fromLTRB(20, 18, 0, 0),
            child: InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.asset('assets/images/ic_back.png')),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            height: 35.h,
            width: 85.w,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 5,
              shadowColor: CustomColors.orange,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          child: Image.asset(
                            "assets/images/profilePic.png",
                          ),
                          backgroundColor: CustomColors.white,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Snack City",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("Proddatur Branch"),
                          ],
                        ),
                        Image.asset(
                          "assets/images/squares.png",
                        ),
                        Text("#Cheff-3"),
                      ],
                    ),

                    // ORANGE CONTAINER

                    Container(
                      width: 90.w,
                      height:20.h,
                      decoration: BoxDecoration(
                          color: CustomColors.orange,
                          borderRadius: BorderRadius.circular(25)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width:10.w,
                                    height: 10.h,
                                    child: CircleAvatar(
                                      backgroundColor: CustomColors.orange,
                                      child: Image.asset(
                                          "assets/images/profilePic.png"),
                                    ),
                                  ),
                                ],
                              ),
                              ///////////// Name Column
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Vishal Khadok",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.sp,
                                          color: CustomColors.white),
                                    ),
                                    Text(
                                      "mailer@gmail.com",
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          color: CustomColors.white),
                                    ),
                                    Text(
                                      "+9195343242423",
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          color: CustomColors.white),
                                    ),
                                  ],
                                ),
                              ),

                              /////  Icon Column
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset("assets/images/ic_edit.png"),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "4.5",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      Image.asset("assets/images/star.png"),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  decoration: BoxDecoration(
                                      color: CustomColors.white,
                                      borderRadius: BorderRadius.circular(25)),
                                  width: 60.w,
                                  height:3.h,
                                  child: Row(
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          text: "Available Balance :",
                                          style: TextStyle(
                                              color: CustomColors.darkGrey),
                                          children: const <TextSpan>[
                                            TextSpan(
                                                text: " \$500.00",
                                                style: TextStyle(
                                                  color: Color(0xFFFFC529),
                                                  fontWeight: FontWeight.bold,
                                                ))
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: CustomColors.grey,
                                      borderRadius: BorderRadius.circular(25)),
                                  width: 20.w,
                                  height: 3.h,
                                  child: Text(
                                    "Withdraw",
                                    style: TextStyle(color: CustomColors.white),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.only(top: 25, bottom: 20),
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            width: 90.w,
            height: 10.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "WITHDRAW HISTORY:",
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Sen'),
                ),
                Image.asset("assets/images/bank.png"),
              ],
            ),
          ),
        ),
        SliverList(
          // delegate: Profile3List(),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Profile3List();
            },
            childCount: 10,
          ),
        ),
      ],
    ));
  }
}
