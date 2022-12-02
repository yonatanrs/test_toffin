import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/entity/order/get_order_list_response.dart';
import '../../misc/injector.dart';
import '../../misc/load_data_result.dart';
import '../provider/order_list_notifier.dart';
import '../widget/order_item.dart';

class OrderListPage extends StatelessWidget {
  const OrderListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: const Text("Daftar Alamat"),
        backgroundColor: Colors.grey[800],
      ),
      body: ChangeNotifierProvider(
        create: (_) => OrderListNotifier(getOrderList: Injector.getOrderList),
        child: Consumer<OrderListNotifier>(
          builder: (context, orderListNotifier, widget) {
            LoadDataResult<GetOrderListResponse> getOrderListResponse = orderListNotifier.getOrderListResponseLoadDataResult;
            if (getOrderListResponse is IsLoadingLoadDataResult<GetOrderListResponse>) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator()
                  ]
                )
              );
            } else if (getOrderListResponse is SuccessLoadDataResult<GetOrderListResponse>) {
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: getOrderListResponse.value.orderList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      if (index > 0) const SizedBox(height: 16),
                      OrderItem(
                        onTap: (order) => orderListNotifier.selectOrder(order),
                        onDelete: (order) => orderListNotifier.removeOrder(order),
                        order: getOrderListResponse.value.orderList[index]
                      )
                    ],
                  );
                }
              );
            } else if (getOrderListResponse is FailedLoadDataResult<GetOrderListResponse>) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Failed"),
                    Text(getOrderListResponse.e.toString()),
                    Text(getOrderListResponse.stackTrace.toString())
                  ]
                )
              );
            } else {
              return Container();
            }
          },
        ),
      )
    );
  }
}