# Objective-C Core Data Concurrency Bug

This repository demonstrates a common bug in Objective-C related to Core Data and its interaction with threads. The bug causes random crashes or inconsistent data due to improper handling of `NSManagedObjectContext` on different threads.

## Bug Description
The `CoreDataConcurrencyBug.m` file contains code that attempts to save changes to a managed object context from a background thread without proper synchronization. This can lead to unpredictable behavior, such as crashes or data loss.

## Solution
The `CoreDataConcurrencyBugSolution.m` file provides a corrected implementation that addresses the concurrency issue.  It uses a dedicated serial queue for Core Data operations to ensure that only one operation is performed at a time, preventing race conditions and conflicts.  Appropriate context merging techniques are also employed to maintain data consistency.

## How to reproduce
1. Clone this repository.
2. Compile and run the `CoreDataConcurrencyBug` example. Observe the crashes or unexpected behavior.
3. Then, run the `CoreDataConcurrencyBugSolution` example.  The solution addresses the core problem efficiently.