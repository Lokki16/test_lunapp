import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseProvider<T extends ChangeNotifier> extends StatefulWidget {
  final T model;
  final Function(T)? onInit;
  final Function(T)? onDispose;
  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final Widget? child;

  const BaseProvider({
    super.key,
    required this.builder,
    required this.model,
    this.child,
    this.onInit,
    this.onDispose,
  });

  @override
  State<BaseProvider> createState() => _BaseProviderState<T>();
}

class _BaseProviderState<T extends ChangeNotifier>
    extends State<BaseProvider<T>> {
  late T model;

  @override
  void initState() {
    model = widget.model;
    if (widget.onInit != null) {
      widget.onInit!(model);
    }
    super.initState();
  }

  @override
  void dispose() {
    if (widget.onDispose != null) {
      widget.onDispose!(model);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => model,
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}
