import '../load_data_result.dart';

typedef MapResultType<O, T> = O Function(T);

extension FutureExt<T> on Future<T> {
  Future<O> map<O>({MapResultType<O, T>? onMap}) {
    return then<O>((value) {
      if (onMap != null) {
        return onMap(value);
      } else {
        return value as O;
      }
    });
  }

  Future<LoadDataResult<O>> getLoadDataResult<O>({MapResultType<O, T>? mapLoadDataResult}) {
    return then<LoadDataResult<O>>((value) {
      if (mapLoadDataResult != null) {
        return SuccessLoadDataResult(value: mapLoadDataResult(value));
      } else if (value is FailedLoadDataResult) {
        throw value.e;
      } else {
        return SuccessLoadDataResult(value: value as O);
      }
    }).catchError((e, stackTrace) async {
      return FailedLoadDataResult<O>(e: e, stackTrace: stackTrace);
    });
  }
}