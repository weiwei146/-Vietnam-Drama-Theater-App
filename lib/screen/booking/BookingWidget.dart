// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class BookingWidget extends StatefulWidget {
//   ItemGridSeatSlotVM itemGridSeatSlotVM;
//
//   BookingWidget({required this.itemGridSeatSlotVM});
//
//   @override
//   _BookingWidgetState createState() => _BookingWidgetState();
// }
//
// class _BookingWidgetState extends State<BookingWidget> {
//   late ItemGridSeatSlotVM itemGridSeatSlotVM;
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     itemGridSeatSlotVM = widget.itemGridSeatSlotVM;
//
//     return Container(
//       color: Colors.white,
//       padding: EdgeInsets.all(20),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Text(itemGridSeatSlotVM.seatTypeName),
//           WidgetSpacer(height: 14),
//           _buildSlotGrid(),
//         ],
//       ),
//     );
//   }
//
//   _buildSlotGrid() {
//     return ConstrainedBox(
//       constraints: BoxConstraints(
//         minHeight: 40,
//         maxHeight: 200,
//       ),
//       child: GridView.count(
//         shrinkWrap: true,
//         physics: NeverScrollableScrollPhysics(),
//         crossAxisCount: itemGridSeatSlotVM.maxColumn,
//         scrollDirection: Axis.vertical,
//         childAspectRatio: 1,
//         crossAxisSpacing: 7,
//         mainAxisSpacing: 7,
//         children: _generatedGrid(),
//       ),
//     );
//   }
//
//   List<Widget> _generatedGrid() {
//     List<Widget> widgets = [];
//
//     itemGridSeatSlotVM.seatRowVMs.forEach((itemSeatRowVM) {
//       //ITEM ROW NAME
//       var itemRowName = Container(
//         child: Align(
//           alignment: Alignment.centerLeft,
//           child: Text(
//             itemSeatRowVM.itemRowName,
//           ),
//         ),
//       );
//
//       widgets.add(itemRowName);
//
//       //ITEM SEAT SLOT
//       List<Widget> widgetSeatSlots = itemSeatRowVM.seatSlotVMs.map(
//             (itemSeatSlotVM) {
//           var itemBgColor = Colors.white;
//           var itemBorderColor = Colors.black;
//
//           if (itemSeatSlotVM.isBooked) {
//             itemBgColor = Colors.red;
//           }
//
//           if (itemSeatSlotVM.isSelected) {
//             itemBgColor = Colors.green;
//             itemBorderColor = Colors.transparent;
//           }
//
//           var itemAvailable = GestureDetector(
//             onTap: () {
//               _handleSelectSeat(itemSeatSlotVM);
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                 color: itemBgColor,
//                 borderRadius: BorderRadius.circular(4),
//                 border: Border.all(
//                   color: itemBorderColor,
//                   width: 1,
//                 ),
//               ),
// //            child: Center(child: Text('${seatRow.rowId}${i + 1}')),
//             ),
//           );
//
//           var itemEmpty = Container();
//
//           return itemSeatSlotVM.isOff ? itemEmpty : itemAvailable;
//         },
//       ).toList();
//
//       widgets.addAll(widgetSeatSlots);
//     });
//
//     return widgets;
//   }
//
//   _handleSelectSeat(ItemSeatSlotVM itemSeatSlotVM) {
//     BlocProvider.of<BookSeatSlotBloc>(context)
//         .add(ClickSelectSeatSlot(itemSeatSlotVM: itemSeatSlotVM));
//   }
// }
