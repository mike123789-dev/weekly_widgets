import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class MyOverlay extends StatefulWidget {
  @override
  _MyOverlayState createState() => _MyOverlayState();
}

class _MyOverlayState extends State<MyOverlay> {
  var isPressed = false;
  List<bool> isSelected = List.generate(3, (int index) => false);

  void toggle() {
    setState(() {
      isPressed = !isPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnchoredOverlay(
      showOverlay: isPressed,
      overlayBuilder: (context, offset) {
        return CenterAbout(
          position: Offset(offset.dx, offset.dy - 150.0),
          child: Column(
            children: [
              Text("과목"),
              GroupButton(
                isRadio: true,
                spacing: 10,
                onSelected: (index, isSelected) =>
                    print('$index button is selected'),
                buttons: ["운영체제", "시스템 프로그램", "모바일 앱 프로그래밍"],
              ),
              Container(
                height: 10,
              ),
              Text("종류"),
              GroupButton(
                isRadio: true,
                spacing: 10,
                onSelected: (index, isSelected) =>
                    print('$index button is selected'),
                buttons: ["시험", "퀴즈", "과제", "강의"],
              ),
              Container(
                height: 10,
              ),
            ],
          ),
        );
      },
      child: ElevatedButton.icon(
        label: Text("show overlay"),
        onPressed: toggle,
        icon: Icon(Icons.add),
      ),
    );
  }
}

class AnchoredOverlay extends StatelessWidget {
  final bool showOverlay;
  final Widget Function(BuildContext, Offset anchor) overlayBuilder;
  final Widget child;

  AnchoredOverlay({
    this.showOverlay,
    this.overlayBuilder,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return OverlayBuilder(
            showOverlay: showOverlay,
            overlayBuilder: (BuildContext overlayContext) {
              RenderBox box = context.findRenderObject() as RenderBox;
              final center =
                  box.size.center(box.localToGlobal(const Offset(0.0, 0.0)));
              return overlayBuilder(overlayContext, center);
            },
            child: child,
          );
        },
      ),
    );
  }
}

class OverlayBuilder extends StatefulWidget {
  final bool showOverlay;
  final Function(BuildContext) overlayBuilder;
  final Widget child;

  OverlayBuilder({
    this.showOverlay = false,
    this.overlayBuilder,
    this.child,
  });

  @override
  _OverlayBuilderState createState() => new _OverlayBuilderState();
}

class _OverlayBuilderState extends State<OverlayBuilder> {
  OverlayEntry overlayEntry;

  @override
  void initState() {
    super.initState();

    if (widget.showOverlay) {
      WidgetsBinding.instance.addPostFrameCallback((_) => showOverlay());
    }
  }

  @override
  void didUpdateWidget(OverlayBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    WidgetsBinding.instance.addPostFrameCallback((_) => syncWidgetAndOverlay());
  }

  @override
  void reassemble() {
    super.reassemble();
    WidgetsBinding.instance.addPostFrameCallback((_) => syncWidgetAndOverlay());
  }

  @override
  void dispose() {
    if (isShowingOverlay()) {
      hideOverlay();
    }

    super.dispose();
  }

  bool isShowingOverlay() => overlayEntry != null;

  void showOverlay() {
    overlayEntry = new OverlayEntry(
      builder: widget.overlayBuilder,
    );
    addToOverlay(overlayEntry);
  }

  void addToOverlay(OverlayEntry entry) async {
    print('addToOverlay');
    Overlay.of(context).insert(entry);
  }

  void hideOverlay() {
    print('hideOverlay');
    overlayEntry.remove();
    overlayEntry = null;
  }

  void syncWidgetAndOverlay() {
    if (isShowingOverlay() && !widget.showOverlay) {
      hideOverlay();
    } else if (!isShowingOverlay() && widget.showOverlay) {
      showOverlay();
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

class CenterAbout extends StatelessWidget {
  final Offset position;
  final Widget child;

  CenterAbout({
    this.position,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return new Positioned(
      top: position.dy,
      left: position.dx,
      child: new FractionalTranslation(
        translation: const Offset(-0.5, -0.5),
        child: Material(child: child),
      ),
    );
  }
}
