import 'package:bloc_learning/itemlist/item_bloc.dart';
import 'package:bloc_learning/itemlist/item_event.dart';
import 'package:bloc_learning/itemlist/item_repository.dart';
import 'package:bloc_learning/itemlist/item_state.dart';
import 'package:bloc_learning/itemlist/snack_bar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => ItemRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) {
              // Can be improve by using getIt to inject Bloc here
              ItemRepository repository = context.read<ItemRepository>();
              final bloc = ItemBloc(repository: repository);
              bloc.add(FetchItemEvent());
              return bloc;
            },
          ),
          BlocProvider(create: (_) => SnackBarCubit()),
        ],
        child: ItemContent(),
      ),
    );
  }
}

class ItemContent extends StatelessWidget {
  const ItemContent({super.key});

  void showTextDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(padding: EdgeInsets.all(16), child: Text(message)),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SnackBarCubit, String?>(
      listener: (context, message) {
        SnackBarCubit snackBarCubit = context.read<SnackBarCubit>();
        if (message != null) {
          showTextDialog(context, message);
          snackBarCubit.reset();
        }
      },
      child: BlocBuilder<ItemBloc, ItemState>(
        builder: (context, state) {
          SnackBarCubit snackBarCubit = context.read<SnackBarCubit>();
          if (state is ItemLoaded) {
            return Scaffold(
              body: ListView(
                children: state.items.map((data) {
                  return ListTile(
                    title: Text(data),
                    onTap: () {
                      snackBarCubit.showSnackBar(data);
                    },
                  );
                }).toList(),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
