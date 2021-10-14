// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_pharma/bloc/delivery_agent/delivery_list/delivery_list_bloc.dart';
// import 'package:go_pharma/bloc/delivery_agent/delivery_list/delivery_list_event.dart';
// import 'package:go_pharma/bloc/delivery_agent/navigation/delivery_navigation_bloc.dart';
// import 'package:go_pharma/ui/delivery_agent/pending_deliveries/pending_deliveries_page.dart';
// import 'package:go_pharma/ui/delivery_agent/settings_page/view_profile.dart';
//
// import 'components/bottom_navigation_bar.dart';
// import 'delivery/deliveries_page.dart';
//
// class DeliveryAgentHomePage extends StatelessWidget {
//   static const id = "delivery_agent_home_page";
//   final String title = "Delivery Agent Home Page";
//
//   @override
//   Widget build(BuildContext context) {
//     final deliveryListBloc = BlocProvider.of<DeliveryListBloc>(context);
//     deliveryListBloc.add(
//       GetAllConfirmedOrders(
//         deliveryAgentID: 10,
//         deliveryAgentHomeAddressID: 3,
//       ),
//     );
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<DeliveryNavigationBloc>(
//           create: (context) => DeliveryNavigationBloc(
//             context,
//           ),
//         ),
//       ],
//       child: WillPopScope(
//         onWillPop: () async {
//           bool willLeave = false;
//           // show the confirm dialog
//           await showDialog(
//             context: context,
//             builder: (_) => AlertDialog(
//               title: Text(
//                 'Are you sure want to leave?',
//               ),
//               actions: [
//                 ElevatedButton(
//                   child: Text('Yes'),
//                   onPressed: () {
//                     willLeave = true;
//                     Navigator.of(context).pop();
//                   },
//                 ),
//                 TextButton(
//                   child: Text('No'),
//                   onPressed: () => Navigator.of(context).pop(),
//                 ),
//               ],
//             ),
//           );
//           return willLeave;
//         },
//         child: SafeArea(
//           child: Scaffold(
//             appBar: AppBar(
//               leading: Container(),
//               title: Row(
//                 children: [
//                   BlocBuilder<DeliveryNavigationBloc, DeliveryNavigationState>(
//                     builder: (context, state) {
//                       return Text(
//                         state.title,
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//             body: Padding(
//               padding: EdgeInsets.all(10.0),
//               child: Column(
//                 children: [
//                   BlocBuilder<DeliveryNavigationBloc, DeliveryNavigationState>(
//                     builder: (context, state) {
//                       return _stackedContainers(state.index);
//                     },
//                   ),
//                 ],
//               ),
//             ),
//             bottomNavigationBar: DeliveryAgentBottomNavigationBar(),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _stackedContainers(int index) {
//     return Expanded(
//       child: IndexedStack(
//         index: index,
//         children: <Widget>[
//           PendingDeliveriesPage(),
//           DeliveriesPage(),
//           DeliveryAgentSettingsPage(),
//         ],
//       ),
//     );
//   }
// }
