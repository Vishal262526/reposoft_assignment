import 'package:assignment/core/enums/fonts_enum.dart';
import 'package:assignment/core/theme/colors.dart';
import 'package:assignment/core/widgets/button.dart';
import 'package:assignment/core/widgets/custom_text.dart';
import 'package:assignment/core/widgets/option_tile.dart';
import 'package:assignment/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

enum LocationEnum { current, recipients }

class HomeView extends StatelessWidget {
  static route() => MaterialPageRoute(builder: (context) => HomeView());

  HomeView({super.key});

  final _authServices = Get.find<AuthServices>();
  final selected = LocationEnum.current;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const CustomText(
            text: "Select Courier",
            fontFamily: CustomFontFamily.supermercadoOne,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {
                _authServices.signOut();
              },
              icon: const Icon(
                Icons.logout_outlined,
              ),
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 30.r,
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  "assets/images/map.png",
                  // fit: BoxFit.cover,
                  height: double.infinity,
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 40.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20.r),
                      margin: EdgeInsets.all(20.r),
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(19.r),
                        color: kWhiteColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Where it is going ?",
                            fontFamily: CustomFontFamily.supermercadoOne,
                            style: TextStyle(fontSize: 22.sp),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          OptionTile(
                            label: "Current Location",
                            value: LocationEnum.current,
                            selectedValue: selected,
                            onChange: (value) {},
                          ),
                          OptionTile(
                            label: "Choose recipients location",
                            value: LocationEnum.recipients,
                            selectedValue: selected,
                            onChange: (value) {},
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.r,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.r),
                      child: Button(
                        onTap: () {},
                        text: "Continue",
                        hasFullWidth: true,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
