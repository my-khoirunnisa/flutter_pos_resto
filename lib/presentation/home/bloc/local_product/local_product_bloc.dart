import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:pos_resto_fic14/data/datasources/product_local_datasource.dart';
import 'package:pos_resto_fic14/data/models/response/product_response_model.dart';

part 'local_product_bloc.freezed.dart';
part 'local_product_event.dart';
part 'local_product_state.dart';

class LocalProductBloc extends Bloc<LocalProductEvent, LocalProductState> {
  final ProductLocalDataSource productLocalDataSource;
  LocalProductBloc(
    this.productLocalDataSource,
  ) : super(const _Initial()) {
    on<LocalProductEvent>((event, emit) async {
      emit(const _Loading());
      final result = await productLocalDataSource.getProducts();
      emit(_Loaded(result));
    });
  }
}
