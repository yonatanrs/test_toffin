import '../../misc/load_data_result.dart';
import '../entity/order/get_order_list_parameter.dart';
import '../entity/order/get_order_list_response.dart';

abstract class OrderRepository {
  Future<LoadDataResult<GetOrderListResponse>> getOrderList(GetOrderListParameter getOrderListParameter);
}