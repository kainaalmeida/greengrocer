import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/pages/product/product_screen.dart';
import 'package:greengrocer/src/services/util_services.dart';

class ItemTile extends StatefulWidget {
  final ItemModel item;
  final void Function(GlobalKey) cartAnimationMethod;

  const ItemTile({
    super.key,
    required this.item,
    required this.cartAnimationMethod,
  });

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  final GlobalKey imageGk = GlobalKey();

  final UtilServices utilServices = UtilServices();

  IconData tileIcon = Icons.add_shopping_cart;

  Future<void> switchIcon() async {
    setState(() {
      tileIcon = Icons.check;
    });
    await Future.delayed(const Duration(milliseconds: 1500));

    setState(() {
      tileIcon = Icons.add_shopping_cart;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => ProductScreem(
                  item: widget.item,
                ),
              ),
            );
          },
          child: Card(
            elevation: 3,
            shadowColor: Colors.grey.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //Imagem
                  Expanded(
                    child: Hero(
                      tag: widget.item.imgUrl,
                      child: Image.asset(
                        widget.item.imgUrl,
                        key: imageGk,
                      ),
                    ),
                  ),
                  //Nome
                  Text(
                    widget.item.itemName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //Preço
                  Row(
                    children: [
                      Text(
                        utilServices.priceToCurrency(widget.item.price),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: CustomColors.customSwatchColor),
                      ),
                      Text(
                        '/${widget.item.unit}',
                        style: TextStyle(
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    ],
                  ),
                  //Unidade de medida
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 4,
          right: 5,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              topRight: Radius.circular(20),
            ),
            child: Material(
              child: InkWell(
                onTap: () {
                  switchIcon();
                  widget.cartAnimationMethod(imageGk);
                },
                child: Ink(
                  height: 40,
                  width: 35,
                  decoration: BoxDecoration(
                    color: CustomColors.customSwatchColor,
                  ),
                  child: Icon(
                    tileIcon,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
