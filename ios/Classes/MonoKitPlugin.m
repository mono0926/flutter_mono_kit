#import "MonoKitPlugin.h"
#import <mono_kit/mono_kit-Swift.h>

@implementation MonoKitPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftMonoKitPlugin registerWithRegistrar:registrar];
}
@end
