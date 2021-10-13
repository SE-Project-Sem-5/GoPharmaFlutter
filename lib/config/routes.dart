import 'package:flutter/material.dart';
import 'package:go_pharma/bloc/customer/category/category_provider.dart';
import 'package:go_pharma/bloc/customer/prescription_order/prescription_order_provider.dart';
import 'package:go_pharma/bloc/customer/sign_in/sign_in_provider.dart';
import 'package:go_pharma/bloc/customer/sign_up/sign_up_provider.dart';
import 'package:go_pharma/bloc/delivery_agent/pending_delivery/pending_delivery_provider.dart';
import 'package:go_pharma/bloc/delivery_agent/sign_in/sign_in_provider.dart';
import 'package:go_pharma/bloc/delivery_agent/sign_up/sign_up_provider.dart';
import 'package:go_pharma/ui/customer/checkout/address_information.dart';
import 'package:go_pharma/ui/customer/checkout/checkout_receipt.dart';
import 'package:go_pharma/ui/customer/checkout/checkout_upload_prescription.dart';
import 'package:go_pharma/ui/customer/checkout/order_successful_page.dart';
import 'package:go_pharma/ui/customer/checkout/payment_option_selection.dart';
import 'package:go_pharma/ui/customer/confirmed_orders/confirmed_orders_page.dart';
import 'package:go_pharma/ui/customer/customer_starting_page.dart';
import 'package:go_pharma/ui/customer/home/customer_home_page.dart';
import 'package:go_pharma/ui/customer/past_orders/past_orders_page.dart';
import 'package:go_pharma/ui/customer/prescription_order/other_pages/select_zone_page.dart';
import 'package:go_pharma/ui/customer/prescription_order/other_pages/select_photo_screen.dart';
import 'package:go_pharma/ui/customer/processing_orders/processing_orders_page.dart';
import 'package:go_pharma/ui/customer/products/product_home_page.dart';
import 'package:go_pharma/ui/customer/checkout/shopping_cart_page.dart';
import 'package:go_pharma/ui/customer/profile/view_profile.dart';
import 'package:go_pharma/ui/customer/profile/view_security_settings.dart';
import 'package:go_pharma/ui/customer/search_page/search_page.dart';
import 'package:go_pharma/ui/delivery_agent/delivery/deliveries_page.dart';
import 'package:go_pharma/ui/delivery_agent/delivery_agent_starting_page.dart';
import 'package:go_pharma/ui/delivery_agent/delivery_agent_home_page.dart';
import 'package:go_pharma/ui/delivery_agent/settings_page/view_profile.dart';
import 'package:go_pharma/ui/initial_routing_page.dart';

Map<String, Widget Function(BuildContext context)> routes = {
  //start page
  InitialRoutingPage.id: (context) => InitialRoutingPage(),

  //customer pages
  CustomerStartingPage.id: (context) => CustomerStartingPage(),
  CustomerHomePage.id: (context) => CustomerHomePage(),
  ProductHomePage.id: (context) => ProductHomePage(),
  ShoppingCartPage.id: (context) => ShoppingCartPage(),
  SelectPhotoScreen.id: (context) => SelectPhotoScreen(),
  SettingsPage.id: (context) => SettingsPage(),
  CheckoutReceipt.id: (context) => CheckoutReceipt(),
  CategoryProvider.id: (context) => CategoryProvider(),
  SearchPage.id: (context) => SearchPage(),
  PastOrdersPage.id: (context) => PastOrdersPage(),
  ProcessingOrdersPage.id: (context) => ProcessingOrdersPage(),
  ZoneSelectionPage.id: (context) => ZoneSelectionPage(),
  PrescriptionOrderProvider.id: (context) => PrescriptionOrderProvider(),
  ProfileSecuritySettings.id: (context) => ProfileSecuritySettings(),
  CustomerSignUpProvider.id: (contest) => CustomerSignUpProvider(),
  CustomerSignInProvider.id: (context) => CustomerSignInProvider(),
  SelectOrderPrescriptionScreen.id: (context) =>
      SelectOrderPrescriptionScreen(),
  PaymentSelectionPage.id: (context) => PaymentSelectionPage(),
  OrderSuccessfulPage.id: (context) => OrderSuccessfulPage(),
  AddressInformationPage.id: (context) => AddressInformationPage(),
  ConfirmedOrdersPage.id: (context) => ConfirmedOrdersPage(),

  //delivery agent pages
  DeliveryAgentStartingPage.id: (context) => DeliveryAgentStartingPage(),
  DeliveryAgentSignUpProvider.id: (context) => DeliveryAgentSignUpProvider(),
  DeliveryAgentSignInProvider.id: (context) => DeliveryAgentSignInProvider(),
  DeliveryAgentHomePage.id: (context) => DeliveryAgentHomePage(),
  DeliveriesPage.id: (context) => DeliveriesPage(),
  PendingDeliveriesProvider.id: (context) => PendingDeliveriesProvider(),
  DeliveryAgentSettingsPage.id: (context) => DeliveryAgentSettingsPage(),
};
