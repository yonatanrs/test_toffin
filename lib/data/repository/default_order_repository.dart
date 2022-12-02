import 'package:test_toffin/misc/ext/future_ext.dart';

import '../../domain/entity/order/get_order_list_parameter.dart';
import '../../domain/entity/order/get_order_list_response.dart';
import '../../domain/repository/order_repository.dart';
import '../../misc/load_data_result.dart';
import '../datasource/orderdatasource/order_data_source.dart';

class DefaultOrderRepository extends OrderRepository {
  OrderDataSource orderDataSource;

  DefaultOrderRepository({
    required this.orderDataSource
  });

  @override
  Future<LoadDataResult<GetOrderListResponse>> getOrderList(GetOrderListParameter getOrderListParameter) {
    return orderDataSource.getOrderList(getOrderListParameter).getLoadDataResult();
  }
}