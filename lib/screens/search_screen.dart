

import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return Scaffold(
      backgroundColor: Colors.grey[90],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal:width*0.03),
            child: Column(
              children: [
                SizedBox(
                  height: height*0.05,
                ),
                Container(
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
                        IconButton(onPressed: (){}, icon: const Icon(Icons.search))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height*0.05,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const ScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: (itemWidth*1.2 / itemHeight),
                  ), 
                  
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom:15.0, left: 4, right: 4),
                      child: Container(
                  height: height*0.45,
                  width: width*0.35,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)
                  ),
                  child: Column(
                      children: [
                        SizedBox(
                          height: height*0.01,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal:width*0.05),
                          child: Container(
                            height: height*0.2,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage("https://d1ojphegpburrh.cloudfront.net/media/images/product/None/1383/%E0%A6%B8%E0%A6%9C_4.png",)
                              )
                            ),
                          )
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: width*0.01),
                          child: const Text("মোজাম্মেল সিদ্ধ খুদ- ৫০ কেজি"),
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                
                                 Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children:  [
                                     Text("ক্রয়: ৳ 20.00", style: TextStyle(color: Color(0xffDA2079)),),
                                     SizedBox(
                                      width: width*0.1,
                                     ),
                                     Text("20.00", style: TextStyle(color: Color(0xff646464)),)
                                   ],
                                 )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:[
                                 Row(
                                   children: const[
                                     Text("বিক্রয়: ", style: TextStyle(color: Color(0xff646464))),
                                     Text("৳ 25.00", style: TextStyle(color: Color(0xff646464))),
                                   ],
                                 ),
                                 Text("লাভ ৳ 5.00", style: TextStyle(color: Color(0xff646464))),
                              ],
                            ),
                          ],
                        )
                      ],
                  ),
                ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}