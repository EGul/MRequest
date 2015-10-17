# MRequest
Minimalist request library

## Usage
### GET
```objective-c

NSDictionary *opts = @{
  @"method": @"get",
  @"url": @"http://example.com"
};

MRequest *request = [[MRequest alloc]init];

[request requestWithOptions:opts success:^ (NSURLResponse *response, NSData *data) {

  NSLog(@"data: %@", data);

}fail:nil];

```
### POST
```objective-c

NSDictionary *opts = @{
  @"method": @"post",
  @"url": @"http://example.com",
  @"data": @"username=somethingusername&password=somethingpassword"
};

MRequest *request = [[MRequest alloc]init];

[request requestWithOptions:opts success:^ (NSURLResponse *response, NSData *data) {

  NSLog(@"data: %@", data);

}fail:nil];

```

## API
```objective-c
-(void)requestWithOptions:(NSDictionary *)options success(void(^)(NSURLResponse *, NSData *))successBlock fail:(void(^)(NSURLRespones *, NSError *))failBlock;
```
request with options

## Install
### CocoaPods
#### Podfile
```
pod "MRequest", :git => "https://github.com/egul/mrequest"
```

### Manual
```
git clone https://github.com/EGul/MRequest.git
```
Move MRequest.h MRequest.m files to project

## License
MIT
