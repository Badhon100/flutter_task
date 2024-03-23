// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task/presentaion/constant/color_const.dart';
import 'package:http/http.dart' as http;
import 'package:maplibre_gl/maplibre_gl.dart';

import 'package:flutter_task/presentaion/constant/image_const.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CameraPosition initialPosition =
      const CameraPosition(target: LatLng(23.835677, 90.380325), zoom: 12);
  MaplibreMapController? mController;

  static const styleId = 'osm-liberty'; //barikoi map style id
  static const apiKey =
      'bkoi_42ac6be6642eee10a2f5d8c70818fa35cdaacb9f9a981efcde1fc08dadfddbc6'; //barikoi API key, get it from https://developer.barikoi.com
  static const mapUrl =
      'https://map.barikoi.com/styles/$styleId/style.json?key=$apiKey';
  LatLng? cooedinates;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          MaplibreMap(
            initialCameraPosition: initialPosition,
            styleString: mapUrl,
            onMapCreated: (MaplibreMapController mapController) {
              //called when map object is created
              mController =
                  mapController; // use the MaplibreMapController for map operations

              mController?.onSymbolTapped.add(
                  _OnSymboltapped); // add symbol tap event listener to mapcontroller
            },
            onStyleLoadedCallback: () {
              // Create SymbolOption for creating a symbol in map
              SymbolOptions symbolOptions = SymbolOptions(
                geometry: cooedinates ??
                    const LatLng(23.810733342701525,
                        90.42092717921179), // location of the symbol, required
                iconImage: 'custom-marker', // icon image of the symbol
                //optional parameter to configure the symbol
                iconSize:
                    .4, // size of the icon in ratio of the actual size, optional
                iconAnchor:
                    'bottom', // anchor direction of the icon on the location specified,  optional
                // textField: 'test', // Text to show on the symbol, optional
                textSize: 12.5,
                textOffset: const Offset(0,
                    1.2), // shifting the text position relative to the symbol with x,y axis value, optional
                textAnchor:
                    'bottom', // anchor direction of the text on the location specified, optional
                textColor: '#000000',
                textHaloBlur: 1,
                textHaloColor: '#ffffff',
                textHaloWidth: 0.8,
              );
              addImageFromAsset("custom-marker", "assets/marker.png")
                  .then((value) {
                mController?.addSymbol(symbolOptions);
              });
            },
            onMapClick: (point, coordinates) {
              setState(() {
                cooedinates = cooedinates;
              });
              print("coordinates: $coordinates");
            },
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
                            horizontal: width * 0.02, vertical: height * 0.002),
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
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: ColorConst.white,
        onPressed: () {},
        child: SvgPicture.asset(
          ImageConst.actionButton,
        ),
      ),
    );
  }

  _OnSymboltapped(Symbol symbol) {
    //update symbol text when tapped
    mController?.updateSymbol(
        symbol,
        const SymbolOptions(
          textField: "clicked",
        ));
  }

  // Adds an asset image to the currently displayed style
  Future<void> addImageFromAsset(String name, String assetName) async {
    final ByteData bytes = await rootBundle.load(
      ImageConst.marker,
    );
    final Uint8List list = bytes.buffer.asUint8List();
    return mController!.addImage(name, list);
  }

  // Adds a network image to the currently displayed style
  Future<void> addImageFromUrl(String name, Uri uri) async {
    var response = await http.get(uri);
    return mController!.addImage(name, response.bodyBytes);
  }
}
