//
//  Test.swift
//  roz
//
//  Created by Broman on 6/14/25.
//

class Test {
	private var client: ESClient
	
	init() throws {
		client = try ESClient(handlers: [{_, _ in return 0}])
	}
}
