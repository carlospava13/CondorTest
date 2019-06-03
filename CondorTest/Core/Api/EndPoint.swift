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
    let token = "Bearer BQDz6Qn5JZvpE-1UvnxQ6swDdf0tK8n0N9mbk7NL1MKi-09lHInFA724N39vydVpEivC7eRJhqLKSFxxosfQONa9k4wdmjBdzSVBHg9MKmHZpsdCw1876no-jIVAxJpzgFzEFPqdxb9wvFOb77Oa_IkfcTLWYZmTrevI978YyF4Z-gYj6PFsMLo0UPdwXGRgi8YLfWgh1_J3K49Zol5dc_S4B5Aemix35Q7XnYaa5wsYbibp3AuGE0f3HqNUlYuTk9L1V4SRrLKtwlWD7DbT"
    let searchEndPoint = "search"

    var albumEndPoint: String = "artists/%@/albums"
    var album: String {
        get { return self.albumEndPoint }
        set {
            self.albumEndPoint = String(format: albumEndPoint, newValue)
        }
    }
}
