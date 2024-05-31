import 'package:flutter/material.dart';

import '../../Constants/ColorThemes.dart';
import '../../Constants/Infos.dart';

class MembersListWidget extends StatelessWidget {
  final bool isTablet;
  const MembersListWidget({Key? key, this.isTablet = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                'Schedule members',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            isTablet
                ? GridView.builder(
                    itemCount: scheduleUsers.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 100 / 20,
                    ),
                    itemBuilder: (context, index) {
                      var item = scheduleUsers[index];
                      return buildListTile(item, context);
                    })
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: scheduleUsers.length,
                    itemBuilder: (context, index) {
                      var item = scheduleUsers[index];
                      return buildListTile(item, context);
                    },
                  ),
          ],
        ),
      ),
    );
  }

  ListTile buildListTile(Map<String, dynamic> item, BuildContext context) {
    return ListTile(
      leading: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: pinkColor, width: 1.6),
          image: DecorationImage(
              image: AssetImage(
                item['profile'],
              ),
              fit: BoxFit.cover),
        ),
      ),
      title: Text(
        item['userName'],
        style: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(color: Colors.white),
      ),
      subtitle: Text(
        item['subtitle'],
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: Colors.white54),
      ),
    );
  }
}
