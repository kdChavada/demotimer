import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ux_images_picker/images_picker.dart';

class UxPickerVIew extends StatefulWidget {
  const UxPickerVIew({Key? key}) : super(key: key);

  @override
  State<UxPickerVIew> createState() => _UxPickerVIewState();
}

class _UxPickerVIewState extends State<UxPickerVIew> {
  ValueNotifier<List<String>> imagePath = ValueNotifier([]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Image Picker"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            child: const Text('Pick Image'),
            onPressed: () async {
              List<Media>? res = await ImagesPicker.pick(
                count: 4,
                pickType: PickType.image,
                language: Language.English,
                maxTime: 30,
                // maxSize: 500,
                cropOpt: CropOption(
                  // aspectRatio: CropAspectRatio.wh16x9,
                  cropType: CropType.circle,
                ),
              );
              print(res);
              if (res != null) {
                debugPrint("**************************${res.map((e) => e.path).toList()}");
                setState(() {
                  //  path = res[0].thumbPath;

                  for (int i = 0; i < res.length; i++) {
                    // path.add(res[i].thumbPath.toString());
                    // print(path[i]);

                    imagePath.value.add(res[i].thumbPath.toString());
                    print("My Image  Data ${imagePath.value[i]}");
                  }
                });
                // bool status = await ImagesPicker.saveImageToAlbum(File(res[0]?.path));
                // print(status);
              }
            },
          ),
          Expanded(
            child: ValueListenableBuilder(
                valueListenable: imagePath,
                builder: (context, v, c) {
                  return ListView.builder(
                      itemCount: imagePath.value.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Image.file(File(imagePath.value[index]));
                      });
                }),
          )
        ],
      ),
    );
  }
}
