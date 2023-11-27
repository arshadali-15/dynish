import 'package:demo_flutter/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:demo_flutter/Constants/custom_colors.dart';
import 'package:demo_flutter/Widgets/reusable_card.dart';
import 'package:demo_flutter/Widgets/single_widget.dart';

class Profile2 extends StatelessWidget {
  const Profile2({super.key});

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
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 18, 30, 0),
              child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.asset('assets/images/ic_more.png')),
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            height:20.h,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 2,
              shadowColor: CustomColors.orange,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 5.h,
                          backgroundColor: Colors.white,
                          child: Image.asset("assets/images/profilePic.png"),
                        ),
                      ],
                    ),

                    Container(
                      height: 20.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "Vishal Khadok",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp,
                                  fontFamily: 'Sen'),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                            child: Text(
                              "+9195343242423",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: CustomColors.darkGrey),
                            ),
                          ),
                          Divider(
                            thickness: 2,
                            color: CustomColors.black,
                            endIndent: 5,
                            indent: 20.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                child: Text(
                                  "Account Details",
                                  style:
                                      TextStyle(fontSize: 15.sp, color: Colors.red),
                                ),
                              ),
                              Icon(
                                Icons.navigate_next,
                                color: Colors.red,
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
            child: Column(
          children: [
            SingleWidget(
                title: "Personal Info",
                image: "assets/images/personalInfo.png"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: SingleWidget(
                      title: "Chefs", image: "assets/images/orderHistory.png"),
                  width: 40.w,
                ),
                Container(
                  child: SingleWidget(
                      title: "Waiters",
                      image: "assets/images/orderHistory.png"),
                  width: 40.w,
                ),
              ],
            ),
            SingleWidget(
                title: "Order History",
                image: "assets/images/orderHistory.png"),
            ResuableCard(
                title: "Ad postings",
                title2: "Payments",
                image1: "assets/images/ad_postings.png",
                image2: "assets/images/payments.png"),
            ResuableCard(
                title: "Support 24/7",
                title2: "Settings",
                image1: "assets/images/support.png",
                image2: "assets/images/settings.png"),
            SingleWidget(title: "Log Out", image: "assets/images/logout.png")
          ],
        ))
      ],
    ));
  }
}
