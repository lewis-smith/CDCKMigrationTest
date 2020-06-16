I have an "offline" CoreData model that I want to add to CloudKit CoreData.

When you first open an existing model using `NSPersistentCloudKitContainer` it automatically syncs all the data to CloudKit.

However, I have found that if you add a new model version at the same time the data does not sync.

A workaround for this that I have found is to "touch" all of the objects as this will force them to sync.

Is there a better way?

--

I have wrapped this up into a sample project:

If you:

- Checkout tag v1 
- Run on your device & store some data
- Checkout tag v2
- Run on your device without changing data

You will see that the existing data does not sync to CloudKit
