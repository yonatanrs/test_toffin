import 'package:flutter/material.dart';

import '../../domain/entity/order/order.dart';

class OrderItem extends StatefulWidget {
  final Order order;
  final void Function(Order)? onTap;
  final void Function(Order)? onEdit;
  final void Function(Order)? onDelete;

  const OrderItem({
    super.key,
    required this.order,
    this.onTap,
    this.onEdit,
    this.onDelete
  });

  @override
  State<OrderItem> createState() => OrderItemState();
}

class OrderItemState extends State<OrderItem> {
  final GlobalKey<TooltipState> tooltipKey = GlobalKey<TooltipState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap != null ? () => widget.onTap!(widget.order) : null,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          shape: BoxShape.rectangle,
          border: widget.order.chosen ? Border.all(color: Colors.amber) : null,
          color: Colors.grey[800]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Nama Penerima:", style: TextStyle(color: Colors.amber)),
                      const SizedBox(height: 2),
                      Text(widget.order.receiverName, style: const TextStyle(color: Colors.white)),
                    ]
                  )
                ),
                if (widget.order.chosen)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      shape: BoxShape.rectangle,
                      color: Colors.green
                    ),
                    child: const Text("Alamat Terpilih", style: TextStyle(color: Colors.white),)
                  )
              ]
            ),
            const SizedBox(height: 20),
            Text(widget.order.address, style: const TextStyle(color: Colors.white)),
            const SizedBox(height: 10),
            Text(widget.order.phoneNumber, style: const TextStyle(color: Colors.white)),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.location_on, color: Colors.amber),
                          SizedBox(width: 10),
                          Text("Sudah pinpoint", style: TextStyle(color: Colors.white)),
                        ]
                      ),
                      const SizedBox(width: 10),
                      const Text("|", style: TextStyle(color: Colors.white)),
                      Tooltip(
                        key: tooltipKey,
                        message: "Tombol Edit tidak tertera pada soal.",
                        showDuration: const Duration(seconds: 3),
                        triggerMode: TooltipTriggerMode.manual,
                        child: GestureDetector(
                          onTap: () => tooltipKey.currentState?.ensureTooltipVisible(),
                          behavior: HitTestBehavior.opaque,
                          child: Row(
                            children: const [
                              SizedBox(width: 10),
                              Text("Edit", style: TextStyle(color: Colors.amber)),
                              SizedBox(width: 10),
                            ]
                          ),
                        ),
                      ),
                      const Text("|", style: TextStyle(color: Colors.white)),
                      GestureDetector(
                        onTap: widget.onDelete != null ? () => widget.onDelete!(widget.order) : null,
                        behavior: HitTestBehavior.opaque,
                        child: Row(
                          children: const [
                            SizedBox(width: 10),
                            Text("Hapus", style: TextStyle(color: Colors.red)),
                            SizedBox(width: 10),
                          ]
                        ),
                      )
                    ]
                  ),
                ),
                if (!widget.order.chosen)
                  GestureDetector(
                    onTap: widget.onTap != null ? () => widget.onTap!(widget.order) : null,
                    behavior: HitTestBehavior.opaque,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        shape: BoxShape.rectangle,
                        color: Colors.amber
                      ),
                      child: const Text("Pilih")
                    ),
                  )
              ],
            )
          ]
        )
      ),
    );
  }
}