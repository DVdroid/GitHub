
#async-await in swift

**Disclaimer** - This is less of an article and more of a note that I have created after reading "async-await" articles and watching [Meet async-await in Swift](https://developer.apple.com/videos/play/wwdc2021/10132/) WWDC-21 video.

Hopefully this will clarify some of the doubts that you have regarding "async-await in Swift". So, let's get straight into the topic.

*Note - I am planning to write more on this topic and this article will be update accordingly in the future.*

## Synchronous function
A synchronous function is one that executes all its work in a simple, straight line on a single thread.
example
![alt text](1.jpg)

### Problem
-    Synchronous function calls are blocking calls.


## Asynchronous functions

### Types
- Asynchronous functions with completion handlers
- Asynchronous functions with delegation call-backs e.g. Location APIs delegates
- Asynchronous functions marked with async keyword – New in Swift 5.5

asynchronous function with async keyword
`func fetchImage(for id: String) async -> UIImage`


## Asynchronous functions with completion handlers
![alt text](2.jpg)


### Problem - Swift can’t check our work
-    Can’t enforce invocation of completion handlers for all possible cases.
-    Can’t use swift’s usual error handling mechanism.


## async - await to the rescue
![alt text](3.jpg)


### Syntax - Things to notice
-    When you mark a function as async, the keyword should go just before “throws” in the function signature, i.e. just before the arrow if the function doesn’t throw.
-    “try” is here because the data method is marked “throws”. 
-    Just as try is needed to call a function marked as throws, await is need to call a function marked as async.


## What async keyword indicates?
-    A function marked async is allowed to be suspended and when it suspends itself then it suspends its callers too, so callers must be async too.


## What await keyword indicates?
-    Await keyword is used to point out where in an async function it might suspend.


## Throwing function analogy 
-    While an async function may suspend, just because it marked as async doesn’t necessarily mean it will suspend, just like a function marked as throws doesn’t mean that it will always through an error, it may or may not throw.

-    Similarly, just because await is mentioned doesn’t mean function will definitely suspend there, just like using a “try” keyword just before calling a function that can throw an error.


# Synchronous vs async - Difference in the control flow

### Synchronous calls
![alt text](4.jpg)
[image source](https://developer.apple.com/videos/play/wwdc2021/10132/)

### async calls
![alt text](5.jpg)
[image source](https://developer.apple.com/videos/play/wwdc2021/10132/)


### Important points
⁃    Async function can suspend as many times as it needs to
⁃    While an async function may suspend, just because it marked as async doesn’t necessarily mean it will suspend. (Use throwing function analogy).
⁃    Similarly, just because await is mentioned doesn’t mean function will definitely suspend there.
⁃    But eventually whether an async function suspends or not, after finishing it will return the control of the thread to the calling function along with a value or error.
⁃    A function may resume onto an entirely different thread.


# async-await control flow example
![alt text](6.jpg)
![alt text](7.jpg)


### async properties and initialisers
⁃    Not just functions but properties can be async too and so can initialisers.

![alt text](8.jpg)

### Things to notice
-    Only read-only properties can be async
-    Property getters can also throw


![alt text](9.jpg)

### Things to notice
-    If an expression has multiple async function calls, you only need to write await once, just like you only need one “try” for an expression with multiple throwing calls.


# URLSession – Syntax comparison between completion handler vs async-await versions

## Completion handler version
![alt text](10.jpg)


### Declared under NSURLSession Category (Objective - c)
![alt text](11.jpg)


## async-await version
![alt text](12.jpg)

### Declared under URLSession extension
![alt text](13.jpg)


### Things to notice
-    In the async version, no need to add “resume()” to invoke a data task.
-    async version returns non-optional data and response and in case of failure it throws an exception which makes it lot easier to handle at the call site as now there is no need to add extra logic to handle optional data or error.


# XCTest supports async

## Testing an asynchronous methods – completion handler approach
![alt text](14.jpg)

## Testing an asynchronous method – async-await approach
![alt text](15.jpg)

### Things to notice
-    In the async version, no need to set an expectation for an asynchronous function.


# Xcode – 13 Tip 
-    Xcode 13 has a new option to convert an asynchronous function with completion handler approach to an asynchronous function with async-await approach. 
-    CMD + left click on an asynchronous function with completion handler approach with present the conversion option.

![alt text](16.jpg)


### Result after conversion
![alt text](17.jpg)


# Conclusion
That's it for now, thanks for reading. Also if you really find this helpful then please leave some applause to this article.😀😀😀


# Resources
-   [Meet async-await in Swift](https://developer.apple.com/videos/play/wwdc2021/10132/)
