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
(named `busstops.json`)

(if you want to know busstop identifier, search this page and check result url parameters: https://transfer.navitime.biz/seibubus-dia/smart/top/Top)