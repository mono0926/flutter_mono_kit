## 2.0.0

- Change `SubscriptionHolderMixin` to `on StateNotifier` from `with Disposabe`
  - Previously, `dispose` can override the `dispose` of base class, so eliminate that situation by limiting usage.

## 1.2.0+1

- Depends on subscription_holder

## 1.1.0

- Upgrade dependencies

## 1.0.0

- Initial release.
