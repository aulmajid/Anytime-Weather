//
//  DownloadUtils.swift
//  siswa
//
//  Created by aku pintar indonesia on 29/03/21.
//  Copyright © 2021 Team Developer Aku Pintar. All rights reserved.
//

import Foundation
import Alamofire

class DownloadUtils {
    
    static func download(url urlString: String, fileName: String, completion: @escaping (UIViewController) -> Void) {
        let destination: DownloadRequest.Destination = { _, _ in
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let fileURL = documentsURL.appendingPathComponent(fileName)
            return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
        }
        
        AF.download(urlString, to: destination).response { response in
            debugPrint(response)
            
            if response.error == nil {
                if let data = response.value {
                    let activityViewController = UIActivityViewController(activityItems: [data], applicationActivities: nil)
                    completion(activityViewController)
                }
            }
        }
    }
    
}
