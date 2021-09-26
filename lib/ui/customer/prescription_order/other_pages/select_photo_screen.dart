import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/prescription_order/prescription_order_bloc.dart';
import 'package:go_pharma/bloc/customer/prescription_order/prescription_order_event.dart';
import 'package:go_pharma/bloc/customer/prescription_order/prescription_order_state.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/common/widgets/rounded_button_filled.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class SelectPhotoScreen extends StatelessWidget {
  static final String id = "select_photo_screen";
  final ImagePicker imagePicker = new ImagePicker();
  final PageController controller = PageController(initialPage: 0);

  List<Widget> setImages(
      List<String> photoLocations, PrescriptionOrderBloc bloc) {
    List<Widget> images = [];
    print(photoLocations);
    for (String fileLocation in photoLocations) {
      images.add(
        Container(
          color: Colors.black,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.file(
                File(
                  fileLocation,
                ),
                fit: BoxFit.contain,
              ),
              Positioned(
                right: 10,
                top: 10,
                child: GestureDetector(
                  onTap: () {
                    bloc.add(RemoveImageEvent(image: fileLocation));
                  },
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }
    return images;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var bloc = BlocProvider.of<PrescriptionOrderBloc>(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          BlocBuilder<PrescriptionOrderBloc, PrescriptionOrderState>(
            builder: (context, state) {
              List<String> photoLocations = state.localPhotoPaths;
              List<Widget> images = setImages(photoLocations, bloc);
              return images.length > 0
                  ? Container(
                      height: MediaQuery.of(context).size.width * 0.7,
                      child: PageView(
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: images,
                      ),
                    )
                  : Container(
                      height: MediaQuery.of(context).size.width * 0.7,
                      child: Center(
                        child: Text(
                          "No Images Uploaded",
                          style: TextStyle(fontSize: 20),
                        ),
                      ));
              // return CarouselImageArea(photos: photos);
            },
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: RoundedButtonFilled(
              fillColor: GoPharmaColors.GreyColor.withOpacity(0.5),
              textColor: GoPharmaColors.BlackColor,
              title: "Upload From Gallery",
              size: size,
              onTapped: () async {
                PermissionStatus status = await Permission.storage.request();
                var storageStatus = await Permission.storage.status;
                XFile image;
                if (storageStatus.isGranted) {
                  image = await imagePicker.pickImage(
                    source: ImageSource.gallery,
                  );
                  if (image != null) {
                    bloc.add(
                      UploadPrescriptionEvent(
                        image: image.path,
                      ),
                    );
                  }
                } else if (storageStatus == PermissionStatus.denied) {
                  //  TODO: do something
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: RoundedButtonFilled(
              fillColor: GoPharmaColors.GreyColor.withOpacity(0.5),
              textColor: GoPharmaColors.BlackColor,
              title: "Take Photo",
              size: size,
              onTapped: () async {
                PermissionStatus status = await Permission.camera.request();
                var cameraStatus = await Permission.camera.status;

                if (cameraStatus.isGranted) {
                  XFile image = await imagePicker.pickImage(
                    source: ImageSource.camera,
                  );
                  if (image != null) {
                    bloc.add(
                      UploadPrescriptionEvent(
                        image: image.path,
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
    );
  }
}

class CarouselImageArea extends StatelessWidget {
  const CarouselImageArea({
    Key key,
    this.photos,
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
