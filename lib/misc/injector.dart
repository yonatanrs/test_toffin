import '../data/datasource/orderdatasource/default_order_data_source.dart';
import '../data/datasource/orderdatasource/order_data_source.dart';
import '../data/repository/default_order_repository.dart';
import '../domain/repository/order_repository.dart';
import '../domain/usecase/get_order_list.dart';

class _InjectorImpl {
  OrderDataSource? _orderDataSource;
  OrderDataSource get orderDataSource {
    _orderDataSource ??= DefaultOrderDataSource();
    return _orderDataSource!;
  }

  OrderRepository? _orderRepository;
  OrderRepository get orderRepository {
    _orderRepository ??= DefaultOrderRepository(orderDataSource: orderDataSource);
    return _orderRepository!;
  }

  GetOrderList? _getOrderList;
  GetOrderList get getOrderList {
    _getOrderList ??= GetOrderList(orderRepository: orderRepository);
    return _getOrderList!;
  }
}

// ignore: non_constant_identifier_names
final Injector = _InjectorImpl();