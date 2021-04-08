import 'package:APOD/networking/apiRequestStatus.dart';
import 'package:flutter/material.dart';

class BodyBuilder extends StatelessWidget {
  final ApiRequestStatus apiRequestStatus;
  final Widget child;
  final Widget loadingWidget;
  final Function reload;
  final Widget initialWidget;
  final String error;

  BodyBuilder(
      {Key key,
      @required this.error,
      @required this.initialWidget,
      @required this.apiRequestStatus,
      @required this.child,
      @required this.loadingWidget,
      @required this.reload})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    switch (apiRequestStatus) {
      case ApiRequestStatus.loading:
        return loadingWidget;
        break;
      case ApiRequestStatus.uninitialized:
        return initialWidget;
        break;

      case ApiRequestStatus.error:
        return errror(error, context, reload) as Widget;
        break;
      case ApiRequestStatus.loaded:
        return child;
        break;
      default:
        return loadingWidget;
    }
  }
}

Future errror(String e, BuildContext context, VoidCallback function) {
  return showDialog(
      context: context,
      child: Column(
        children: [
          MaterialButton(
            height: 30,
            onPressed: function,
            color: Colors.blue,
          ),
          SizedBox(
            height: 20,
          ),
          Text(e),
        ],
      ));
}
