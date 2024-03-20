import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task/presentaion/constant/color_const.dart';
import 'package:flutter_task/presentaion/constant/image_const.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Delay the focus request until after the build method is called
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.02),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(ImageConst.arrowLeft),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: TextField(
                      focusNode: _focusNode,
                      cursorColor: ColorConst.black,
                      decoration: const InputDecoration(
                          hintText: "Search here",
                          hintStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                        },
                        child: SvgPicture.asset(ImageConst.cross)),
                  ),
                ],
              ),
              Center(
                child: Text("Search your address", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: ColorConst.black),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
