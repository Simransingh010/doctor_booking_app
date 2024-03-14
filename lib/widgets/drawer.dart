import 'package:doctor_booking_app/models/drawer_model.dart';
import 'package:flutter/material.dart';

class Drawers extends StatelessWidget {
  const Drawers({
    required this.tiles,
    super.key,
  });
  final List<DrawerTile> tiles;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.only(top: 7),
              child: Image.asset(
                "assets/Images/profileIcon.png",
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                'Simranpreet Singh',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
              ),
            ),
            subtitle: Text(
              'View and Edit Profile',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blue,
                    color: Colors.blue,
                  ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
            ),
          ),
          const Divider(
            thickness: 0,
            height: 10,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: tiles.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: ListTile(
                      // leading: Icon(Icons.arrow_forward_ios_rounded),
                      leading: Image.asset(
                        tiles[index].imageUrl,
                        cacheHeight: 30,
                      ),
                      title: Text(
                        tiles[index].titleText,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 20,
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
