import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/pages/common_widgets/quantity_widget.dart';
import 'package:greengrocer/src/services/util_services.dart';

class CartTile extends StatefulWidget {
  final CartItemModel cartitem;
  final Function(CartItemModel) remove;
  const CartTile({
    super.key,
    required this.cartitem,
    required this.remove,
  });

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  final UtilServices utilServices = UtilServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        //Imagem
        leading: Image.asset(
          widget.cartitem.item.imgUrl,
          height: 60,
          width: 60,
        ),
        //Titulo
        title: Text(
          widget.cartitem.item.itemName,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        //Total
        subtitle: Text(
          utilServices.priceToCurrency(widget.cartitem.totalPrice()),
          style: TextStyle(
            color: CustomColors.customSwatchColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        //Quantidade
        trailing: QuantityWidget(
          value: widget.cartitem.quantity,
          suffixText: widget.cartitem.item.unit,
          result: (quantity) {
            setState(() {
              widget.cartitem.quantity = quantity;

              if (quantity == 0) {
                widget.remove(widget.cartitem);
              }
            });
          },
          isRemovable: true,
        ),
      ),
    );
  }
}
