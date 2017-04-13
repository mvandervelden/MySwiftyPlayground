//: [Previous](@previous)

import Foundation
import CoreLocation

extension CLLocation {
    func angleWithCoordinate(_ other: CLLocationCoordinate2D) -> Double? {
        guard course > -1.0 else {
            return nil
        }
        let bearingToCoordinate = coordinate.bearingToCoordinate(other)
        let rawAngle = bearingToCoordinate - course
        if rawAngle < -180.0 {
            return rawAngle + 360
        } else if rawAngle > 180 {
            return rawAngle - 360
        } else {
            return rawAngle
        }
    }
}

extension CLLocationCoordinate2D {
    func bearingToCoordinate(_ other: CLLocationCoordinate2D) -> Double {
        let radLat = latitude.degreesToRadians()
        let radLon = longitude.degreesToRadians()

        let otherRadLat = other.latitude.degreesToRadians()
        let otherRadLon = other.longitude.degreesToRadians()

        let dLon = otherRadLon - radLon

        let y = sin(dLon) * cos(otherRadLat)
        let x = cos(radLat) * sin(otherRadLat) - sin(radLat) * cos(otherRadLat) * cos(dLon)
        let radBearing = atan2(y, x)

        return radBearing.radiansToDegrees()
    }
}

extension Double {
    func degreesToRadians() -> Double {
        return self * M_PI / 180.0
    }

    func radiansToDegrees() -> Double {
        return self * 180.0 / M_PI
    }
}

let coordinate1 = CLLocationCoordinate2D(latitude: 49.3426, longitude: 2.698)
let coordinate2 = CLLocationCoordinate2D(latitude: 49.4147, longitude: 2.6948)
let location = CLLocation(coordinate: coordinate1, altitude: 0, horizontalAccuracy: 10, verticalAccuracy: 10, course: 178.4, speed: 30, timestamp: Date())
print(location)

coordinate1.bearingToCoordinate(coordinate2)
location.angleWithCoordinate(coordinate2)

//: [Next](@next)
