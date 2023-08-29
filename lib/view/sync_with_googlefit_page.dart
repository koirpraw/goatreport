import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SyncWithGoogleFitPage extends StatelessWidget {
  const SyncWithGoogleFitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Get.height * 0.125,

        title: Container(
          child: Image.asset('assets/icons/goatReport_icon.png'),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.1,
            ),
            SizedBox(
              height: Get.height * 0.075,
              child: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/d/dc/Google_Fit_icon_%282018%29.svg/283px-Google_Fit_icon_%282018%29.svg.png',fit: BoxFit.fitHeight,),
            ),
            SizedBox(
              height: Get.height * 0.1,
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: Get.width * 0.9,
                  height: Get.height * 0.078,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple.shade900,
                      onPrimary: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.favorite,size: 40,),
                         Text('Sync with Google Fit',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300,)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
