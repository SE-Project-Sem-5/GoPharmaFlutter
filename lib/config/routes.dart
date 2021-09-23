import 'package:flutter/material.dart';
import 'package:go_pharma/ui/customer/checkout/checkout_receipt.dart';
import 'package:go_pharma/ui/customer/checkout/checkout_start.dart';
import 'package:go_pharma/ui/customer/current_orders/current_orders_page.dart';
import 'package:go_pharma/ui/customer/customer_starting_page.dart';
import 'package:go_pharma/ui/customer/home/customer_home_page.dart';
import 'package:go_pharma/ui/customer/past_orders/past_orders_page.dart';
import 'package:go_pharma/ui/customer/prescription_order/other_pages/zone_select_page.dart';
import 'package:go_pharma/ui/customer/prescription_order/other_pages/select_photo_screen.dart';
import 'package:go_pharma/ui/customer/prescription_order/prescription_order.dart';
import 'package:go_pharma/ui/customer/products/product_categories/categories_routing_page.dart';
import 'package:go_pharma/ui/customer/products/product_home_page.dart';
import 'package:go_pharma/ui/customer/checkout/shopping_cart_page.dart';
import 'package:go_pharma/ui/customer/profile/view_profile.dart';
import 'package:go_pharma/ui/customer/search_page/search_page.dart';
import 'package:go_pharma/ui/customer/sign_in/customer_sign_in.dart';
import 'package:go_pharma/ui/customer/sign_up/customer_sign_up.dart';
import 'package:go_pharma/ui/delivery_agent/delivery/deliveries_page.dart';
import 'package:go_pharma/ui/delivery_agent/delivery_agent_starting_page.dart';
import 'package:go_pharma/ui/delivery_agent/delivery_agent_home_page.dart';
import 'package:go_pharma/ui/delivery_agent/sign_in/delivery_agent_sign_in.dart';
import 'package:go_pharma/ui/delivery_agent/sign_up/delivery_agent_sign_up.dart';
import 'package:go_pharma/ui/initial_routing_page.dart';

Map<String, Widget Function(BuildContext context)> routes = {
  //start page
  InitialRoutingPage.id: (context) => InitialRoutingPage(),

  //customer pages
  CustomerStartingPage.id: (context) => CustomerStartingPage(),
  CustomerSignInStart.id: (context) => CustomerSignInStart(),
  CustomerSignUpStart.id: (context) => CustomerSignUpStart(),
  CustomerHomePage.id: (context) => CustomerHomePage(),
  ProductHomePage.id: (context) => ProductHomePage(),
  ShoppingCartPage.id: (context) => ShoppingCartPage(),
  SelectPhotoScreen.id: (context) => SelectPhotoScreen(),
  SettingsPage.id: (context) => SettingsPage(),
  CheckoutStart.id: (context) => CheckoutStart(),
  CheckoutReceipt.id: (context) => CheckoutReceipt(),
  ProductCategoriesPage.id: (context) => ProductCategoriesPage(),
  SearchPage.id: (context) => SearchPage(),
  PastOrdersPage.id: (context) => PastOrdersPage(),
  CurrentOrdersPage.id: (context) => CurrentOrdersPage(),
  ZoneSelectionPage.id: (context) => ZoneSelectionPage(),
  PrescriptionOrderPage.id: (context) => PrescriptionOrderPage(),

  //delivery agent pages
  DeliveryAgentStartingPage.id: (context) => DeliveryAgentStartingPage(),
  DeliveryAgentSignUpStart.id: (context) => DeliveryAgentSignUpStart(),
  DeliveryAgentSignInStart.id: (context) => DeliveryAgentSignInStart(),
  DeliveryAgentHomePage.id: (context) => DeliveryAgentHomePage(),
  DeliveriesPage.id: (context) => DeliveriesPage(),
};
