    # 定義 compose 測試名稱
export COMPOSE_NAME=jmeter-test-$(date +%s)
    # 建立 Jmeter 測試環境 (docker-compose.yml 雷同, 但 port 不轉接給 host )   
        # image 用完即丟, 一律加上 --build
        # 目前只有 mongo 其他暫時不需要
cd ./../src
docker compose -f docker-compose.jmeter.env.yml -p $COMPOSE_NAME up -d --build mongo
    # 不能背景執行, 否則報表出不來
docker compose -f docker-compose.jmeter.yml -p $COMPOSE_NAME up --build
    # 從容器裡面複製測試結果
docker cp $COMPOSE_NAME-jmeter-1:/opt/data/result ./../../$COMPOSE_NAME
    # 執行完畢 移除容器及image ( --rmi 避免占空間還要自行清除 image )
docker compose -f docker-compose.jmeter.env.yml -f docker-compose.jmeter.yml -p $COMPOSE_NAME down -v --rmi all