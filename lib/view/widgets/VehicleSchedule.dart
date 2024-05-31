import 'package:flutter/material.dart';

import '../../Constants/ImageAssets.dart';
import '../../Constants/Infos.dart';

class VehicleSchedule extends StatelessWidget {
  const VehicleSchedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Container(
          padding:
          const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(20),
            color: Colors.white
                .withOpacity(0.08),
          ),
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Text(
                'Scheduled vehicles',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(
                    color:
                    Colors.white,
                    fontWeight:
                    FontWeight
                        .bold),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: 380,
                height: 180,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics:
                  const NeverScrollableScrollPhysics(),
                  itemCount:
                  scheduleVehicle
                      .length,
                  itemBuilder:
                      (context, index) {
                    var item =
                    scheduleVehicle[
                    index];
                    return ListTile(
                      leading:
                      Image.asset(
                        vehicle,
                        width: 100,
                      ),
                      title: Text(
                        item['title'],
                        style: Theme.of(
                            context)
                            .textTheme
                            .titleSmall!
                            .copyWith(
                            color: Colors
                                .white),
                      ),
                      subtitle: Text(
                        item['subtitle'],
                        style: Theme.of(
                            context)
                            .textTheme
                            .bodySmall!
                            .copyWith(
                            color: Colors
                                .white54),
                      ),
                      trailing: Text(
                        item['time'],
                        style: Theme.of(
                            context)
                            .textTheme
                            .bodySmall!
                            .copyWith(
                            fontSize:
                            16,
                            color: Colors
                                .white60),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
