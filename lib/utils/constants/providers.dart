import 'package:APOD/vm/homeVm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final home = ChangeNotifierProvider<ApodProvider>((ref) => ApodProvider());
