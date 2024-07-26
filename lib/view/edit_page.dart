import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:io';

import 'package:bhagwat_geeta/provider/provider_page.dart';
import 'package:bhagwat_geeta/view/verses_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_extend/share_extend.dart';

import 'home_page.dart';

class DisplayPage extends StatelessWidget {
  const DisplayPage({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey imgKey = GlobalKey();
    GeetaProvider geetaProvider = Provider.of<GeetaProvider>(context);
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xffb20202),
        centerTitle: true,
        title: const Text(
          'Shree Bhagwat Geeta',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Column(
            children: [
              RepaintBoundary(
                key: imgKey,
                child: Container(
                  height: 700,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black,
                        width: 2,
                        style: BorderStyle.solid),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/banner_geeta.jpg'),
                        fit: BoxFit.fill),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 50, right: 40, bottom: 50),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              geetaProvider.geetaList[selectedindex]
                                  .verses[selectedIndex].language.english,
                              style: const TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 70,
                width: double.infinity,
                color: const Color(0xfffcc94a),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () async {
                        RenderRepaintBoundary boundary = imgKey.currentContext!
                            .findRenderObject() as RenderRepaintBoundary;

                        ui.Image image = await boundary.toImage();

                        ByteData? byteData = await image.toByteData(
                            format: ui.ImageByteFormat.png);

                        Uint8List img = byteData!.buffer.asUint8List();

                        ImageGallerySaver.saveImage(img);
                      },
                      icon: const Icon(
                        Icons.download,
                        size: 35,
                        color: Color(0xffb20202),
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        RenderRepaintBoundary boundary = imgKey.currentContext!
                            .findRenderObject() as RenderRepaintBoundary;

                        ui.Image image = await boundary.toImage();

                        ByteData? byteData = await image.toByteData(
                            format: ui.ImageByteFormat.png);

                        Uint8List img = byteData!.buffer.asUint8List();

                        final path = await getApplicationDocumentsDirectory();

                        File file = File("${path.path}/img.png");
                        file.writeAsBytes(img);

                        ShareExtend.share(file.path, "image");
                      },
                      icon: const Icon(
                        Icons.share_outlined,
                        size: 30,
                        color: Color(0xffb20202),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
