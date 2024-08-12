//
//  String.swift
//  Anytime Weather
//
//  Created by Ilham AM on 07/04/21.
//

import UIKit

extension String {
    func toImage() -> UIImage {
        do {
            guard let url = URL(string: self) else {
                return UIImage()
            }

            let data: Data = try Data(contentsOf: url)

            return UIImage(data: data) ?? UIImage()

        } catch {}
        return UIImage()
    }
}
