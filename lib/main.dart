import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pubmate_light/const/bloc_providers.dart';
import 'package:pubmate_light/const/routes.dart';
import 'package:sizer/sizer.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const OonzooApp());
}

class OonzooApp extends StatelessWidget {
  const OonzooApp({super.key});
  /*
  Here Sizer is used to access device's screen config,
  device type and orientation without instantiating Mediaquery lot of times.
  Sizer provides singleton for accessing size of device from MediaQuery.
  */
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiBlocProvider(
          providers: AppBlocProviders.appBlocs,
          child: MaterialApp(
            title: 'OonzooApp Demo',
            theme: ThemeData(
              useMaterial3: true,
              primarySwatch: Colors.blue,
            ),
            initialRoute: AppRoutes.appRoutes.entries.first.key,
            routes: AppRoutes.appRoutes,
          ),
        );
      },
    );
  }
}
