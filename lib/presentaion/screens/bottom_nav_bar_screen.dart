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
            bottomNavigationBar: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0), // Adjust this value as needed
                topRight:
                    Radius.circular(20.0), // Adjust this value as needed
              ),
              child: BottomAppBar(
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: (state.tabIndex == 0)
                              ? ColorConst.primaryColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(5)),
                      child: IconButton(
                        icon: Column(
                          children: [
                            SvgPicture.asset(
                              ImageConst.bariKoiMap,
                              color: (state.tabIndex == 0)
                                  ? ColorConst.white
                                  : ColorConst.primaryLight,
                            ),
                            Text(
                              "Barikoi Map",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: (state.tabIndex == 0)
                                    ? ColorConst.white
                                    : ColorConst.primaryLight,
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {
                          BlocProvider.of<BottomNavigationBloc>(context)
                              .add(TabChanged(tabIndex: 0));
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: (state.tabIndex == 1)
                              ? ColorConst.primaryColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(5)),
                      child: IconButton(
                        icon: Column(
                          children: [
                            SvgPicture.asset(
                              ImageConst.saved,
                              color: (state.tabIndex == 1)
                                  ? ColorConst.white
                                  : ColorConst.primaryLight,
                            ),
                            Text(
                              "Saved",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: (state.tabIndex == 1)
                                    ? ColorConst.white
                                    : ColorConst.primaryLight,
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {
                          BlocProvider.of<BottomNavigationBloc>(context).add(
                            TabChanged(tabIndex: 1),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
