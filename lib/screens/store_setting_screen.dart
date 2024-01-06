import 'package:flutter/material.dart';
import 'package:mvp/core/app_export.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:mvp/src/locations.dart' as locations;

class StoreSettingScreen extends StatefulWidget {
  const StoreSettingScreen({Key? key}) : super(key: key);

  static const String storeSettingTitle = '마트 설정';

  @override
  State<StoreSettingScreen> createState() => _StoreSettingScreenState();
}

class _StoreSettingScreenState extends State<StoreSettingScreen> {
  var titleList = [
    "마트",
    "마트",
    "마트",
    "마트",
    "마트",
  ];

  var description = [
    "전북 전주시 덕진구 아중4길 22",
    "전북 전주시 덕진구 아중4길 22",
    "전북 전주시 덕진구 아중4길 22",
    "전북 전주시 덕진구 아중4길 22",
    "전북 전주시 덕진구 아중4길 22",
  ];

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  late GoogleMapController mapController;

  final LatLng _center = const LatLng(37.56043, 127.0397);

  final Map<String, Marker> _markers = {};

  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await locations.getGoogleOffices();
    setState(() {
      _markers.clear();
      for (final office in googleOffices.offices) {
        final marker = Marker(
          markerId: MarkerId(office.name),
          position: LatLng(office.lat, office.lng),
          infoWindow: InfoWindow(
            title: office.name,
            snippet: office.address,
          ),
        );
        _markers[office.name] = marker;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        key: scaffoldKey,
        appBar: CustomAppBar(
          centerTitle: true,
          height: 120.v,
          leading: Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.only(left: 21.h),
              child: AppbarImage(
                svgPath: ImageConstant.imgBackbutton,
                onTap: () => Navigator.pop(context),
              ),
            ),
          ),
          leadingWidth: 21.h + 10.adaptSize,
          title: StoreSettingScreen.storeSettingTitle,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 10.0,
                ),
                markers: _markers.values.toSet(),
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: titleList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.h,
                      ),
                      child: ListTile(
                        leading: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: const Icon(
                            Icons.home_outlined,
                            size: 35,
                          ),
                        ),
                        title: Text(
                          titleList[index],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.h,
                          ),
                        ),
                        subtitle: Text(
                          description[index],
                          style: const TextStyle(
                            color: Color(0xFF767676),
                            fontSize: 15,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
