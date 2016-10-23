# Index Content

This app indexes any web page you feed to it by gathering headers and links from it.

```bash
$ bundle
$ rails s
$ curl localhost:3000/pages
[]
$ curl localhost:3000/pages -X POST --data url=https://github.com
{"id":3,"url":"https://github.com","headers1":["How people build software"],"headers2":["Welcome home, developers","Who uses GitHub?"],"headers3":["A whole new Universe","Individuals ","Communities ","Businesses "],"links":["#start-of-content","https://github.com/","/personal","/open-source","/business","/explore","/join?source=header-home","/login","/pricing","/blog","https://help.github.com","https://github.com/search","https://help.github.com/terms","https://help.github.com/privacy","/join?source=button-home","/universe-2016","/personal","/open-source","/business","//github.com/nasa","/join?source=button-home","https://github.com/contact","https://developer.github.com","https://training.github.com","https://shop.github.com","https://github.com/blog","https://github.com/about","https://github.com","https://github.com/site/terms","https://github.com/site/privacy","https://github.com/security","https://status.github.com/","https://help.github.com","",""],"created_at":"2016-10-23T15:23:37.092Z","updated_at":"2016-10-23T15:23:37.092Z"}
$ curl localhost:3000/pages
[{"id":3,"url":"https://github.com","headers1":["How people build software"],"headers2":["Welcome home, developers","Who uses GitHub?"],"headers3":["A whole new Universe","Individuals ","Communities ","Businesses "],"links":["#start-of-content","https://github.com/","/personal","/open-source","/business","/explore","/join?source=header-home","/login","/pricing","/blog","https://help.github.com","https://github.com/search","https://help.github.com/terms","https://help.github.com/privacy","/join?source=button-home","/universe-2016","/personal","/open-source","/business","//github.com/nasa","/join?source=button-home","https://github.com/contact","https://developer.github.com","https://training.github.com","https://shop.github.com","https://github.com/blog","https://github.com/about","https://github.com","https://github.com/site/terms","https://github.com/site/privacy","https://github.com/security","https://status.github.com/","https://help.github.com","",""],"created_at":"2016-10-23T15:23:37.092Z","updated_at":"2016-10-23T15:23:37.092Z"}]
```
