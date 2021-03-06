import 'package:flutter/material.dart';
import 'package:go_pharma/bloc/customer/category/category_provider.dart';
import 'package:go_pharma/bloc/customer/prescription_order/prescription_order_provider.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery_list/delivery_list_provider.dart';
import 'package:go_pharma/ui/customer/checkout/address_information.dart';
import 'package:go_pharma/ui/customer/checkout/checkout_receipt.dart';
import 'package:go_pharma/ui/customer/checkout/checkout_upload_prescription.dart';
import 'package:go_pharma/ui/customer/checkout/order_successful_page.dart';
import 'package:go_pharma/ui/customer/checkout/payment_option_selection.dart';
import 'package:go_pharma/ui/customer/confirmed_orders/confirmed_orders_page.dart';
import 'package:go_pharma/ui/customer/customer_starting_page.dart';
import 'package:go_pharma/ui/customer/customer_home_page.dart';
import 'package:go_pharma/ui/customer/past_orders/past_orders_page.dart';
import 'package:go_pharma/ui/customer/prescription_order/other_pages/select_zone_page.dart';
import 'package:go_pharma/ui/customer/prescription_order/other_pages/select_photo_screen.dart';
import 'package:go_pharma/ui/customer/processing_orders/normal_orders/processing_normal_orders_page.dart';
import 'package:go_pharma/ui/customer/processing_orders/prescription_orders/processing_prescription_orders_page.dart';
import 'package:go_pharma/ui/customer/processing_orders/select_order_type.dart';
import 'package:go_pharma/ui/customer/products/product_home_page.dart';
import 'package:go_pharma/ui/customer/checkout/shopping_cart_page.dart';
import 'package:go_pharma/ui/customer/profile/view_profile.dart';
import 'package:go_pharma/ui/customer/profile/view_security_settings.dart';
import 'package:go_pharma/ui/customer/search_page/search_page_routing.dart';
import 'package:go_pharma/ui/customer/sign_in/customer_sign_in_2fa.dart';
import 'package:go_pharma/ui/customer/sign_in/customer_sign_in.dart';
import 'package:go_pharma/ui/customer/sign_in/forgot_password_page.dart';
import 'package:go_pharma/ui/customer/sign_up/customer_sign_up_information.dart';
import 'package:go_pharma/ui/customer/sign_up/enable_two_fa_question.dart';
import 'package:go_pharma/ui/customer/sign_up/sign_up_start.dart';
import 'package:go_pharma/ui/customer/sign_up/verify_email_address.dart';
import 'package:go_pharma/ui/delivery_agent/collected_deliveries/collected_deliveries_page.dart';
import 'package:go_pharma/ui/delivery_agent/delivery/deliveries_page.dart';
import 'package:go_pharma/ui/delivery_agent/delivery_agent_starting_page.dart';
import 'package:go_pharma/ui/delivery_agent/pending_deliveries/pending_deliveries_page.dart';
import 'package:go_pharma/ui/delivery_agent/reserved_deliveries/reserved_deliveries_page.dart';
import 'package:go_pharma/ui/delivery_agent/returned_orders/orders_available_for_reservation/return_to_be_reserved_deliveries_page.dart';
import 'package:go_pharma/ui/delivery_agent/returned_orders/orders_to_be_collected_from_customer/return_reserved_deliveries_page.dart';
import 'package:go_pharma/ui/delivery_agent/returned_orders/orders_to_be_returned_to_supplier/return_collected_deliveries_page.dart';
import 'package:go_pharma/ui/delivery_agent/settings_page/view_profile.dart';
import 'package:go_pharma/ui/delivery_agent/shipped_deliveries/shipped_deliveries_page.dart';
import 'package:go_pharma/ui/delivery_agent/sign_in/delivery_agent_sign_in.dart';
import 'package:go_pharma/ui/delivery_agent/sign_in/delivery_agent_sign_in_2fa.dart';
import 'package:go_pharma/ui/delivery_agent/transient_collected_deliveries/transient_collected_deliveries_page.dart';
import 'package:go_pharma/ui/delivery_agent/transient_deliveries/transient_deliveries_page.dart';
import 'package:go_pharma/ui/initial_routing_page.dart';
import 'package:go_pharma/ui/start_up_page.dart';

Map<String, Widget Function(BuildContext context)> routes = {
  //start page
  InitialRoutingPage.id: (context) => InitialRoutingPage(),
  AppStartUpPage.id: (context) => AppStartUpPage(),

  //customer pages
  CustomerStartingPage.id: (context) => CustomerStartingPage(),
  CustomerHomePage.id: (context) => CustomerHomePage(),
  ProductHomePage.id: (context) => ProductHomePage(),
  ShoppingCartPage.id: (context) => ShoppingCartPage(),
  SelectPhotoScreen.id: (context) => SelectPhotoScreen(),
  SettingsPage.id: (context) => SettingsPage(),
  CheckoutReceipt.id: (context) => CheckoutReceipt(),
  CategoryProvider.id: (context) => CategoryProvider(),
  PastOrdersPage.id: (context) => PastOrdersPage(),
  ProcessingNormalOrdersPage.id: (context) => ProcessingNormalOrdersPage(),
  ProcessingPrescriptionOrdersPage.id: (context) =>
      ProcessingPrescriptionOrdersPage(),
  ZoneSelectionPage.id: (context) => ZoneSelectionPage(),
  PrescriptionOrderProvider.id: (context) => PrescriptionOrderProvider(),
  ProfileSecuritySettings.id: (context) => ProfileSecuritySettings(),
  SelectOrderPrescriptionScreen.id: (context) =>
      SelectOrderPrescriptionScreen(),
  PaymentSelectionPage.id: (context) => PaymentSelectionPage(),
  OrderSuccessfulPage.id: (context) => OrderSuccessfulPage(),
  AddressInformationPage.id: (context) => AddressInformationPage(),
  ConfirmedOrdersPage.id: (context) => ConfirmedOrdersPage(),
  SelectProcessingOrderType.id: (context) => SelectProcessingOrderType(),
  ForgotPasswordPage.id: (context) => ForgotPasswordPage(),
  SearchPageRouting.id: (context) => SearchPageRouting(),

  //Customer sign up
  CustomerSignUpPage.id: (context) => CustomerSignUpPage(),
  SignUpInformation.id: (context) => SignUpInformation(),
  EnableTwoFAQuestion.id: (context) => EnableTwoFAQuestion(),
  VerifyEmailAddress.id: (context) => VerifyEmailAddress(),

  //Customer sign in
  CustomerSignInPage.id: (context) => CustomerSignInPage(),
  CustomerSignIn2FA.id: (context) => CustomerSignIn2FA(),
  //delivery agent pages
  DeliveryAgentStartingPage.id: (context) => DeliveryAgentStartingPage(),
  DeliveryAgentSignInPage.id: (context) => DeliveryAgentSignInPage(),
  DeliveryAgentSignIn2FA.id: (context) => DeliveryAgentSignIn2FA(),
  DeliveriesPage.id: (context) => DeliveriesPage(),
  PendingDeliveriesPage.id: (context) => PendingDeliveriesPage(),
  ReservedDeliveriesPage.id: (context) => ReservedDeliveriesPage(),
  CollectedDeliveriesPage.id: (context) => CollectedDeliveriesPage(),
  TransientDeliveriesPage.id: (context) => TransientDeliveriesPage(),
  TransientCollectedDeliveriesPage.id: (context) =>
      TransientCollectedDeliveriesPage(),
  ShippedDeliveriesPage.id: (context) => ShippedDeliveriesPage(),
  DeliveryListProvider.id: (context) => DeliveryListProvider(),
  DeliveryAgentSettingsPage.id: (context) => DeliveryAgentSettingsPage(),
  ReturnToBeReservedDeliveriesPage.id: (context) =>
      ReturnToBeReservedDeliveriesPage(),
  ReturnReservedDeliveriesPage.id: (context) => ReturnReservedDeliveriesPage(),
  ReturnCollectedDeliveriesPage.id: (context) =>
      ReturnCollectedDeliveriesPage(),
};
