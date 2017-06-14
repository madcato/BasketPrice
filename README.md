# BasketPrice

[![Build Status](https://travis-ci.org/madcato/BasketPrice.svg?branch=master)](https://travis-ci.org/madcato/BasketPrice)
[![codecov](https://codecov.io/gh/madcato/BasketPrice/branch/master/graph/badge.svg)](https://codecov.io/gh/madcato/BasketPrice)
[![codebeat badge](https://codebeat.co/badges/2f94351b-78c7-47dd-a867-a1ffb97fcb3a)](https://codebeat.co/projects/github-com-madcato-basketprice-master)

Technical evaluation "iOS Developer" - Home coding exercise

I have not used http://jsonrates.com/ service, because is discontinuated. Instead, I have used https://currencylayer.com. 

This other service doesn't provide a free conversion endpoint(as http://jsonrates.com had). To solve this, I've used the live currency rate conversion from http://currencylayer.com, and the conversion is made by my app directly. Also the list of available currencies is downloaded from this other service.

## Dependencies

- [Alamofire: Elegant HTTP Networking in Swift](https://github.com/Alamofire/Alamofire)      
	CocoaPods 1.1.0+ is required to build Alamofire 4.0.0+

## External services

- [currencylayer](https://currencylayer.com/?ref=jsonrates) http://jsonrates.com seems deprecatedand some services fail.
- [currencylayer Service doc](https://github.com/madcato/BasketPrice/wiki/Currency-conversion-service)