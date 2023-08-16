

var results = [];
testCase.forEach(data => {
	insertOne(data);
});

function insertOne( data) {
	var res = { };
	res.data = data;
	res.actual = {acknowledged:false};
	res.expected = {acknowledged:true};
	res.msg = "insertOne " + data.custom_client_id + " - " + data.name;
	res.assert = false;
	try {
		res.result = coll.insertOne(data);;
		res.actual.acknowledged = res.result.acknowledged;
		res.assert = res.actual.acknowledged == res.expected.acknowledged;
	} catch (error) {
		res.exception = {};
		res.exception.message = error.message;
		res.exception.errInfo = error.errInfo;
	}
	results.push(res);
}

console.log(results.length);
console.log(results.filter(r => r.assert).length);
printjson("testResult=" + JSON.stringify(results));

