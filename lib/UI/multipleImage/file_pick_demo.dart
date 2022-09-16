import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImagePickerForGallery extends StatefulWidget {
  const ImagePickerForGallery({Key? key}) : super(key: key);

  @override
  State<ImagePickerForGallery> createState() => _ImagePickerForGalleryState();
}

class _ImagePickerForGalleryState extends State<ImagePickerForGallery>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 2000,
      ),
    );
    animation = controller
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reset();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  ImagePicker _imagePicker = ImagePicker();

  ValueNotifier<List<String?>> filespath = ValueNotifier([]);

  void pickImageGallery() async {
    List<XFile>? images = await _imagePicker.pickMultiImage();
    for (int i = 0; i < images!.length; i++) {
      filespath.value.add(images[i].path);
    }
    filespath.notifyListeners();
    print(filespath.value.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Pick Image"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              filespath.value.length == 4
                  ? showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                            "Alert",
                            style: TextStyle(color: Colors.red),
                          ),
                          content: const Text(
                            "Maximum 4 Photos Added.",
                            style: TextStyle(color: Colors.red),
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Done"),
                            ),
                          ],
                        );
                      })
                  : pickImageGallery();
            },
            child: const Text("Gallery"),
          ),
          // Container(
          //   height: 150,
          //   width: 150,
          //   alignment: Alignment.center,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(10),
          //     boxShadow: const [
          //       BoxShadow(
          //           color: Colors.red,
          //           blurRadius: 3,
          //           spreadRadius: 5,
          //           offset: Offset(0, 0)),
          //       BoxShadow(
          //           color: Colors.yellowAccent,
          //           blurRadius: 5,
          //           spreadRadius: 1,
          //           offset: Offset(5, 5)),
          //     ],
          //     color: Colors.green[200],
          //   ),
          //   child: const Text('Container 2'),
          // ),
          // CustomPaint(
          //   foregroundPainter: BorderPainter(controller.value),
          //   child: Container(
          //       color: Colors.black38,
          //     width: 150,
          //     height: 150,
          //   ),
          // ),
          Expanded(
            child: ValueListenableBuilder(
                valueListenable: filespath,
                builder: (context, v, c) {
                  return ListView.builder(
                      itemCount: filespath.value.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Image.file(
                            File(filespath.value[index]!.toString()),
                            fit: BoxFit.fitHeight,
                          ),
                        );
                      });
                }),
          )
        ],
      ),
    );
  }
}

class BorderPainter extends CustomPainter {
  final double controller;

  BorderPainter(this.controller);

  @override
  void paint(Canvas canvas, Size size) {
    double _sh = size.height; // For path shortage
    double _sw = size.width; // For path shortage
    double _line = 30.0; // Length of the animated line
    double _c1 = controller * 2; // Controller value for top and left border.
    double _c2 = controller >= 0.5
        ? (controller - 0.5) * 2
        : 0; // Controller value for bottom and right border.

    Paint paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    Path _top = Path()
      ..moveTo(_sw * _c1 > _sw ? _sw : _sw * _c1, 0)
      ..lineTo(_sw * _c1 + _line >= _sw ? _sw : _sw * _c1 + _line, 0);

    Path _left = Path()
      ..moveTo(0, _sh * _c1 > _sh ? _sh : _sh * _c1)
      ..lineTo(0, _sh * _c1 + _line >= _sh ? _sh : _sh * _c1 + _line);

    Path _right = Path()
      ..moveTo(_sw, _sh * _c2)
      ..lineTo(
          _sw,
          _sh * _c2 + _line > _sh
              ? _sh
              : _sw * _c1 + _line >= _sw
                  ? _sw * _c1 + _line - _sw
                  : _sh * _c2);

    Path _bottom = Path()
      ..moveTo(_sw * _c2, _sh)
      ..lineTo(
          _sw * _c2 + _line > _sw
              ? _sw
              : _sh * _c1 + _line >= _sh
                  ? _sh * _c1 + _line - _sh
                  : _sw * _c2,
          _sh);

    canvas.drawPath(_top, paint);
    canvas.drawPath(_left, paint);
    canvas.drawPath(_right, paint);
    canvas.drawPath(_bottom, paint);
  }

  @override
  bool shouldRepaint(BorderPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(BorderPainter oldDelegate) => false;
}
