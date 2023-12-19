1. 配置golang环境，提示：可以使用golang:1.20镜像
2. 下载依赖，
```
GOPROXY=goproxy.cn go mod download
```
2. 编译
```
go build -o main
```
3. 运行
```
./main
```

4. 访问localhost:8080