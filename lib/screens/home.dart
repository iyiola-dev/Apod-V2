import 'package:APOD/utils/constants/providers.dart';
import 'package:APOD/utils/widgets/bodyBuilder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final viewModel = watch(home);
    String firstDate = viewModel.formatter.format(viewModel.startDate);
    String secondDate = viewModel.formatter.format(viewModel.endDate);
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
                    child: Center(
                        child: Text(
                      firstDate,
                      style: TextStyle(color: Colors.white.withOpacity(0.6)),
                    )),
                  ),
                ),
                SizedBox(
                  width: 20,
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
                    child: Center(
                        child: Text(
                      secondDate,
                      style: TextStyle(color: Colors.white.withOpacity(0.6)),
                    )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            BodyBuilder(
              child: SizedBox.shrink(),
              apiRequestStatus: viewModel.status,
              loadingWidget: Center(
                child: CircularProgressIndicator(),
              ),
              initialWidget: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.white.withOpacity(0.6),
                  onPressed: () => context.read(home).getApod(context),
                  child: Text('Next')),
              error: viewModel.error,
              reload: () => context.read(home).getApod(context),
            )
          ],
        ),
      ),
    );
  }
}
