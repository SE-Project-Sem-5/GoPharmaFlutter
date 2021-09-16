import 'package:flutter/material.dart';

@immutable
class CameraState {
  final String error;
  final List<String> localPhotoPaths;

  // final List<String> photosUrls;
  // final List<File> photos;
  // List<PhotoStatus> _photosStatus;
  // List<PhotoSource> _photosSources;
  // List<GalleryItem> galleryItems;

  CameraState({
      this.error,
      this.localPhotoPaths,
    //   this.photos,
    //   this.photosUrls,
    //   this.galleryItems,
  });

  static CameraState get initialState => CameraState(
        error: '',
        localPhotoPaths: [],
        // photos: [],
        // photosUrls: [],
        // galleryItems: [],
      );

  CameraState clone({
    String error = '',
      List<String> localPhotoPaths,

    //   List<File> photos,
    //   List<String> photosUrls,
    //   List<GalleryItem> galleryItems,
  }) {
    return CameraState(
      error: error,
      localPhotoPaths: localPhotoPaths,
      // photosUrls: photosUrls,
      // photos: photos,
      // galleryItems: galleryItems,
    );
  }
}
