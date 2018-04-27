//
//  DemeUrl.swift
//  casini
//
//  Created by Michael on 2016/10/6.
//  Copyright © 2016年 Michael. All rights reserved.
//

import Foundation

struct DemoURL
{
    
    static let Stanford = "http://comm.stanford.edu/wp-content/uploads/2013/01/stanford-campus.png"
    
    static let cassini = "https://zh.wikipedia.org/wiki/Wikipedia:首页#/media/File:Фінал_Євро-2012._НСК_«Олімпійський»._3_хвилини_після_фінального_свистка.JPG"
    
    static let NASA = [
    "Cassini" : "http://www.jpl.nasa.gov/images/cassini/20090202/pia03883-full.jpg",
    "Earth" :"http://www.nasa.gov/sites/default/files/images/662995main_upper-atmosphere-MOS_full.jpg"
        //"http://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/sls_infographic.jpg"
        /*"http://www.nasa.gov/sites/defult/files/wave_earth_mosaic_3.jpg"*/,
    "Saturn" :"http://www.nasa.gov/sites/default/files/thumbnails/image/pia20488-1041.jpg"
        //"http://www.nasa.gov/sites/defult/files/saturn_collage.jpg"
    ]
    
    static func NASAImageNamed(imageName:String?)->NSURL?{
        if let urlstring = NASA[imageName ?? ""]{
            return NSURL(string: urlstring)
        }else{
            return nil
        }
    }
}
