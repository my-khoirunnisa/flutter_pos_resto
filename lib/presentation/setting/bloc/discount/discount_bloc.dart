import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_posresto_app/data/model/discount_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../data/datasource/discount_remote_datasource.dart';
part 'discount_bloc.freezed.dart';
part 'discount_event.dart';
part 'discount_state.dart';

class DiscountBloc extends Bloc<DiscountEvent, DiscountState> {
  final DiscountRemoteDatasource discountRemoteDatasource;
  DiscountBloc(
    this.discountRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GetDiscounts>((event, emit) async {
      emit(const _Loading());
      final result = await discountRemoteDatasource.getDiscounts();
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.data!)),
      );
    });
  }
}
