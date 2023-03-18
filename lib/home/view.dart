import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import 'Models.dart';
import 'logic.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key,});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final logic = Get.put(HomeLogic());
  final state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'List of Album',
          style: GoogleFonts.actor(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder<List<DisplayMods>>(
        future: logic.getInfomation(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.length > 0) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        width: 150,
                        child: Image.network(
                          '${snapshot.data![index].url}',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text('${snapshot.data![index].id}'),
                      ),
                      title: Text(
                        '${snapshot.data![index].title}',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                  )
                ],
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return ListView.builder(
              itemBuilder: (context, index) => Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  margin: EdgeInsets.all(10),
                  height: 100,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              itemCount: 10,
            );
          } else {
            return Center(
              child: Icon(
                Icons.error_outline,
                size: 47,
              ),
            );
          }
        },
      ),
    );
  }
}
