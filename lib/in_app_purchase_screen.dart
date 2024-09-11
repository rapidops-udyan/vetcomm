import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/in_app_purchase_bloc.dart';

class InAppPurchaseScreen extends StatelessWidget {
  const InAppPurchaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
      InAppPurchaseBloc()..add(const InAppPurchaseEvent.initialize()),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Subscription Plans'),
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh_rounded),
                onPressed: () => context
                    .read<InAppPurchaseBloc>()
                    .add(const InAppPurchaseEvent.fetchProducts()),
              ),
            ],
          ),
          body: BlocConsumer<InAppPurchaseBloc, InAppPurchaseState>(
            listener: (context, state) {
              final message = state.status == InAppPurchaseStatus.error
                  ? state.error ?? 'An error occurred'
                  : state.status == InAppPurchaseStatus.purchaseComplete
                  ? 'Purchase successful'
                  : state.status == InAppPurchaseStatus.restored
                  ? 'Subscription Restored'
                  : state.status == InAppPurchaseStatus.cancelled
                  ? 'Purchase Cancelled'
                  : null;
              if (message != null) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(message)));
              }
            },
            builder: (context, state) {
              if (state.status == InAppPurchaseStatus.loading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state.status == InAppPurchaseStatus.error) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(state.error ?? 'An error occurred',
                          style: const TextStyle(color: Colors.red)),
                      ElevatedButton(
                        onPressed: () => context
                            .read<InAppPurchaseBloc>()
                            .add(const InAppPurchaseEvent.fetchProducts()),
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                );
              }
              if (state.products.isEmpty) {
                return const Center(
                    child: Text('No subscription plans available.'));
              }
              return ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Current Subscription',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      state.activeSubscription != null
                          ? Text(
                          'Plan: ${state.activeSubscription!.productID} | Status: ${state.activeSubscription!.status.name}')
                          : const Text('None'),
                    ],
                  ),
                  const Divider(),
                  ...state.products.map((product) {
                    final isActive =
                        state.activeSubscription?.productID == product.id;
                    final isUpgrade = state.activeSubscription != null &&
                        !isActive &&
                        (product.id.contains('yearly') &&
                            !state.activeSubscription!.productID
                                .contains('yearly') ||
                            product.id.contains('monthly') &&
                                state.activeSubscription!.productID
                                    .contains('weekly'));
                    final status = isActive
                        ? 'Current Plan'
                        : isUpgrade
                        ? 'Upgrade'
                        : state.activeSubscription != null
                        ? 'Downgrade'
                        : 'Subscribe';
                    final statusColor = isActive
                        ? Colors.green
                        : isUpgrade
                        ? Colors.blue
                        : Colors.orange;

                    return ListTile(
                      title: Text(product.title),
                      contentPadding: EdgeInsets.zero,
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(product.description),
                          const SizedBox(height: 4),
                          Text(status, style: TextStyle(color: statusColor)),
                        ],
                      ),
                      trailing: FittedBox(
                        child: Column(
                          children: [
                            Text(product.price,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            FilledButton(
                              onPressed: isActive
                                  ? null
                                  : () => context.read<InAppPurchaseBloc>().add(
                                  InAppPurchaseEvent.buyProduct(
                                      product, state.activeSubscription)),
                              child: Text(isActive ? 'Active' : 'Buy'),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              );
            },
          ),
        );
      }),
    );
  }
}