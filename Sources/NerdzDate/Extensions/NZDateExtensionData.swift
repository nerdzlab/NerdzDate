//
//  NZDateExtensionData.swift
//  
//
//  Created by Roman Kovalchuk on 14.01.2022.
//

import Foundation

public class NZDateExtensionData<Base> {
    
    public let base: Base
    
    public init(_ base: Base) {
        self.base = base
    }
}

public protocol NZDateExtensionCompatible {
    /// Extended type
    associatedtype NZExtensionBase

    /// NZ extensions.
    static var nz: NZDateExtensionData<NZExtensionBase>.Type { get }

    /// NZ extensions.
    var nz: NZDateExtensionData<NZExtensionBase> { get }
}

extension NZDateExtensionCompatible {
    
    /// NZ extensions.
    public static var nz: NZDateExtensionData<Self>.Type {
        get { NZDateExtensionData<Self>.self }
    }

    /// Reactive extensions.
    public var nz: NZDateExtensionData<Self> {
        get { NZDateExtensionData(self) }
    }
}
