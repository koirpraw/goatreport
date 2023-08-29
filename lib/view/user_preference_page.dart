import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:goatreport/view/sync_with_googlefit_page.dart';

import 'home_page/widgets/prompt_box_custom_paint.dart';

class UserPreferencePage extends StatelessWidget {
  const UserPreferencePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Get.height * 0.125,
        leading: IconButton(
          icon: const Icon(
            Icons.close,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Container(
          child: Image.asset('assets/icons/goatReport_icon.png'),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Stack(children: [
        Positioned(
          top: 110,
          left: 0,
          right: 0,
          child: SingleChildScrollView(
            child: Column(
              children: [
                PreferenceCard(
                  preferenceIcon: Icons.grid_view_rounded,
                  preferenceTitle: 'Template',
                  preferenceDescription:
                      'Choose from a variety of pre-built manual trackers',
                  onTap: () {},
                ),
                PreferenceCard(
                  preferenceIcon: Icons.watch,
                  preferenceTitle: 'Device',
                  preferenceDescription:
                      'Sync with google fit to track automated metrics',
                  onTap: () {
                    Get.to(() => SyncWithGoogleFitPage());
                  },
                ),
                PreferenceCard(
                  preferenceIcon: Icons.sunny,
                  preferenceTitle: 'External',
                  preferenceDescription:
                      'Sync with external provider to track things like weather',
                  onTap: () {},
                ),
                PreferenceCard(
                  preferenceIcon: Icons.build,
                  preferenceTitle: 'Custom',
                  preferenceDescription:
                      'Create a personalized metric tracker from scratch',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 2,
          left: 40,
          right: 40,
          child: CustomPaint(
            size: Size(300, 80),
            painter: PromptBoxCustomPaint(),
            child: SizedBox(
              height: 100,
              child: Center(
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText(
                        'What Kind of Metrics Do You Want to Track?',
                        textStyle: const TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Montserrat',
                        ),
                        textAlign: TextAlign.center,
                        speed: const Duration(milliseconds: 30),
                      ),
                    ],
                    isRepeatingAnimation: false,
                  )),
            ),
          ),
          // Container(
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.circular(16),
          //     border: Border.all(color: Colors.blue.shade900),
          //     boxShadow: [
          //       BoxShadow(
          //         color: Colors.grey.withOpacity(0.5),
          //         spreadRadius: 3,
          //         blurRadius: 7,
          //         offset: const Offset(3, 3), // changes position of shadow
          //       ),
          //     ],
          //   ),
          //   height: Get.height * 0.075,
          //   width: Get.width * 0.8,
          //   child: Center(
          //       child: AnimatedTextKit(
          //     animatedTexts: [
          //       TyperAnimatedText(
          //         'What Kind of Metrics Do You Want to Track?',
          //         textStyle: const TextStyle(
          //           fontSize: 16.0,
          //           fontFamily: 'Montserrat',
          //         ),
          //         textAlign: TextAlign.center,
          //         speed: const Duration(milliseconds: 30),
          //       ),
          //     ],
          //     isRepeatingAnimation: false,
          //   )),
          // ),
        ),
      ]),
    );
  }
}

class PreferenceCard extends StatelessWidget {
  const PreferenceCard(
      {Key? key,
      required this.preferenceIcon,
      required this.preferenceTitle,
      required this.preferenceDescription,
      required this.onTap})
      : super(key: key);
  final IconData preferenceIcon;
  final String preferenceTitle;
  final String preferenceDescription;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: Get.height * 0.17,
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      preferenceIcon,
                      color: Colors.blue.shade900,
                      size: 84,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          preferenceTitle,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                            width: Get.width * 0.5,
                            height: Get.height * 0.1,
                            child: Text(
                              preferenceDescription,
                              style: const TextStyle(fontSize: 12),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.start,
                            )),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: Get.width * 0.6,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 16.0),
                      child: Text(
                        "Free Limit:3/8",
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
