//
//  Api.swift
//  CondorTest
//
//  Created by Carlos Pava on 6/2/19.
//  Copyright © 2019 Carlos Pava. All rights reserved.
//

import Foundation

class EndPoint {
    let urlBase = "https://api.spotify.com/v1/"
    let token = "Bearer BQAPAHI_hoHHtiXR0rUPeCP6pDGd3gXpUxrjGKDPB2YlsnT01NWNnqrN_fWe9M8QOHu5UrOD-SMOjPNbjRHhecIi9LIXBkJSFPt1ckPTZr-ZwydM579ztFlXcppYUVIpRj6RIYMiqKuKe9B-yxT_PaFpadafmSteL9YcAOQTu9fWwW9fMYKx8kiUGTCTIqTjPhw0UH35AnN7h63YGvd1ALTFFoiYmWDKUJMgcJsDDz_OA8Sa7tnPp-QZQuM8PztRFIAXCRbXK6sW3tmTiJZ8"
    let searchEndPoint = "search"

    var albumEndPoint: String = "artists/%@/albums"
    var album: String {
        get { return self.albumEndPoint }
        set {
            self.albumEndPoint = String(format: albumEndPoint, newValue)
        }
    }
}
