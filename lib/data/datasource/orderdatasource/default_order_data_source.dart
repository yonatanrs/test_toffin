import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../domain/entity/order/get_order_list_parameter.dart';
import '../../../domain/entity/order/get_order_list_response.dart';
import '../../../domain/entity/order/order.dart';
import '../../../misc/error/message_error.dart';
import 'order_data_source.dart';

class DefaultOrderDataSource extends OrderDataSource {
  @override
  Future<GetOrderListResponse> getOrderList(GetOrderListParameter getOrderListParameter) async {
    String localOrderString = await rootBundle.loadString('asset/data.json');
    dynamic localOrderJson = json.decode(localOrderString);
    if (localOrderJson is List) {
      List<Order> orderList = [];
      for (var singleLocalOrderJson in localOrderJson) {
        orderList.add(
          Order(
            receiverName: singleLocalOrderJson["nama_penerima"],
            address: singleLocalOrderJson["alamat"],
            phoneNumber: singleLocalOrderJson["no_hp"],
            note: singleLocalOrderJson["catatan"],
            chosen: singleLocalOrderJson["chosen"]
          )
        );
      }
      return GetOrderListResponse(orderList: orderList);
    }

    throw MessageError(title: "Not Found", message: "Items is empty.");
  }
}