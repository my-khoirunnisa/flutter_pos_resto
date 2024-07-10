// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:pos_resto_fic14/data/datasources/product_remote_datasource.dart';
import 'package:pos_resto_fic14/data/models/response/product_response_model.dart';

part 'sync_product_bloc.freezed.dart';
part 'sync_product_event.dart';
part 'sync_product_state.dart';

class SyncProductBloc extends Bloc<SyncProductEvent, SyncProductState> {
  final ProductRemoteDataSource productRemoteDataSource;
  SyncProductBloc(
    this.productRemoteDataSource,
  ) : super(const _Initial()) {
    on<_SyncProduct>((event, emit) async {
      emit(const _Loading());
      final result = await productRemoteDataSource.getProducts();
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
