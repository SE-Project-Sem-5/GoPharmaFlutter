import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:go_pharma/bloc/customer/camera/camera_event.dart';
import 'package:path/path.dart' as path;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/camera/camera_bloc.dart';
import 'package:go_pharma/bloc/customer/camera/camera_state.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';

class SelectPhotoScreen extends StatelessWidget {
  static final String id = "select_photo_screen";
  final ImagePicker imagePicker = new ImagePicker();
  final PageController controller = PageController(initialPage: 0);

  List<Widget> setImages(List<String> photoLocations) {
    List<Widget> images = [];
    for (String location in photoLocations) {
      images.add(
        Image.file(
          File(
            location,
          ),
          fit: BoxFit.contain,
        ),
      );
    }
    return images;
  }

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<CameraBloc>(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<CameraBloc, CameraState>(
                builder: (context, state) {
                  List<String> photoLocations = state.localPhotoPaths;
                  List<Widget> images = setImages(photoLocations);
                  return Container(
                    height: MediaQuery.of(context).size.width * 0.7,
                    width: MediaQuery.of(context).size.width,
                    child: PageView(
                      physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: images,
                    ),
                  );
                  // return CarouselImageArea(photos: photos);
                },
              ),
              BlocBuilder<CameraBloc, CameraState>(
                buildWhen: (previous, current) =>
                    previous.localPhotoPaths.length !=
                    current.localPhotoPaths.length,
                builder: (context, state) {
                  return Container(
                    margin: EdgeInsets.all(16),
                    child: OutlinedButton(
                      child: Text('Upload From Gallery'),
                      onPressed: () async {
                        PermissionStatus status =
                            await Permission.storage.request();
                        var storageStatus = await Permission.storage.status;
                        XFile? image;
                        if (storageStatus.isGranted) {
                          image = await imagePicker.pickImage(
                            source: ImageSource.gallery,
                          );
                          if (image != null) {
                            bloc.add(
                              UploadImageFromGallery(
                                localPhotoPaths: [image.path],
                              ),
                            );
                          }
                        } else if (storageStatus == PermissionStatus.denied) {
                          //  TODO: do something
                        }
                      },
                    ),
                  );
                },
              ),
              Container(
                margin: EdgeInsets.all(16),
                child: OutlinedButton(
                  child: Text('Take Photo'),
                  onPressed: () async {
                    PermissionStatus status = await Permission.camera.request();
                    var cameraStatus = await Permission.camera.status;

                    if (cameraStatus.isGranted) {
                      XFile? image = await imagePicker.pickImage(
                        source: ImageSource.camera,
                      );
                      if (image != null) {
                        bloc.add(
                          UploadImageFromGallery(
                            localPhotoPaths: [image.path],
                          ),
                        );
                      }
                    } else if (cameraStatus.isDenied) {
                      //  TODO: do something
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CarouselImageArea extends StatelessWidget {
  const CarouselImageArea({
    Key? key,
    required this.photos,
  }) : super(key: key);

  final List<String> photos;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      child: CarouselSlider(
        options: CarouselOptions(
          scrollPhysics: ClampingScrollPhysics(),
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          initialPage: 1,
          autoPlay: false,
        ),
        items: photos
            .map((item) => Container(
                  child: Image.file(
                    File(item),
                    fit: BoxFit.fill,
                  ),
                ))
            .toList(),
      ),
    );
  }
}

// return Container(
// height: 300,
// width: 300,
// child: Image.file(
// File(
// state.localPhotoPaths[index],
// ),
// ),
// );
