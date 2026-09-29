import 'package:contactapp/core/theme/app_assets.dart';
import 'package:contactapp/core/theme/app_colors.dart';
import 'package:contactapp/features/home_screen/widgets/bottom_sheet_widget.dart';
import 'package:contactapp/features/home_screen/widgets/contact_card.dart';
import 'package:contactapp/features/home_screen/widgets/empty_list.dart';

import 'package:flutter/material.dart';

import '../../model/contact.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = 'Home-Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AppAssets.routeTitle),
              Contact.contacts.isEmpty
                  ? const Expanded(child: EmptyList())
                  : Expanded(
                child: GridView.builder(
                  padding:  EdgeInsets.all(16),

                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
                  (crossAxisCount: 2,crossAxisSpacing: 16,mainAxisSpacing: 16,childAspectRatio: 0.7),
                    itemCount: Contact.contacts.length,
                    itemBuilder: (context,index)=>
                        ContactCard(contact: Contact.contacts[index],
                        onDeleteClicked: (){
                          Contact.contacts.removeAt(index);
                          setState(() {

                          });
                        })),
              )

            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Visibility(
            visible:   Contact.contacts.isNotEmpty,
            child: FloatingActionButton(
                backgroundColor: AppColors.red,
                foregroundColor: AppColors.white ,
                onPressed: () {
                  Contact.contacts.removeLast();
                  setState(() {});

                },
                child: const Icon(Icons.delete,)
            ),
          ),
          SizedBox(height: 8,),

          Visibility(
            visible: Contact.contacts.length <=3,

            child: FloatingActionButton(
                backgroundColor: AppColors.gold,
                foregroundColor: AppColors.darkBlue,
                onPressed: () {
                  _showModalBottomSheet();
                },
                child: const Icon(Icons.add,)
            ),
          ),


        ],
      ),
    );
  }

  Future<void> _showModalBottomSheet() async{
    await showModalBottomSheet(
        backgroundColor: AppColors.darkBlue,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        )),
        context: context,
        builder: (context) => const BottomSheetWidget());
    setState(() {});
  }
}
