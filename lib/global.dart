import 'package:flutter/cupertino.dart';
import 'common/service/storage_service.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

class Global {
  // Declare a static instance of StorageService
  static late StorageService storageService;

  // Initialize global services and configurations
  static Future init() async {
    // Ensure Flutter widget binding is initialized
    WidgetsFlutterBinding.ensureInitialized();

    // Initialize Firebase with platform-specific options
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // Initialize the StorageService and assign it to the static instance
    storageService = await StorageService().init();
  }
}


