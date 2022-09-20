import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    Key? key,
    required this.width,
    required this.height,
    required this.searchController,
    required this.searchOnPressed,
  }) : super(key: key);

  final double width;
  final double height;
  final TextEditingController searchController;
  final VoidCallback searchOnPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height*0.07,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25)
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal:width*0.05),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: searchController,
                decoration: const InputDecoration(
                  hintText: "Search",
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(onPressed: searchOnPressed, icon: const Icon(Icons.search))
          ],
        ),
      ),
    );
  }
}