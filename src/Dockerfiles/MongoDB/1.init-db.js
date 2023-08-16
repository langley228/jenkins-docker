db = db.getSiblingDB('member');

db.createCollection("member",
    {
        validator: {
            $and : [
                {
                    $jsonSchema : {
                        bsonType : "object",
                        properties : {
                            custom_client_id : {
                                bsonType : "string"
                            },
                            name : {
                                bsonType : "string"
                            },
                            birthday : {
                                bsonType : [ "null", "date" ]
                            },
                            status : {
                                bsonType : [ "int" ],
                                enum : [ 1, 0 ],
                                description : "Must be either 1 (Active), or 0 (Inactive)"
                            },
                            source : {
                                bsonType : [ "null", "int" ],
                                enum : [
                                    1,
                                    2,
                                    null
                                ],
                                description : "Must be either 1 , 2 , or null"
                            },
                            created_time : {
                                bsonType : [ "date" ]
                            },
                            creator : {
                                bsonType : [ "int" ]
                            },
                            updated_time : {
                                bsonType : [ "null", "date" ]
                            },
                            updater : {
                                bsonType : [ "null", "int" ]
                            }
                        },
                        required : [
                            "custom_client_id",
                            "name",
                            "status",
                            "source",
                            "created_time",
                            "creator"
                        ]
                    }
                }
            ]
        }
    }
);
