//
//  Model.swift
//  EberryTVApp
//
//  Created by Mohamed Diaa on 2019-10-27.
//  Copyright © 2019 Mohamed Diaa. All rights reserved.
//
import Foundation
/*

     score = "13.434177";
     show =     {
         "_links" =         {
             previousepisode =             {
                 href = "http://api.tvmaze.com/episodes/1492665";
             };
             self =             {
                 href = "http://api.tvmaze.com/shows/4252";
             };
         };
         externals =         {
             imdb = tt3815412;
             thetvdb = 278640;
             tvrage = 34907;
         };
         genres =         (
             Drama,
             War,
             Medical
         );
         id = 4252;
         image =         {
             medium = "http://static.tvmaze.com/uploads/images/medium_portrait/133/334764.jpg";
             original = "http://static.tvmaze.com/uploads/images/original_untouched/133/334764.jpg";
         };
         language = English;
         name = "Our Girl";
         network =         {
             country =             {
                 code = GB;
                 name = "United Kingdom";
                 timezone = "Europe/London";
             };
             id = 12;
             name = "BBC One";
         };
         officialSite = "http://www.bbc.co.uk/programmes/p0260ych";
         premiered = "2014-09-21";
         rating =         {
             average = "8.300000000000001";
         };
         runtime = 60;
         schedule =         {
             days =             (
                 Tuesday
             );
             time = "21:00";
         };
         status = Running;
         summary = "<p>Drama following the extraordinary adventures of female medics in the British Army.</p>";
         type = Scripted;
         updated = 1551974006;
         url = "http://www.tvmaze.com/shows/4252/our-girl";
         webChannel = "<null>";
         weight = 93;
     };
 },
 */
 import Foundation

 // MARK: - WelcomeElement
 struct TVShow: Codable {
     var score: Double?
     var show: Show?
 }

 // MARK: - Show
 struct Show: Codable {
     var id: Int?
     var url: String?
     var name: String?
     var type: TypeEnum?
     var language: String?
     var genres: [String]?
     var status: String?
     var runtime: Int?
     var premiered: String?
     var officialSite: String?
     var schedule: Schedule?
     var rating: Rating?
     var weight: Int?
     var network, webChannel: Network?
     var externals: Externals?
     var image: Image?
     var summary: String?
     var updated: Int64?
     var links: Links?

     enum CodingKeys: String, CodingKey {
         case id, url, name, type, language, genres, status, runtime, premiered, officialSite, schedule, rating, weight, network, webChannel, externals, image, summary, updated
         case links = "_links"
     }
 }

 // MARK: - Externals
 struct Externals: Codable {
     var tvrage, thetvdb: Int?
     var imdb: String?
 }

 // MARK: - Image
 struct Image: Codable {
     var medium, original: String?
 }

 // MARK: - Links
 struct Links: Codable {
     var linksSelf, previousepisode: LinkContainer?

     enum CodingKeys: String, CodingKey {
         case linksSelf = "self"
         case previousepisode
     }
 }

 // MARK: - Previousepisode
 struct LinkContainer: Codable {
     var href: String?
 }

 // MARK: - Network
 struct Network: Codable {
     var id: Int?
     var name: String?
     var country: Country?
 }

 // MARK: - Country
 struct Country: Codable {
     var name, code, timezone: String?
 }

 // MARK: - Rating
 struct Rating: Codable {
     var average: Double?
 }

 // MARK: - Schedule
 struct Schedule: Codable {
     var time: String?
     var days: [String]?
 }

 enum TypeEnum: String, Codable {
     case reality = "Reality"
     case scripted = "Scripted"
    case animation = "Animation"
 }

 typealias TVShows = [TVShow]
