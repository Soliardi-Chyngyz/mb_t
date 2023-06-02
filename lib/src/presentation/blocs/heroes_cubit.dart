import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbank_test/src/common/enums.dart';
import 'package:mbank_test/src/common/utils/bases/base_state.dart';
import 'package:mbank_test/src/domain/entities/hero_entity.dart';
import 'package:mbank_test/src/domain/usecases/fetch_heroes.dart';

class HeroesCubit extends Cubit<BaseState<List<HeroEntity>>> {
  HeroesCubit(this._fetchHeroes) : super(const BaseState());
  final FetchHeroes _fetchHeroes;

  String? nextPage;

  void getHeroes() async {
    emit(state.copyWith(status: CubitStatus.loading));
    final failOrSuccess = await _fetchHeroes(PaginationParams(nextPage));

    emit(failOrSuccess.fold(
      (l) => state.copyWith(
        status: CubitStatus.error,
        message: l.message,
      ),
      (r) {
        nextPage = r.info.next;
        final List<HeroEntity> list = [];
        if (state.entity == null) {
          list.addAll(r.results);
        } else {
          list.addAll(state.entity!);
          final hasSameElements =
              state.entity!.toSet().intersection(r.results.toSet());
          if (hasSameElements.isEmpty) {
            list.addAll(r.results);
          }
        }
        return state.copyWith(
          status: CubitStatus.success,
          entity: list.isEmpty ? r.results : list,
        );
      },
    ));
  }
}
