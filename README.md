# 开发目的

你可能会遇到明明有网络却在linux开发板/服务器/桌面上执行`apt update`时无法同步，大多数是由于时间未同步导致的，此脚本可便捷同步时间解决问题

*需要安装`curl`

# 使用方法

## 一次性使用
```bash
curl https://raw.githubusercontent.com/Snape-max/synctime/master/synctime.sh | bash
```

## 保存多次使用
```bash
curl -s "https://raw.githubusercontent.com/Snape-max/synctime/master/synctime" > synctime
chmod +x ./synctime
./synctime
```

你也可以将`synctime`加入`/usr/bin`中在任何地方使用

```bash
mv ./synctime /usr/bin
```

你可能需要使用`sudo`提权


