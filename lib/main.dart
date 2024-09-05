// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:ctmd_app/router/app_router.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

/// The route configuration.

/// The main app.
class MyApp extends StatelessWidget {
  /// Constructs a [MyApp]
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouer,
    );
  }
}

/// The home screen

