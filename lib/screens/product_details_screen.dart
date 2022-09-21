import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_task/provider/product_details_provider.dart';
import 'package:flutter_task/provider/search_result_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({super.key});
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[90],
      body: SafeArea(
        child: Consumer2<ProductDetailsProvider, SearchResultProvider>(
          builder: (context, productDetailsProvider, searchResultProvider, child) {
            return (productDetailsProvider.productDetails == null)?
            const Center(child: CupertinoActivityIndicator(),)
             :SingleChildScrollView(
              child: Stack(
                children: [
                  Positioned(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal:width*0.03),
                      child: Column(
                        children: [
                          SizedBox(
                            height: height*0.05,
                          ),
                          CustomSearchBar(
                            width: width, 
                            height: height, 
                            searchController: searchController,
                            searchOnPressed: (){},
                          ),
                  
                          SizedBox(
                            height: height*0.05,
                          ),
                          Container(
                            height: height*0.35,
                            width: width*0.55,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal:width*0.04),
                              child: Image.network(productDetailsProvider.productDetails!.data!.brand!.image!,),
                            ),
                          ),
                          SizedBox(
                            height: height*0.02,
                          ),
                          const Text(
                            "োজাম্মেল সিদ্ধ খুদ- ৫০ কেজি",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                  
                            ),
                          ),
                          SizedBox(
                            height: height*0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: const [
                                  Text("ব্র্যান্ড: ",
                                    style: TextStyle(
                                      color: Color(0xff646464),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  Text("Rice",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: const [
                                  Text("ডিস্ট্রিবিউটর: ",
                                    style: TextStyle(
                                      color: Color(0xff646464),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  Text("SupplyLine",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: height*0.01,
                          ),
                          Container(
                            height: height*0.15,
                            width: width*0.8,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal:width*0.03),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: height*0.015,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: const[
                                      Text("ক্রয় মূল্য",
                                        style: TextStyle(
                                        color: Color(0xffDA2079),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600
                                      ),
                                      ),
                                      Text("৳ 220",
                                        style: TextStyle(
                                        color: Color(0xffDA2079),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600
                                      ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                        height: height*0.01,
                                      ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: const[
                                      Text("বিক্রয় মূল্য",
                                        style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500
                                      ),
                                      ),
                                      
                                      Text("৳ 220",
                                        style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500
                                      ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                        height: height*0.01,
                                      ),
                                  DashLineView(
                                    fillRate: 0.7,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text("লাভ",
                                        style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500
                                      ),
                                      
                                      ),
                                       Text("৳ 220",
                                        style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500
                                      ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height*0.01,
                          ),
                          
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "বিস্তারিত",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              
                              const Text("")
                            ],
                          ),
                          
                          Html(tagsList: Html.tags..addAll(["bird", "flutter"]),data: "<font color=\"#000000\" face=\"Noto Sans, sans-serif\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 16px; letter-spacing: 0.14px;\"><span style=\"margin: 0px; padding: 0px; letter-spacing: -0.3px;\">প্রদর্শিত বিক্রয়মূল্য এবং লাভের পরিমাণ পরিবর্তনশীল। বাজার এবং&nbsp;</span></font><span style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 16px; letter-spacing: -0.3px;\">বিক্রেতার</span><font color=\"#000000\" face=\"Noto Sans, sans-serif\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 16px; letter-spacing: 0.14px;\"><span style=\"margin: 0px; padding: 0px; letter-spacing: -0.3px;\">&nbsp;বিবেচনার উপর নির্ভরশীল।</span></font>                                     ")
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: height*0.72,
                    left: width*0.41,
                    child: InkWell(
                      onTap: (){
                        print("added to cart");
                      },
                      child: Badge(
                        shape: BadgeShape.circle,
                        position: BadgePosition.topEnd(top: 10, end: -5),
                        borderRadius: BorderRadius.circular(5),
                        badgeContent: const Text("3"),
                        child: Stack(
                          children: [
                            Image.asset("assets/polygon.png"),
                            Positioned(
                              left: width*0.056,
                              top: height*0.02,
                              child: Column(
                                children: const [
                                  Icon(Icons.add_shopping_cart),
                                  Text("কার্ট", 
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16
                                    ),
                                  )
                                ],
                              )
                            )
                          ],
                        ),
                      ),
                    )
                  )
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}