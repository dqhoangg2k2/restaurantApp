import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurantapp_flutter/components/custom_circle_button.dart';


import '../components/custom_button.dart';
import '../models/user_model.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
    required this.user,
  });
  final UserModel user;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  BitmapDescriptor icon = BitmapDescriptor.defaultMarker;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    icon = await bitmapDescriptor('assets/icons/ic_pin_1.png');
    setState(() {});
  }

  Future<BitmapDescriptor> bitmapDescriptor(String path) async {
    // load image from assets
    final ByteData byteData = await rootBundle.load(path);
    final Uint8List uint8List = byteData.buffer.asUint8List();
    return BitmapDescriptor.fromBytes(uint8List);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: Image.network(
              widget.user.couverture ?? '',
              height: 168,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 8.0,
            left: 22.0,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context, widget.user);
              },
              child: CircleAvatar(
                radius: 20.0,
                backgroundColor: Colors.white,
                child: SvgPicture.asset(
                  'assets/icons/ic_back.svg',
                  color: const Color(0xFF33495D),
                ),
              ),
            ),
          ),
          Positioned(
            top: 168 / 2 - 35,
            left: MediaQuery.of(context).size.width / 2 - 35,
            child: CircleAvatar(
              radius: 35.0,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 33.0,
                backgroundImage: Image.asset(widget.user.avatar ?? '').image,
              ),
            ),
          ),
          Positioned.fill(
            top: 148,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22)
                        .copyWith(top: 14, bottom: 8.0),
                    child: Text(
                      widget.user.name ?? '',
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22.0)
                        .copyWith(bottom: 14.0),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 11.0, vertical: 3.0),
                          decoration: BoxDecoration(
                              color: const Color(0xFFFEF5E8),
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/icons/ic_star.svg'),
                              const SizedBox(width: 4.0),
                              Text(
                                '${widget.user.rate ?? 0.0}',
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF33495D)),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 11.0, vertical: 3.0),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFEF5E8),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Row(
                            children: [
                              // ...List.generate(4, (index) => Row(children: [
                              //   SvgPicture.asset('assets/icons/ic_price_level.svg')
                              // ],))
                              // ...List.generate(widget.user.priceRange ?? 0, (index) => SvgPicture.asset('assets/icons/ic_price_level.svg')),
                              // ...List.generate(4 - (widget.user.priceRange ?? 0), (index) => SvgPicture.asset('assets/icons/ic_price_level.svg')),
                              ...List.generate(4, (index) {
                                return SvgPicture.asset(index <
                                        (widget.user.priceRange ?? 0)
                                    ? 'assets/icons/ic_price_level.svg'
                                    : 'assets/icons/ic_price_level_outlined.svg');
                              })
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14.0),
                  Row(
                    children: [
                      ReviewItem(
                        count: '${widget.user.review ?? 0}',
                        title: 'Review',
                      ),
                      Container(
                        width: 1,
                        height: 40,
                        color: const Color(0xFFF5F6F7),
                      ),
                      ReviewItem(
                        count: '${widget.user.follower ?? 0}',
                        title: 'Follower',
                      ),
                      Container(
                        width: 1,
                        height: 40,
                        color: const Color(0xFFF5F6F7),
                      ),
                      ReviewItem(
                        count: '${widget.user.following ?? 0}',
                        title: 'Following',
                      ),
                    ],
                  ),
                  const SizedBox(height: 14.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22.0),
                    child: FittedBox(
                      child: Row(
                        children: [
                          CustomButton(
                            onPressed: () {
                              setState(() {
                                // ấn vào     // cách 1
                                // if (widget.user.status == false) {
                                //   // nếu chưa follow    == gán
                                //   widget.user.status =
                                //       true; // ấn vào là true        = kết quả
                                //   widget.user.follower =
                                //       (widget.user.follower ?? 0) +
                                //           1; // cộng lên 1
                                // } else {
                                //   // nếu folow rồi
                                //   widget.user.status = false; // ấn vào là false
                                //   widget.user.follower =
                                //       (widget.user.follower ?? 0) -
                                //           1; // trừ đi 1
                                // }

                                if (widget.user.status == true) {
                                  widget.user.status = false; // ấn vào là false
                                  widget.user.follower =
                                      (widget.user.follower ?? 0) - 1;
                                } else {
                                  widget.user.status =
                                      true; // ấn vào là true        = kết quả
                                  widget.user.follower =
                                      (widget.user.follower ?? 0) + 1;
                                }
                              });
                            },
                            text: (widget.user.status ==
                                    false) // nếu chưa follow
                                ? "Follow" // ấn vào là đã follow
                                : "UnFollow", // ngược  lại  follor rồi thì hiện Unfollow
                          ),
                          const SizedBox(width: 14.0),
                          const CustomButton.outlined(text: 'Add review'),
                          const SizedBox(width: 14.0),
                          const CustomCircleButton(
                            icon: 'assets/icons/ic_menu.svg',
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 14.0),
                  // ReadMoreText(
                  //   'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                  //   trimLines: 2,
                  //   colorClickableText: Colors.pink,
                  //   trimMode: TrimMode.Line,
                  //   trimCollapsedText: 'Show more',
                  //   trimExpandedText: 'Show less',
                  //   moreStyle:
                  //       TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  // ),

                  SizedBox(
                    height: 80.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: GoogleMap(
                        initialCameraPosition: CameraPosition(
                            target: LatLng(
                              widget.user.location?.lat ?? 0,
                              widget.user.location?.long ?? 0,
                            ),
                            zoom: 14),
                        zoomGesturesEnabled: false,
                        zoomControlsEnabled: false,
                        markers: {
                          Marker(
                            markerId: MarkerId('1'),
                            position: LatLng(
                              widget.user.location?.lat ?? 0,
                              widget.user.location?.long ?? 0,
                            ),
                            icon: icon,
                            anchor: Offset(0.5, 0.5),
                          ),
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const Positioned(
            right: 22.0,
            top: 168 - 40,
            child: Row(
              children: [
                CustomCircle(
                  icon: 'assets/icons/ic_frame_detail.svg',
                ),
                SizedBox(width: 10.0),
                CustomCircle(
                  icon: 'assets/icons/ic_HeartStraight.svg',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReviewItem extends StatelessWidget {
  const ReviewItem({
    super.key,
    required this.count,
    required this.title,
  });

  final String count;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: '$count\n',
              style: const TextStyle(
                color: Color(0xFF33495D),
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            TextSpan(
              text: title,
              style: const TextStyle(
                color: Color(0xFF85929E),
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCircle extends StatelessWidget {
  const CustomCircle({
    super.key,
    required this.icon,
  });
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(0.0, 0.0),
              blurRadius: 5.0,
              spreadRadius: 0,
            ),
          ]),
      child: SvgPicture.asset(icon),
    );
  }
}
