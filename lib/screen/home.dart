import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/linecons_icons.dart';

class HomeWidget extends ConsumerStatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeWidget> createState() => HomeWidgetState();
}

class HomeWidgetState extends ConsumerState<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            onChanged: (value) async {
              if (value.length >= 3) {
                // final AddressRepository addressRepository = AddressRepository();
                // // Méthode 1
                // List<Address> addresses =
                //     await addressRepository.fetchAddresses(value);
                setState(() {
                  // _addresses = addresses;
                });
              }
            },
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 50,
              itemBuilder: (context, index) {
                // final Address address = _addresses[index];
                return ListTile(
                  title: Text("test"),
                  subtitle: Text('testtest'),
                  onTap: () {
                    // ref.read(LocationProvider.notifier).add(address);
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(height: 0);
              },
            ),
          )
        ],
      ),
    );
  }
}
