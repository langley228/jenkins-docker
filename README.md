# jenkins-docker



```powershell
# 首次執行 - 建立 Jmeter 測試環境 (docker-compose.yml 雷同, 但 port 不轉接給 host ) 
    # 若 db初始化腳本有改, 有下 --build
    # 目前只有 mongo 其他暫時不需要
docker-compose -f docker-compose.jmeter.env.yml -p test up -d mongo 

# 執行 Jmeter 測試腳本 (若腳本有改, 要下 --build)
docker-compose -f docker-compose.jmeter.yml -p test up

# 測試腳本路徑
./Dockerfiles/Jmeter/test-plan

# 測試結果相關資料路徑
本機路徑(windows) : \\wsl$\docker-desktop-data\data\docker\volumes\test_jmeter-data\_data\result

```