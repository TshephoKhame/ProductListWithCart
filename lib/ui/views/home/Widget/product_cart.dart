import 'package:flutter/material.dart';
import 'package:product_list/ui/common/app_colors.dart';
import 'package:product_list/ui/common/app_constants.dart';
import 'package:product_list/ui/common/ui_helpers.dart';
import 'package:product_list/ui/views/home/home_viewmodel.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductCart extends StatefulWidget {
  final HomeViewModel vm;
  const ProductCart({super.key, required this.vm});

  @override
  State<ProductCart> createState() => _ProductCartState();
}

class _ProductCartState extends State<ProductCart> {
  bool isHovered = false;
  double kcPaddingSmallbuttons = 4;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          color: kcWhite,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Your Cart (${widget.vm.selectedItemsCount})',
                style: const TextStyle(
                  color: kcred,
                  fontSize: kcStyle * 1.5,
                  fontWeight: FontWeight.w700,
                ),
              ),
              verticalSpaceMedium,
              if (widget.vm.selectedItemsCount == 0)
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/illustration-empty-cart.svg',
                      ),
                      verticalSpaceSmall,
                      const Text(
                        'Your added items will appear here',
                        style: TextStyle(
                            color: kcrose500, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: widget.vm.selectedItems.length,
                itemBuilder: (context, index) {
                  final item = widget.vm.selectedItems[index];
                  final data =
                      widget.vm.data.firstWhere((info) => info['name'] == item);
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item,
                                style: const TextStyle(
                                  color: kcrose900,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              verticalSpaceTiny,
                              Row(
                                children: [
                                  Text(
                                    '${data['selected']}x',
                                    style: const TextStyle(
                                      color: kcred,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  horizontalSpaceMedium,
                                  Text(
                                    '@ \$${data['price'].toStringAsFixed(2)}',
                                    style: const TextStyle(),
                                  ),
                                  horizontalSpaceSmall,
                                  Text(
                                    '\$${(data['price'] * data['selected']).toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      color: kcrose900,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          closeButton(item, (data['price'] * data['selected'])),
                        ],
                      ),
                      verticalSpaceTiny,
                      const Divider(
                        color: Color.fromARGB(255, 230, 228, 228),
                      )
                    ],
                  );
                },
              ),
              verticalSpaceSmall,
              if (widget.vm.selectedItemsCount != 0)
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Order Total',
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          '\$${widget.vm.totalAmount.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: kcStyle * 1.5,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                    verticalSpaceMedium,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icon-carbon-neutral.svg',
                        ),
                        horizontalSpaceTiny,
                        const Text(
                          textAlign: TextAlign.center,
                          'This is a carbon-neutral delivery',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    verticalSpaceMedium,
                    confirmButton(),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }

  Widget closeButton(itemName, itemTotal) {
    return MouseRegion(
      onEnter: (_) => setState(
        () => isHovered = true,
      ),
      onExit: (_) => setState(
        () => isHovered = false,
      ),
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: kcrose900,
            width: 1,
          ),
        ),
        child: IconButton(
          hoverColor: kcWhite,
          padding: EdgeInsets.all(kcPaddingSmallbuttons),
          onPressed: () {
            setState(() {
              widget.vm.adjustCart(itemName, itemTotal);
            });
          },
          icon: SvgPicture.asset(
            'assets/icon-remove-item.svg',
            width: 18,
            height: 18,
            color: kcrose900,
          ),
        ),
      ),
    );
  }

  Widget confirmButton() {
    return ElevatedButton(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 32,
          ),
        ),
        backgroundColor: WidgetStateProperty.all(kcred),
      ),
      onPressed: () {
        setState(() {
          widget.vm.showDialog();
        });
      },
      child: const Center(
        child: Text(
          'Confirm Order',
          style: TextStyle(
            color: kcWhite,
            fontFamily: 'RedHatText',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
