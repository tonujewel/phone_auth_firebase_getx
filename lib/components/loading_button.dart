import 'package:flutter/material.dart';

class LoadingButton extends StatefulWidget {
  final Widget child;
  final bool isLoading;
  final void Function() onPressed;
  final Color backgroundColor;
  final BoxDecoration decoration;
  final Widget loadingWidget;
  final bool defaultStyle;

  const LoadingButton(
      {Key key,
      this.child,
      this.onPressed,
      this.isLoading = false,
      this.backgroundColor,
      this.decoration,
      this.loadingWidget,
      this.defaultStyle = false})
      : super(key: key);

  @override
  _LoadingButtonState createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  BoxDecoration decoration;
  Widget loadingWidget;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    buildDecoration();
    buildLoadingWidget();
  }

  void buildDecoration() {
    decoration = widget.decoration ??
        BoxDecoration(
          color: widget.backgroundColor ?? Theme.of(context).primaryColor,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),bottomLeft: Radius.circular(10.0),bottomRight: Radius.circular(10.0)),
          // borderRadius: BorderRadius.circular(10),
        );
  }

  void buildLoadingWidget() {
    loadingWidget = loadingWidget ??
        SizedBox(
          width: widget.defaultStyle ? 25 : 10,
          height: 25,
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 2,
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    buildDecoration();
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: widget.isLoading ? null : widget.onPressed,
        child: AnimatedContainer(
          padding: widget.isLoading ? EdgeInsets.all(10) : EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          //padding: widget.isLoading ? EdgeInsets.only(left: 10,right: 10) : EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          decoration: widget.isLoading ? decoration.copyWith(borderRadius: BorderRadius.circular(100)) : decoration,
          child: widget.isLoading ? loadingWidget : widget.child,
        ),
      ),
    );
  }
}
