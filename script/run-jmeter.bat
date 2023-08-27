@echo off
set CUR_YYYY=%date:~0,4%
set CUR_MM=%date:~5,2%
set CUR_DD=%date:~8,2%
set CUR_HH=%time:~0,2%
set CUR_NN=%time:~3,2%
set CUR_SS=%time:~6,2%
set CUR_MS=%time:~9,2%
 
set SUBFILENAME=%CUR_YYYY%%CUR_MM%%CUR_DD%%CUR_HH%%CUR_NN%%CUR_SS%

:: 定義 compose 測試名稱
set COMPOSE_NAME=jmeter-test-%SUBFILENAME%
echo %COMPOSE_NAME%
cd .\..\src
:: 建立 Jmeter 測試環境 (docker-compose.yml 雷同, 但 port 不轉接給 host ) 
    :: image 用完即丟, 一律加上 --build
    :: 目前只有 mongo 其他暫時不需要
docker-compose -f docker-compose.jmeter.env.yml -p %COMPOSE_NAME% up -d --build mongo 

:: 執行 Jmeter 測試腳本 ( image 用完即丟, 一律加上 --build)
docker-compose -f docker-compose.jmeter.yml -p %COMPOSE_NAME% up --build

:: 從容器裡面複製測試結果
docker cp %COMPOSE_NAME%_jmeter_1:/opt/data/result .\..\..\%COMPOSE_NAME%

:: 執行完畢 移除容器及image ( --rmi 避免占空間還要自行清除 image )
docker-compose -f docker-compose.jmeter.yml -f docker-compose.jmeter.env.yml -p %COMPOSE_NAME% down -v --rmi all