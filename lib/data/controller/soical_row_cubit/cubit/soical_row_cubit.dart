import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'soical_row_state.dart';

class SoicalRowCubit extends Cubit<SoicalRowState> {
  SoicalRowCubit() : super(SoicalRowInitial());
}
