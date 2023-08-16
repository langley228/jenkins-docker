const MONGO_INITDB_USERNAME = process.env["MONGO_INITDB_USERNAME"];
const MONGO_INITDB_PASSWORD = encodeURIComponent(process.env["MONGO_INITDB_PASSWORD"]);
const mongoURI = `mongodb://${MONGO_INITDB_USERNAME}:${MONGO_INITDB_PASSWORD}@mongo:27017/member?authSource=admin`;
print(mongoURI);
let cluster = Mongo(mongoURI);
let db = cluster.getDB("member"); 