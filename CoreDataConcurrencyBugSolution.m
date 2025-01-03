The solution involves using a dedicated serial dispatch queue for all Core Data operations. This ensures that only one operation is performed at a time, preventing race conditions and data corruption.  Furthermore, the correct context saving and merging mechanisms are implemented to maintain data integrity across threads.

```objectivec
// CoreDataConcurrencyBugSolution.m

static dispatch_queue_t coreDataQueue;

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    coreDataQueue = dispatch_queue_create("com.example.coreDataQueue", DISPATCH_QUEUE_SERIAL);
    // ... rest of your application initialization
}

- (void)saveData:(NSManagedObject *)managedObject {
    dispatch_async(coreDataQueue, ^{ 
        NSManagedObjectContext *context = [self managedObjectContext]; // Your context
        [context performBlock:^{ 
            NSError *error = nil;
            if (![context save:&error]) {
                NSLog("Error saving context: %@
", [error localizedDescription]);
            }
        }];
    });
}

// ... other methods ...

@end
```
By encapsulating all Core Data operations within this serial queue, we guarantee thread safety and avoid the inconsistencies and crashes associated with concurrent access to the `NSManagedObjectContext`.