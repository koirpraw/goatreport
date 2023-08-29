import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Container(
          height: 40,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.grey),
              // prefixIcon: Icon(Icons.search, color: Colors.grey),
              // filled: true,
              // fillColor: Colors.white,
              contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
              // focusedBorder: OutlineInputBorder(
              //   borderSide: BorderSide(color: Colors.white),
              //   borderRadius: BorderRadius.circular(25.7),
              // ),
              // enabledBorder: UnderlineInputBorder(
              //   borderSide: BorderSide(color: Colors.white),
              //   borderRadius: BorderRadius.circular(25.7),
              // ),
            ),
          ),
        ),
        toolbarHeight: 80,
        leading: IconButton(
          icon:  Icon(Icons.arrow_back,color: Colors.black.withOpacity(0.5),),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon:  Icon(Icons.close,color: Colors.black.withOpacity(0.5),),
          ),
        ],
      ),
      body:  SingleChildScrollView(
        child: Container(
          height: Get.height,
          child: Column(
            children: [

              Container(
                height: Get.height * 0.9,
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: Get.height * 0.1,
                      width: Get.width,
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: buildSearchCard(),
                      ),
                    );
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
  Widget buildSearchCard(){
    return Center(
      child:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.battery_4_bar_outlined,color: Colors.blue.shade700,),
                SizedBox(width: 10,),
                Text('Factor ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300)),
              ],
            ),

            Row(
              children: [
                Container(
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade700,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('tag',style: TextStyle(color: Colors.white),),
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
