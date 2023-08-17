rm /opt/data/result/mongo.log
rm /opt/data/result/mongo.jtl
rm -rf /opt/data/result/reports/mongo
mkdir -p /opt/data/result/reports/mongo
jmeter -Dlog_level.jmeter=DEBUG -n -t /opt/data/test-plan/mongo/mongo.jmx -l /opt/data/result/mongo.jtl -j /opt/data/result/mongo.log -e -o /opt/data/result/reports/mongo/