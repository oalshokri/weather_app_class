import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  LocationScreenState createState() => LocationScreenState();
}

class LocationScreenState extends State<LocationScreen> {
  ImageProvider image =
      const NetworkImage('https://source.unsplash.com/random/?cloud');

  bool isLoaded = false;

  void checkImageLoaded() {
    image
        .resolve(const ImageConfiguration())
        .addListener(ImageStreamListener((_image, synchronousCall) {
      setState(() {
        isLoaded = true;
      });
    }));
  }

  @override
  void initState() {
    checkImageLoaded();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            constraints: const BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/location_background.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.8), BlendMode.dstATop),
              ),
            ),
          ),
          // AnimatedOpacity(
          //   opacity: isLoaded ? 1 : 0,
          //   duration: Duration(milliseconds: 500),
          //   child: Container(
          //     constraints: const BoxConstraints.expand(),
          //     decoration: BoxDecoration(
          //       image: DecorationImage(
          //         image: image,
          //         fit: BoxFit.cover,
          //         colorFilter: ColorFilter.mode(
          //             Colors.white.withOpacity(0.8), BlendMode.dstATop),
          //       ),
          //     ),
          //   ),
          // ),
          // Container(
          //   constraints: const BoxConstraints.expand(),
          //   child: AnimatedCrossFade(
          //     firstChild: Container(
          //       decoration: BoxDecoration(
          //         image: DecorationImage(
          //           image: image,
          //           fit: BoxFit.cover,
          //           colorFilter: ColorFilter.mode(
          //               Colors.white.withOpacity(0.8), BlendMode.dstATop),
          //         ),
          //       ),
          //     ),
          //     secondChild: Container(
          //       decoration: BoxDecoration(
          //         image: DecorationImage(
          //           image: AssetImage('images/location_background.jpg'),
          //           fit: BoxFit.cover,
          //           colorFilter: ColorFilter.mode(
          //               Colors.white.withOpacity(0.8), BlendMode.dstATop),
          //         ),
          //       ),
          //     ),
          //     crossFadeState: isLoaded
          //         ? CrossFadeState.showFirst
          //         : CrossFadeState.showSecond,
          //     duration: Duration(milliseconds: 1000),
          //     firstCurve: Curves.easeInOut,
          //     secondCurve: Curves.easeInOut,
          //   ),
          // ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {},
                      child: const Icon(
                        Icons.near_me,
                        size: 50.0,
                        color: kSecondaryColor,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Icon(
                        Icons.location_city,
                        size: 50.0,
                        color: kSecondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Icon(
                      FontAwesomeIcons.cloudSun,
                      size: 120,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        const Text(
                          '32',
                          style: kTempTextStyle,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 10),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 7,
                              width: 35,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)
                                  // shape: BoxShape.circle,
                                  ),
                            ),
                            const Text(
                              'now',
                              style: TextStyle(
                                fontSize: 30.0,
                                fontFamily: 'Spartan MB',
                                letterSpacing: 13,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 24.0),
                child: Text(
                  "It's 🥶 in gaza! Dress 🧤🧣 ",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
