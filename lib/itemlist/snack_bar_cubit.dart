import 'package:flutter_bloc/flutter_bloc.dart';

class SnackBarCubit extends Cubit<String?> {
  SnackBarCubit() : super(null);

  void showSnackBar(String text) => emit(text);

  void reset() => emit(null);
}
