//
//  CountryModel.swift
//  Challenge Milestone 13 - 15
//
//  Created by Lucas Neves dos santos pompeu on 17/06/23.
//

import Foundation

struct Country: Codable {
    let name: Name
    let tld: [String]?
    let cca2: String
    let ccn3: String?
    let cca3: String
    let cioc: String?
    let independent: Bool?
    let status: Status
    let unMember: Bool
    let currencies: Currencies?
    let idd: Idd
    let capital: [String]?
    let altSpellings: [String]
    let region: Region
    let subregion: String?
    let languages: [String: String]?
    let translations: [String: Translation]
    let latlng: [Double]
    let landlocked: Bool
    let area: Double
    let demonyms: Demonyms?
    let flag: String
    let maps: Maps
    let population: Int
    let gini: [String: Double]?
    let fifa: String?
    let car: Car
    let timezones: [String]
    let continents: [Continent]
    let flags, coatOfArms: CoatOfArms
    let startOfWeek: StartOfWeek
    let capitalInfo: CapitalInfo
    let postalCode: PostalCode?
    let borders: [String]?
}

// MARK: - CapitalInfo
struct CapitalInfo: Codable {
    let latlng: [Double]?
}

// MARK: - Car
struct Car: Codable {
    let signs: [String]?
    let side: Side
}

enum Side: String, Codable {
    case sideLeft = "left"
    case sideRight = "right"
}

// MARK: - CoatOfArms
struct CoatOfArms: Codable {
    let png: String?
    let svg: String?
}

enum Continent: String, Codable {
    case africa = "Africa"
    case antarctica = "Antarctica"
    case asia = "Asia"
    case europe = "Europe"
    case northAmerica = "North America"
    case oceania = "Oceania"
    case southAmerica = "South America"
}

// MARK: - Currencies
struct Currencies: Codable {
    let eur, mkd, yer, ang: Aed?
    let mop, ngn, sos, mmk: Aed?
    let lrd, xcd, kpw, sar: Aed?
    let npr, ves, usd, bmd: Aed?
    let kes, xaf, rwf, mru: Aed?
    let xpf, fjd, ars, bnd: Aed?
    let sgd, nio, gbp, lak: Aed?
    let uah, imp, kwd, nzd: Aed?
    let bhd, bob, xof, uzs: Aed?
    let bsd, mvr, tmt, uyu: Aed?
    let bgn, lsl, zar, cuc: Aed?
    let cup, htg, top, fkp: Aed?
    let etb, ssp, tnd, cve: Aed?
    let tjs, bwp, idr, qar: Aed?
    let kyd, hrk, zmw, ron: Aed?
    let dkk, fok, mdl, bbd: Aed?
    let bam: BAM?
    let krw, syp, cop, bdt: Aed?
    let sek, huf, aud, iqd: Aed?
    let pln, tzs, mad, chf: Aed?
    let ern, hnl, wst, rsd: Aed?
    let kid, bzd, scr, dzd: Aed?
    let gip, thb, vnd, shp: Aed?
    let nok, srd, mnt, btn: Aed?
    let inr, sll, khr, afn: Aed?
    let amd, tvd: Aed?
    let sdg: BAM?
    let stn, hkd, pkr, azn: Aed?
    let kmf, omr, ghs, ils: Aed?
    let zwl, bif, mwk, pab: Aed?
    let mga, gel, ckd, isk: Aed?
    let currenciesTRY, crc, egp, jep: Aed?
    let jmd, brl, pyg, kzt: Aed?
    let nad, mur, jod, myr: Aed?
    let djf, sbd, gyd, kgs: Aed?
    let php, pgk, ttd, lyd: Aed?
    let awg, rub, cad, szl: Aed?
    let irr, jpy, cny, aoa: Aed?
    let mzn, gmd, clp, lkr: Aed?
    let byn, pen, ggp, dop: Aed?
    let aed, gtq, lbp, all: Aed?
    let vuv, cdf, czk, ugx: Aed?
    let mxn, twd, gnf: Aed?

    enum CodingKeys: String, CodingKey {
        case eur = "EUR"
        case mkd = "MKD"
        case yer = "YER"
        case ang = "ANG"
        case mop = "MOP"
        case ngn = "NGN"
        case sos = "SOS"
        case mmk = "MMK"
        case lrd = "LRD"
        case xcd = "XCD"
        case kpw = "KPW"
        case sar = "SAR"
        case npr = "NPR"
        case ves = "VES"
        case usd = "USD"
        case bmd = "BMD"
        case kes = "KES"
        case xaf = "XAF"
        case rwf = "RWF"
        case mru = "MRU"
        case xpf = "XPF"
        case fjd = "FJD"
        case ars = "ARS"
        case bnd = "BND"
        case sgd = "SGD"
        case nio = "NIO"
        case gbp = "GBP"
        case lak = "LAK"
        case uah = "UAH"
        case imp = "IMP"
        case kwd = "KWD"
        case nzd = "NZD"
        case bhd = "BHD"
        case bob = "BOB"
        case xof = "XOF"
        case uzs = "UZS"
        case bsd = "BSD"
        case mvr = "MVR"
        case tmt = "TMT"
        case uyu = "UYU"
        case bgn = "BGN"
        case lsl = "LSL"
        case zar = "ZAR"
        case cuc = "CUC"
        case cup = "CUP"
        case htg = "HTG"
        case top = "TOP"
        case fkp = "FKP"
        case etb = "ETB"
        case ssp = "SSP"
        case tnd = "TND"
        case cve = "CVE"
        case tjs = "TJS"
        case bwp = "BWP"
        case idr = "IDR"
        case qar = "QAR"
        case kyd = "KYD"
        case hrk = "HRK"
        case zmw = "ZMW"
        case ron = "RON"
        case dkk = "DKK"
        case fok = "FOK"
        case mdl = "MDL"
        case bbd = "BBD"
        case bam = "BAM"
        case krw = "KRW"
        case syp = "SYP"
        case cop = "COP"
        case bdt = "BDT"
        case sek = "SEK"
        case huf = "HUF"
        case aud = "AUD"
        case iqd = "IQD"
        case pln = "PLN"
        case tzs = "TZS"
        case mad = "MAD"
        case chf = "CHF"
        case ern = "ERN"
        case hnl = "HNL"
        case wst = "WST"
        case rsd = "RSD"
        case kid = "KID"
        case bzd = "BZD"
        case scr = "SCR"
        case dzd = "DZD"
        case gip = "GIP"
        case thb = "THB"
        case vnd = "VND"
        case shp = "SHP"
        case nok = "NOK"
        case srd = "SRD"
        case mnt = "MNT"
        case btn = "BTN"
        case inr = "INR"
        case sll = "SLL"
        case khr = "KHR"
        case afn = "AFN"
        case amd = "AMD"
        case tvd = "TVD"
        case sdg = "SDG"
        case stn = "STN"
        case hkd = "HKD"
        case pkr = "PKR"
        case azn = "AZN"
        case kmf = "KMF"
        case omr = "OMR"
        case ghs = "GHS"
        case ils = "ILS"
        case zwl = "ZWL"
        case bif = "BIF"
        case mwk = "MWK"
        case pab = "PAB"
        case mga = "MGA"
        case gel = "GEL"
        case ckd = "CKD"
        case isk = "ISK"
        case currenciesTRY = "TRY"
        case crc = "CRC"
        case egp = "EGP"
        case jep = "JEP"
        case jmd = "JMD"
        case brl = "BRL"
        case pyg = "PYG"
        case kzt = "KZT"
        case nad = "NAD"
        case mur = "MUR"
        case jod = "JOD"
        case myr = "MYR"
        case djf = "DJF"
        case sbd = "SBD"
        case gyd = "GYD"
        case kgs = "KGS"
        case php = "PHP"
        case pgk = "PGK"
        case ttd = "TTD"
        case lyd = "LYD"
        case awg = "AWG"
        case rub = "RUB"
        case cad = "CAD"
        case szl = "SZL"
        case irr = "IRR"
        case jpy = "JPY"
        case cny = "CNY"
        case aoa = "AOA"
        case mzn = "MZN"
        case gmd = "GMD"
        case clp = "CLP"
        case lkr = "LKR"
        case byn = "BYN"
        case pen = "PEN"
        case ggp = "GGP"
        case dop = "DOP"
        case aed = "AED"
        case gtq = "GTQ"
        case lbp = "LBP"
        case all = "ALL"
        case vuv = "VUV"
        case cdf = "CDF"
        case czk = "CZK"
        case ugx = "UGX"
        case mxn = "MXN"
        case twd = "TWD"
        case gnf = "GNF"
    }
}

// MARK: - Aed
struct Aed: Codable {
    let name, symbol: String
}

// MARK: - BAM
struct BAM: Codable {
    let name: String
}

// MARK: - Demonyms
struct Demonyms: Codable {
    let eng: Eng
    let fra: Eng?
}

// MARK: - Eng
struct Eng: Codable {
    let f, m: String
}

// MARK: - Idd
struct Idd: Codable {
    let root: String?
    let suffixes: [String]?
}

// MARK: - Maps
struct Maps: Codable {
    let googleMaps, openStreetMaps: String
}

// MARK: - Name
struct Name: Codable {
    let common, official: String
    let nativeName: [String: Translation]?
}

// MARK: - Translation
struct Translation: Codable {
    let official, common: String
}

// MARK: - PostalCode
struct PostalCode: Codable {
    let format: String
    let regex: String?
}

enum Region: String, Codable {
    case africa = "Africa"
    case americas = "Americas"
    case antarctic = "Antarctic"
    case asia = "Asia"
    case europe = "Europe"
    case oceania = "Oceania"
}

enum StartOfWeek: String, Codable {
    case monday = "monday"
    case sunday = "sunday"
    case turday = "turday"
}

enum Status: String, Codable {
    case officiallyAssigned = "officially-assigned"
    case userAssigned = "user-assigned"
}

typealias Countries = [Country]
