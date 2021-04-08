import 'package:APOD/utils/constants/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final viewModel = watch(home);
    String firstDate = viewModel.formatter.format(viewModel.startDate);
    String secondDate = viewModel.formatter.format(viewModel.endDate);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    context.read(home).getStartDate(context);
                  },
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Text(firstDate),
                  ),
                ),
                Text(
                  '\n-',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {
                    context.read(home).getEndDate(context);
                  },
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Text(secondDate),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
