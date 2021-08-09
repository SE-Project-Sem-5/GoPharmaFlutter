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
    required this.error,
    required this.localPhotoPaths,
    // required this.photos,
    // required this.photosUrls,
    // required this.galleryItems,
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
    required List<String> localPhotoPaths,

    // required List<File> photos,
    // required List<String> photosUrls,
    // required List<GalleryItem> galleryItems,
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
