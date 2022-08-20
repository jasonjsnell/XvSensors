//
//  XvSensors.swift
//  XvSensors
//
//  Created by Jason Snell on 8/20/22.
//

import Foundation

//MARK: - MUSE -
//public class XvSensors {
//
//}

public struct XvEEG {
    
    public var TP9:XvEEGSensor // left ear
    public var FP1:XvEEGSensor //left forehead
    public var FP2:XvEEGSensor //right forehead
    public var TP10:XvEEGSensor //right ear
    
    public init(TP9:XvEEGSensor, FP1:XvEEGSensor, FP2:XvEEGSensor, TP10:XvEEGSensor) {
        self.TP9 = TP9
        self.FP1 = FP1
        self.FP2 = FP2
        self.TP10 = TP10
    }
}

public struct XvEEGSensor {
    
    public var spectrum:[Double]
    public var noise:Int = 10
    
    public init(spectrum:[Double]) {
        
        self.spectrum = spectrum
        
        //calcuate the noise level by detecting the minimum value in spectrum
        if let min:Double = spectrum.min() {
            self.noise = Int(min)
            if (noise < 0){ noise = 0 } //keep noise above zero
        }
    }
}

public struct XvAccel {
    
    public var x:Double
    public var y:Double
    public var z:Double
    
    public init(x:Double, y:Double, z:Double) {
        self.x = x
        self.y = y
        self.z = z
    }
}

public struct XvPPG {
    
    public var waveform:[Double]
    
    public init(waveform:[Double]) {
        self.waveform = waveform
    }
}

public class XvPPGHeartEvent {
    
    public init(amplitude:Double, bpm:Double, hrv:Double) {
        self.amplitude = amplitude
        self.bpm = bpm
        self.hrv = hrv
    }
    public var amplitude:Double
    public var bpm:Double
    public var hrv:Double
}

public struct XvBattery {
    
    public var percentage:UInt16
    
    public init(percentage:UInt16) {
        self.percentage = percentage
    }
    
}
