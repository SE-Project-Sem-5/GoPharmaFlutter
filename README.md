# go_pharma

Flutter application for GoPharma

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

======================WORKFLOW==============================
  
# This is a basic workflow to help you get started with Actions

name: Flutter Push Verification

# Controls when the action will run. 
on:
  # Triggers the workflow on push or pull request events but only for the master branch
  pull_request:
    branches: [ master ]
  push:
    branches: [ master ]
  # Allows you to run this workflow manually from the Actions tab
  workflow_dispatch:

# A workflow run is made up of one or more jobs that can run sequentially or in parallel
jobs:
  # This workflow contains a single job called "build"
  build:
    name: Test & Build APK
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1
    - uses: subosito/flutter-action@v1
    - run: flutter pub get
    # - run: flutter test
    - run: flutter build apk --debug --split-per-abi
