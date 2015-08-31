#MRequest
Minimalist request library

##Usage
###GET
```objective-c

NSDictionary *opts = @{
  @"method": @"get",
  @"url": @"http://example.com"
};

MRequest *request = [[MRequest alloc]init];

[request requestWithOptions:opts completionBlock: ^ (NSError *error, NSURLResponse *response, NSData *data) {

  if (error == nil) {

    NSHTTPURLResponse *httpURLResponse = (NSHTTPURLResponse *)response;

    if (httpURLResponse.statusCode == 200) {
      NSLog(@"data: %@", data);
    }

  }

}];

```
###POST
```objective-c

NSDictionary *opts = @{
  @"method": @"post",
  @"url": @"http://example.com",
  @"data": @"username=somethingusername&password=somethingpassword"
};

MRequest *request = [[MRequest alloc]init];

[request requestWithOptions:opts completionBlock: ^ (NSError *error, NSURLResponse *response, NSData *data) {

  if (error == nil) {

    NSHTTPURLResponse *httpURLResponse = (NSHTTPURLResponse *)response;

    if (httpURLResponse.statusCode == 200) {
      NSLog(@"data: %@", data);
    }

  }

}];
```

##API
```objective-c
-(void)requestWithOptions:(NSDictionary *)options completionHandler:(void(^)(NSError *, NSURLResponse *, NSData));
```
request with options

##Install
```
git clone https://github.com/EGul/MRequest.git
```
Move MRequest.h MRequest.m files to project

##License
MIT
