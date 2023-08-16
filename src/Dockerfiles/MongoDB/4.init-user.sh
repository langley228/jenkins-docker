# 建立 User
# ===
# 開發環境: Docker 初始化自動建立
# 測試/正式環境: 手動建立
mongo -- "member" <<EOF
    var user = '$MONGO_INITDB_USERNAME';
    var password = '$MONGO_INITDB_PASSWORD';
    var db = db.getSiblingDB('admin');

    db.createUser({user: user, pwd: password, roles: [{ role: "readWrite", db: "member" }]});
EOF
