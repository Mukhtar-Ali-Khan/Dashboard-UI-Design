import 'package:flutter/material.dart';
import '../../Constants/ColorThemes.dart';

class DashboardStacksTile extends StatelessWidget {
  final Map<String, dynamic> item;
  final bool isMobile;
  const DashboardStacksTile(
      {Key? key, required this.item, this.isMobile = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20),
      elevation: 2,
      color: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(isMobile ? 10 : 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white.withOpacity(0.08),
        ),
        child: FittedBox(
          fit: BoxFit.contain,
          child: SizedBox(
            width: 200,
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: item['iconBackground'],
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Image.asset(
                          item['icon'],
                          width: 28,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Text(
                        item['title'],
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: whiteColor),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Text(
                      item['value'],
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: whiteColor),
                    ),
                    const Spacer(),
                    Icon(
                      item['percentage'] < 10
                          ? Icons.keyboard_double_arrow_down
                          : Icons.keyboard_double_arrow_up,
                      color: item['percentage'] < 10 ? red : Colors.green,
                      size: 28,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        '${item['percentage']}%',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: item['percentage'] < 10 ? red : green,
                            fontSize: 20),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
