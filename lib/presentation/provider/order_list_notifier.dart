import 'package:flutter/material.dart';

import '../../domain/entity/order/get_order_list_parameter.dart';
import '../../domain/entity/order/get_order_list_response.dart';
import '../../domain/entity/order/order.dart';
import '../../domain/usecase/get_order_list.dart';
import '../../misc/load_data_result.dart';

class OrderListNotifier extends ChangeNotifier {
  final GetOrderList getOrderList;

  LoadDataResult<GetOrderListResponse> get getOrderListResponseLoadDataResult => _getOrderListResponseLoadDataResult;
  LoadDataResult<GetOrderListResponse> _getOrderListResponseLoadDataResult = NoLoadDataResult<GetOrderListResponse>();

  OrderListNotifier({
    required this.getOrderList
  }) {
    getOrderListResult(GetOrderListParameter());
  }

  void getOrderListResult(GetOrderListParameter getOrderListParameter) async {
    _getOrderListResponseLoadDataResult = IsLoadingLoadDataResult<GetOrderListResponse>();
    notifyListeners();
    _getOrderListResponseLoadDataResult = await getOrderList.execute(getOrderListParameter);
    notifyListeners();
  }

  void selectOrder(Order order) {
    if (_getOrderListResponseLoadDataResult is SuccessLoadDataResult<GetOrderListResponse>) {
      Order chosenOrder = order;
      List<Order> orderList = (_getOrderListResponseLoadDataResult as SuccessLoadDataResult<GetOrderListResponse>).value.orderList;
      for (var iteratedOrder in orderList) {
        iteratedOrder.chosen = false;
      }
      orderList.remove(chosenOrder);
      orderList.insert(0, chosenOrder);
      chosenOrder.chosen = true;
      notifyListeners();
    }
  }

  void removeOrder(Order order) {
    if (_getOrderListResponseLoadDataResult is SuccessLoadDataResult<GetOrderListResponse>) {
      List<Order> orderList = (_getOrderListResponseLoadDataResult as SuccessLoadDataResult<GetOrderListResponse>).value.orderList;
      orderList.remove(order);
      if (orderList.isNotEmpty) {
        orderList[0].chosen = true;
      }
      notifyListeners();
    }
  }
}