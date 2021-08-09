import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/checkout/checkout_bloc.dart';
import 'package:go_pharma/bloc/customer/checkout/checkout_state.dart';
import 'package:go_pharma/ui/common/widgets/back_button.dart';
import 'package:go_pharma/ui/customer/products/components/shopping_cart.dart';

class ShoppingCartAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ShoppingCartAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: CustomBackButton(),
      actions: [
        BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (context, state) {
            return ShoppingCart(
              itemCount: state.productList.length,
            );
          },
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(75);
}
