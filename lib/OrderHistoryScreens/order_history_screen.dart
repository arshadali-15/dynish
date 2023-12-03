import 'package:demo_flutter/Constants/images.dart';
import 'package:demo_flutter/Widgets/order_card.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../Constants/custom_colors.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: CustomColors.lightGrey,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Container(
                height: 13.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                  color: CustomColors.orange,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 25.w,
                      height:8.h,
                      child: CircleAvatar(
                        child: Image.asset(Images.orderProfileImg),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Snack City',
                          style: TextStyle(
                            color: CustomColors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.sp,
                          ),
                        ),
                        Text(
                          'Proddatur Branch',
                          style: TextStyle(
                            color: CustomColors.white,
                            fontSize: 15.sp,
                          ),
                        ),
                        Transform.scale(
                          scaleY: 0.7,
                          scaleX: 0.8,
                          child: Switch(
                            activeColor: CustomColors.orange,
                            activeTrackColor: CustomColors.black,
                            inactiveThumbColor: CustomColors.darkGrey,
                            inactiveTrackColor: CustomColors.grey,
                            splashRadius: 50.0,
                            value: true,
                            onChanged: (value) {
                              // setState(() {
                              //   _canPark = value;
                              // });
                            },
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.only(right: 4.w),
                      child: CircleAvatar(
                        child: Image.asset(Images.greyCircle),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                "Order History",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
              ),
            ),
            Container(
              height: 5.h,
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  typeOfOrder('All'),
                  typeOfOrder('Running Orders'),
                  typeOfOrder('Completed Orders'),
                  typeOfOrder('Order Requests'),

                  // Add more items as needed
                ],
              ),
            ),
            SizedBox(height: 1.h,),
            Container(
              child: TabBar(
                  labelColor: CustomColors.orange,
                  indicatorColor: CustomColors.orange,
                  labelStyle: TextStyle(fontSize: 16.sp),
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                Tab(
                  text: 'All',
                ),
                Tab(
                  text: 'Dine-in',
                ),
                Tab(
                  text: 'Pick-up',
                ),
              ]),
            ),
           Expanded(
             child: TabBarView(
               children:[
                 ListView(
                   children: [
                     OrderCard(hour: "9", mins: "12"),
                     OrderCard(hour : "17", mins :"12"),
                     OrderCard(hour: "23", mins: "12"),
                   ],
                 ),
                 Center(child: Text("DINE IN TAB")),
                 Center(child: Text("PICK_UP TAB")),
               ]
             ),
           )

          ],
        ),
      ),
    );
  }
}

Widget typeOfOrder(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 3.0),
    child: Container(
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.asset(Images.greyCircle),
              SizedBox(
                width: 2.w,
              ),
              Text(
                text,
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
