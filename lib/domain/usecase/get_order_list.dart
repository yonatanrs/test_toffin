import '../../misc/load_data_result.dart';
import '../entity/order/get_order_list_parameter.dart';
import '../entity/order/get_order_list_response.dart';
import '../repository/order_repository.dart';

class GetOrderList {
  final OrderRepository orderRepository;

  GetOrderList({
    required this.orderRepository
  });

  Future<LoadDataResult<GetOrderListResponse>> execute(GetOrderListParameter getOrderListParameter) {
    return orderRepository.getOrderList(getOrderListParameter);
  }
}