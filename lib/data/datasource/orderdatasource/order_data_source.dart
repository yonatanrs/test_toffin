import '../../../domain/entity/order/get_order_list_parameter.dart';
import '../../../domain/entity/order/get_order_list_response.dart';

abstract class OrderDataSource {
  Future<GetOrderListResponse> getOrderList(GetOrderListParameter getOrderListParameter);
}