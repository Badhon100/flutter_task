import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/bloc/bottom_naigation_bar_bloc/bottom_navigation_bar_bloc.dart';
import 'package:flutter_task/presentaion/constant/color_const.dart';
import 'package:flutter_task/presentaion/constant/image_const.dart';
import 'package:flutter_task/presentaion/constant/nav_bar_items.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBarScreen extends StatelessWidget {
  const BottomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BlocConsumer<BottomNavigationBloc, BottomNavigationState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: NavbarItems().pages[state.tabIndex],
            bottomNavigationBar: Theme(
              data: ThemeData(
                canvasColor:
                    ColorConst.white, // Set the background color here
              ),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                  ),
                ),
                height: height * 0.08,
                child: BottomNavigationBar(
                  currentIndex: state.tabIndex,
                  onTap: (index) {
                    BlocProvider.of<BottomNavigationBloc>(context)
                        .add(TabChanged(tabIndex: index));
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: (state.tabIndex != 0)
                          ? SvgPicture.asset(ImageConst.bariKoiMap)
                          : Container(
                              color: ColorConst.primaryColor,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  ImageConst.bariKoiMap,
                                  color: ColorConst.primaryLight,
                                ),
                              ),
                            ),
                      label: 'BariKoi Map',
                    ),
                    BottomNavigationBarItem(
                      icon: (state.tabIndex != 1)
                          ? SvgPicture.asset(ImageConst.saved)
                          : SvgPicture.asset(ImageConst.saved),
                      label: 'Saved',
                    ),
                  ],
                  showUnselectedLabels: true,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: ColorConst.white,
                  unselectedItemColor: ColorConst.primaryColor,
                  selectedLabelStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: ColorConst.white,
                      fontSize: 11),
                  unselectedLabelStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: ColorConst.primaryColor,
                      fontSize: 11),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
