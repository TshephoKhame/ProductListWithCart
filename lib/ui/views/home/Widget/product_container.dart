import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:product_list/ui/common/app_colors.dart';
import 'package:product_list/ui/common/app_constants.dart';
import 'package:product_list/ui/common/ui_helpers.dart';
import 'package:product_list/ui/views/home/home_viewmodel.dart';

class ProductContainer extends StatefulWidget {
  final HomeViewModel vm;
  final Map<String, dynamic> info;
  const ProductContainer({super.key, required this.vm, required this.info});

  @override
  State<ProductContainer> createState() => _ProductContainerState();
}

class _ProductContainerState extends State<ProductContainer> {
  bool isAdded = false;
  double kcPaddingSmallbuttons = 4;
  bool isHovered = false;
  bool isHoveredTwo = false;
  bool addIsHovered = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                clipBehavior: Clip.hardEdge,
                child: Image.asset(
                  widget.info['image']['desktop'],
                  fit: BoxFit.fitWidth,
                ),
              ),
              Positioned(
                bottom: -20,
                left: 35,
                child: isAdded ? adjustCartButton() : addCartButton(),
              ),
            ],
          ),
          verticalSpaceMedium,
          verticalSpaceSmall,
          Text(
            widget.info['category'],
            style: const TextStyle(
              fontSize: 13,
              color: Color.fromARGB(255, 155, 154, 154),
            ),
          ),
          Text(
            widget.info['name'],
            style: const TextStyle(
                fontSize: kcStyle,
                color: kcrose900,
                fontWeight: FontWeight.w600),
          ),
          Text(
            "\$${widget.info['price'].toStringAsFixed(2)}",
            style: const TextStyle(
              fontSize: kcStyle,
              color: kcred,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget addCartButton() {
    return MouseRegion(
      onEnter: (_) => setState(
        () => addIsHovered = true,
      ),
      onExit: (_) => setState(
        () => addIsHovered = false,
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 32,
            ),
          ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
              side: addIsHovered
                  ? const BorderSide(color: kcred)
                  : const BorderSide(color: kcrose900),
            ),
          ),
        ),
        onPressed: () {
          setState(() {
            isAdded = !isAdded;
            widget.vm.incrementItem(widget.info['name']);
          });
        },
        child: Center(
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/icon-add-to-cart.svg',
                width: 24,
                height: 24,
              ),
              horizontalSpaceSmall,
              Text(
                'Add to Cart',
                style: TextStyle(
                  color: addIsHovered ? kcred : kcBlack,
                  fontFamily: 'RedHatText',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget adjustCartButton() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: kcred,
      ),
      height: 50,
      width: 170,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            iconContainer(
              'sub',
              () {
                if (widget.info['selected'] == 1) {
                  isAdded = !isAdded;
                  widget.vm.selectedItems.remove(widget.info['name']);
                }
                widget.vm.decrementItem(widget.info['name']);
              },
              'assets/icon-decrement-quantity.svg',
            ),
            horizontalSpaceSmall,
            Text(
              widget.info['selected'].toString(),
              style: const TextStyle(
                color: kcWhite,
              ),
            ),
            horizontalSpaceSmall,
            iconContainer(
              'add',
              () => widget.vm.incrementItem(widget.info['name']),
              'assets/icon-increment-quantity.svg',
            ),
          ],
        ),
      ),
    );
  }

  Widget iconContainer(
      String type, VoidCallback productCommand, String productSvgImage) {
    return MouseRegion(
      onEnter: (_) => setState(
        type == 'add' ? () => isHovered = true : () => isHoveredTwo = true,
      ),
      onExit: (_) => setState(
        type == 'add' ? () => isHovered = false : () => isHoveredTwo = false,
      ),
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: kcWhite,
            width: 1,
          ),
        ),
        child: IconButton(
          hoverColor: kcWhite,
          padding: EdgeInsets.all(kcPaddingSmallbuttons),
          onPressed: () {
            setState(() {
              productCommand();
            });
          },
          icon: SvgPicture.asset(
            productSvgImage,
            width: 18,
            height: 18,
            color: type == 'add'
                ? isHovered
                    ? Colors.red
                    : null
                : isHoveredTwo
                    ? Colors.red
                    : null,
          ),
        ),
      ),
    );
  }
}
