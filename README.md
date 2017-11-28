# iOS_dia_seibubus

## usage

1. Install OSS with carthage
- Add own busstop infomation in this Project

### Install OSS with carthage

Install Carthage, then:

```
$ carthage bootstrap --platform iOS --no-use-binaries --cache-builds --use-ssh
```

### Add own busstop infomation in this Project 

Write infomation like this:

```
[
    {
        "identifier": "00111506",
        "name": "大宮駅西口",
        "isStationBusTarminal": true
    },
    {
        "identifier": "00111603",
        "name": "さいたま市民医療センター入口",
        "isStationBusTarminal": false
    }
]
```

and set it in project root directory.


https://transfer.navitime.biz/seibubus-dia/smart/transfer/TransferSearch?targetstart=&roughEstimate=co2&startName=%E5%A4%A7%E5%AE%AE%E9%A7%85%E8%A5%BF%E5%8F%A3&start=&start=&orvCode=0.0.00111506.%E5%A4%A7%E5%AE%AE%E9%A7%85%E8%A5%BF%E5%8F%A3&orvAdd=&startPosType=&orvPosType=4&goalName=%E3%81%95%E3%81%84%E3%81%9F%E3%81%BE%E5%B8%82%E6%B0%91%E5%8C%BB%E7%99%82%E3%82%BB%E3%83%B3%E3%82%BF%E3%83%BC%E5%85%A5%E5%8F%A3&goal=&goal=&dnvCode=0.0.00111603.%E3%81%95%E3%81%84%E3%81%9F%E3%81%BE%E5%B8%82%E6%B0%91%E5%8C%BB%E7%99%82%E3%82%BB%E3%83%B3%E3%82%BF%E3%83%BC%E5%85%A5%E5%8F%A3&dnvAdd=&goalPosType=&dnvPosType=4&day=20171128&hour=18&minute=21&year=&month=&basis=1&sort=2&wspeed=standard&method=2&useRouteMethodDefault=2&type=