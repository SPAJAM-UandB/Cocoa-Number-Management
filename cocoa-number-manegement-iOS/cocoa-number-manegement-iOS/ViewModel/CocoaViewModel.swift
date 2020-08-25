//
//  CocoaViewModel.swift
//  cocoa-number-manegement-iOS
//
//  Created by 中岡黎 on 2020/08/25.
//  Copyright © 2020 中岡黎. All rights reserved.
//

import SwiftUI
import Combine
import CoreBluetooth

class CocoaViewModel: NSObject, ObservableObject, CBCentralManagerDelegate{
    
    @Published var name: String = "sample"
    var centralManager: CBCentralManager!

    override init(){
        super.init()
        centralManager = CBCentralManager(delegate: self, queue: nil, options: [CBCentralManagerOptionShowPowerAlertKey: true])
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
            case .poweredOn:
               print("CBManager is powered on")
               startScan()
            case .poweredOff:
               print("CBManager is not powered on")
               return
            case .resetting:
               print("CBManager is resetting")
            case .unauthorized:
               print("Unexpected authorization")
               return
            case .unknown:
               print("CBManager state is unknown")
               return
            case .unsupported:
               print("Bluetooth is not supported on this device")
               return
            @unknown default:
               print("A previously unknown central manager state occurred")
               return
        }
    }
       
    // begin to scan
    func startScan(){
        print("begin to scan ...")
        let cocoa_uuid: CBUUID = CBUUID(string: "0000fd6f-0000-1000-8000-00805f9b34fb")
        centralManager.scanForPeripherals(withServices: nil, options: nil)
    }
       
    // stop scan
    func stopBluetoothScan(){
        print("stop scan")
        self.centralManager.stopScan()
    }
    
    // Peripheral探索結果を受信
    func centralManager(_ central: CBCentralManager,
                       didDiscover peripheral: CBPeripheral,
                       advertisementData: [String: Any],
                       rssi RSSI: NSNumber) {
        if Int(truncating: RSSI) > -35 {
            print(advertisementData)
            self.name = peripheral.identifier.uuidString
            print("RSSI: \(RSSI)")
            print("pheripheral.name: \(String(describing: peripheral.name))")
            //print("advertisementData:\(advertisementData)")
            print("peripheral.identifier.uuidString: \(peripheral.identifier.uuidString)\n")
        }
    }
}
