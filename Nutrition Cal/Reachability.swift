//
//  Reachability.swift
//  Nutrition Cal
//
//  Created by Galina Petrova on 03/25/16.
//  Copyright © 2015 Galina Petrova. All rights reserved.
//

import SystemConfiguration

public class Reachability {
	class func isConnectedToNetwork() -> Bool {
		var zeroAddress = sockaddr_in()
		zeroAddress.sin_len = UInt8(sizeofValue(zeroAddress))
		zeroAddress.sin_family = sa_family_t(AF_INET)
		let defaultRouteReachability = withUnsafePointer(&zeroAddress) {
			SCNetworkReachabilityCreateWithAddress(nil, UnsafePointer($0))
		}
		var flags = SCNetworkReachabilityFlags()
		if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
			return false
		}
		let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
		let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
		return (isReachable && !needsConnection)
	}
}