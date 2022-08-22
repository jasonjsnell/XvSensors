//
//  XvSensors.swift
//  XvSensors
//
//  Created by Jason Snell on 8/20/22.
//

import Foundation

//MARK: - MUSE -
public enum XvEEGArea:UInt8 {
  
    case N  = 0  //nose, front of head
    case FP = 1  //pre-frontal
    case AF = 2  //
    case F  = 3  //frontal
    case FT = 4  //front temporal
    case FC = 5  //front central
    case T  = 6  //temporal
    case C  = 7  //central
    case A  = 8  //ears?
    case TP = 9  //temporal perietal
    case CP = 10 //central perietal
    case P  = 11 //perietal
    case PO = 12 //occipital perietal
    case O  = 13 //occipital
    case I  = 14 //back of head
    
}

public struct XvEEGPacket {
    
    public var sensors:[XvEEGSensorPacket]
    
    public init(sensors:[XvEEGSensorPacket]) {
        self.sensors = sensors
    }
}

public struct XvEEGSensorPacket {
    
    public var sensorArea:XvEEGArea
    public var sensorIndex:UInt8
    public var spectrum:[Double]
    public var noise:Int = 10
    public var timestamp:Date
    
    public init(a:XvEEGArea, i:UInt8, spectrum:[Double]) {
        
        self.timestamp = Date()
        self.sensorArea = a
        self.sensorIndex = i
        self.spectrum = spectrum
        
        //calcuate the noise level by detecting the minimum value in spectrum
        if let min:Double = spectrum.min() {
            self.noise = Int(min)
            if (noise < 0){ noise = 0 } //keep noise above zero
        }
    }
}

public class XvEEGSensorPacketStream {
    
    fileprivate var stream:[XvEEGSensorPacket]
    public init(){
        self.stream = []
    }
    public func add(sensorPacket:XvEEGSensorPacket) {
        stream.append(sensorPacket)
    }
}

public struct XvAccelPacket {
    
    public var x:Double
    public var y:Double
    public var z:Double
    public var timestamp:Date
    
    public init(x:Double, y:Double, z:Double) {
        self.timestamp = Date()
        self.x = x
        self.y = y
        self.z = z
    }
}

public struct XvPPGPacket {
    
    public var waveform:[Double]
    public var timestamp:Date
    
    public init(waveform:[Double]) {
        self.timestamp = Date()
        self.waveform = waveform
    }
}

public class XvPPGHeartEvent {
    
    public init(amplitude:Double, bpm:Double, hrv:Double) {
        self.timestamp = Date()
        self.amplitude = amplitude
        self.bpm = bpm
        self.hrv = hrv
    }
    public var amplitude:Double
    public var bpm:Double
    public var hrv:Double
    public var timestamp:Date
}

public struct XvBatteryPacket {
    
    public var percentage:UInt16
    public var timestamp:Date
    
    public init(percentage:UInt16) {
        self.timestamp = Date()
        self.percentage = percentage
    }
    
}
