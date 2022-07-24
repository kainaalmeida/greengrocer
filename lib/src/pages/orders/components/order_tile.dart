import 'package:flutter/material.dart';
import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/models/order_model.dart';
import 'package:greengrocer/src/pages/common_widgets/payment_dialog.dart';
import 'package:greengrocer/src/pages/orders/components/order_status.widget.dart';
import 'package:greengrocer/src/services/util_services.dart';

class OrderTile extends StatelessWidget {
  final OrderModel order;
  OrderTile({
    super.key,
    required this.order,
  });

  final UtilServices utilServices = UtilServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: order.status == 'pending_payment',
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Pedido: ${order.id}'),
              Text(
                utilServices.FormatDateTime(order.createdDateTime),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              )
            ],
          ),
          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: SizedBox(
                        height: 150,
                        child: ListView(
                          children: order.items.map((orderItem) {
                            return _OrderItemWidget(
                              utilServices: utilServices,
                              orderItem: orderItem,
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    VerticalDivider(
                      thickness: 2,
                      width: 8,
                      color: Colors.grey.shade300,
                    ),
                    Expanded(
                      flex: 2,
                      child: OrderStatusWidget(
                        status: order.status,
                        isOverdue: order.overdueDateTime.isBefore(
                          DateTime.now(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //Total
            Text.rich(
              TextSpan(
                style: const TextStyle(
                  fontSize: 20,
                ),
                children: [
                  const TextSpan(
                    text: 'Total ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: utilServices.priceToCurrency(order.total),
                  ),
                ],
              ),
            ),
            //Botão Pagamento
            Visibility(
              visible: order.status == 'pending_payment',
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return PaymentDialog(
                          order: order,
                        );
                      });
                },
                icon: const Icon(Icons.pix),
                label: const Text('Ver QR Code Pix'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrderItemWidget extends StatelessWidget {
  const _OrderItemWidget({
    Key? key,
    required this.utilServices,
    required this.orderItem,
  }) : super(key: key);

  final UtilServices utilServices;
  final CartItemModel orderItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            '${orderItem.quantity} ${orderItem.item.unit} ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(orderItem.item.itemName),
          ),
          Text(
            utilServices.priceToCurrency(
              orderItem.totalPrice(),
            ),
          ),
        ],
      ),
    );
  }
}
