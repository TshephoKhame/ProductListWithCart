import 'package:flutter/material.dart';
import 'package:product_list/ui/common/app_constants.dart';
import 'package:product_list/ui/common/ui_helpers.dart';
import 'package:product_list/ui/views/home/Widget/product_container.dart';
import 'package:product_list/ui/views/home/home_viewmodel.dart';

class ProductList extends StatefulWidget {
  final HomeViewModel vm;
  const ProductList({super.key, required this.vm});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: CustomScrollView(
        scrollBehavior:
            const MaterialScrollBehavior().copyWith(scrollbars: false),
        slivers: [
          const SliverToBoxAdapter(
            child: Text(
              'Desserts',
              style:
                  TextStyle(fontSize: kcStyle * 2, fontWeight: FontWeight.w900),
            ),
          ),
          const SliverToBoxAdapter(
            child: verticalSpaceMedium,
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: screenWidth(context) > 1350
                  ? 3
                  : screenWidth(context) > 1120
                      ? 2
                      : 1,
              childAspectRatio: 1,
              crossAxisSpacing: 25,
              mainAxisSpacing: 25,
              mainAxisExtent: 340,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                Map<String, dynamic> data = widget.vm.data.toList()[index];
                return ProductContainer(vm: widget.vm, info: data);
              },
              childCount: widget.vm.data.length,
            ),
          ),
        ],
      ),
    );
  }
}
