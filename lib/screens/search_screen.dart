

import 'package:flutter/material.dart';
import 'package:flutter_task/provider/product_details_provider.dart';
import 'package:flutter_task/provider/search_result_provider.dart';
import 'package:flutter_task/screens/product_details_screen.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';

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
      backgroundColor:  Colors.grey[90],
      body: SafeArea(
        child: Consumer2<SearchResultProvider, ProductDetailsProvider>(
          builder: (context, searchProvider, productDetailsProvider, child) {
            return SingleChildScrollView(
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
                      searchOnPressed: (){
                        searchProvider.searchKey = searchController.text;
                        searchProvider.getData();
                        // print(searchProvider.searchResult!.data!.products!.results![0].brand!.name);
                      },
                    ),
                    SizedBox(
                      height: height*0.05,
                    ),
                    (searchProvider.searchResult == null)?
                    const Text("Search product"):
                    GridView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: const ScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: (itemWidth*1.2 / itemHeight),
                      ), 
                      
                      itemCount: (searchProvider.searchResult == null)? 0: searchProvider.searchResult!.data!.products!.results!.length,
                      itemBuilder: (context, index) {
                        return (searchProvider.searchResult == null)?
                        const Text("Search product"):
                        InkWell(
                          onTap: (){
                            productDetailsProvider.slug = searchProvider.searchResult!.data!.products!.results![index].slug;
                            
                            Navigator.push(
                          context, MaterialPageRoute(
                            builder: (_)=> ProductDetailsScreen()
                            )
                        );
                          },
                          child: Padding(
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
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(searchProvider.searchResult!.data!.products!.results![index].image!,)
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
                                           Text("ক্রয়: ৳ ${searchProvider.searchResult!.data!.products!.results![index].charge!.currentCharge}", style: TextStyle(color: Color(0xffDA2079)),),
                                           SizedBox(
                                            width: width*0.1,
                                           ),
                                           Text(
                                            (searchProvider.searchResult!.data!.products!.results![index].charge!.discountCharge != null)?
                                            searchProvider.searchResult!.data!.products!.results![index].charge!.discountCharge
                                            :"৳ 00.00", style: const TextStyle(color: Color(0xffDA2079), decoration: TextDecoration.lineThrough)),
                                         ],
                                       )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children:[
                                       Row(
                                         children: [
                                           const Text("বিক্রয়: ", style: TextStyle(color: Color(0xff646464))),
                                           Text("৳ ${searchProvider.searchResult!.data!.products!.results![index].charge!.sellingPrice}", style: TextStyle(color: Color(0xff646464))),
                                         ],
                                       ),
                                       Text("লাভ ৳ ${searchProvider.searchResult!.data!.products!.results![index].charge!.profit}", style: TextStyle(color: Color(0xff646464))),
                                    ],
                                  ),
                                ],
                              )
                            ],
                                          ),
                                        ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}

