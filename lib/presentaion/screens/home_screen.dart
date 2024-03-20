import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task/presentaion/constant/color_const.dart';
import 'package:flutter_task/presentaion/constant/image_const.dart';
// ignore: depend_on_referenced_packages
import 'package:maplibre_gl/maplibre_gl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CameraPosition initialPosition = const CameraPosition(
      target: LatLng(23.835677, 90.380325),
      zoom: 12); //CameraPosition object for initial location in map
  MaplibreMapController? mController;

  static const styleId = 'osm-liberty'; //barikoi map style id
  static const apiKey =
      'bkoi_42ac6be6642eee10a2f5d8c70818fa35cdaacb9f9a981efcde1fc08dadfddbc6'; //barikoi API key, get it from https://developer.barikoi.com
  static const mapUrl =
      'https://map.barikoi.com/styles/$styleId/style.json?key=$apiKey';
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            MaplibreMap(
              initialCameraPosition:
                  initialPosition, // set map initial location where map will show first
              onMapCreated: (MaplibreMapController mapController) {
                //called when map object is created
                mController =
                    mapController; // use the MaplibreMapController for map operations
              },
              styleString: mapUrl, // barikoi map style url
            ),
            Positioned(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.054, vertical: height * 0.02),
                child: Container(
                  height: height * 0.055,
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(27.5),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: SvgPicture.asset(ImageConst.searchBarMenu),
                      ),
                      Expanded(
                        flex: 6,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: width * 0.02,
                              vertical: height * 0.002),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/search_screen');
                            },
                            child: SizedBox(
                              height: height * 0.055,
                              width: width,
                              child: const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Search here",
                                  style: TextStyle(
                                    color: ColorConst.primaryColor,
                                    //       fontSize: 14,
                                    //       fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // child: const TextField(
                          //   cursorColor: ColorConst.primaryColor,
                          //   decoration: InputDecoration(
                          //     hintText: "Search here",
                          //     hintStyle: TextStyle(
                          //       color: ColorConst.primaryColor,
                          //       fontSize: 14,
                          //       fontWeight: FontWeight.w500,
                          //     ),
                          //     border: OutlineInputBorder(
                          //       borderSide: BorderSide.none
                          //     )
                          //   ),
            
                          // ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SvgPicture.asset(ImageConst.searchBarMic),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: ColorConst.white,
        onPressed: () {},
        child: SvgPicture.asset(ImageConst.actionButton),
      ),
    );
  }
}
