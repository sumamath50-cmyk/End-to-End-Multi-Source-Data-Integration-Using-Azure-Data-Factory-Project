source(output(
		transaction_id as short,
		transactional_date as timestamp,
		product_id as string,
		customer_id as short,
		payment as string,
		credit_card as long,
		loyalty_card as boolean,
		cost as double,
		quantity as short,
		price as double
	),
	allowSchemaDrift: true,
	validateSchema: false,
	ignoreNoFilesFound: false) ~> sourceCSV
sourceCSV select(mapColumn(
		transaction_id,
		transactional_date,
		product_id,
		customer_id,
		payment,
		price
	),
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true) ~> selectcols
sourceCSV filter(customer_id != 5) ~> filterrows
filterrows sort(asc(customer_id, true)) ~> sort
sort split(payment == 'visa',
	payment == 'mastercard',
	disjoint: false) ~> split1@(visa, mastercard, others)
split1@others derive(payment = coalesce(payment, 'N/A')) ~> derivedColumn1
split1@visa aggregate(groupBy(customer_id),
	product_id = max(product_id)) ~> aggregate1
aggregate1 sink(allowSchemaDrift: true,
	validateSchema: false,
	umask: 0022,
	preCommands: [],
	postCommands: [],
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true) ~> sink