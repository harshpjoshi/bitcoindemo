import 'package:bitcoin_demo/infrastructure/providers/home_screen_provider/home_screen_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeScreenProvider = ChangeNotifierProvider<HomeScreenProvider>((ref) => HomeScreenProvider());
