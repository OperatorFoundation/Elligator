//
//  Elligator.swift
//  Elligator
//
//  Created by Dr. Brandon Wiley on 11/15/17.
//  Copyright © 2017 Operator Foundation. All rights reserved.
//

import Foundation
import ElligatorObjC

public func representative(privateKey: Data) -> (representative: Data, publicKey: Data)? {
    let maybeResult: [Any]? = ElligatorObjC.scalarBaseMult(privateKey)
    guard let result = maybeResult else {
        return nil
    }
    
    return (result[0] as! Data, result[1] as! Data)
}

public func publicKey(representative: Data) -> Data {
    return ElligatorObjC.publicKey(fromRepresentative: representative)
}
