import 'dart:async';

import 'package:flutter/services.dart';

FutureOr<void> changeOrientation(_) async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
}
