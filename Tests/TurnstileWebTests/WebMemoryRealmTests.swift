//
//  WebMemoryRealmTests.swift
//  Turnstile
//
//  Created by Edward Jiang on 9/14/16.
//
//

@testable import TurnstileWeb
import Turnstile
import XCTest
import Foundation

class WebMemoryRealmTests: XCTestCase {
    let usernamePassword = UsernamePassword(username: "USERNAME", password: "PASSWORD")
    let invalidUsernamePassword = UsernamePassword(username: "INVALID_USERNAME", password: "INVALID_PASSWORD")
    let facebookAccount = FacebookAccount(uniqueID: "FACEBOOK_ACCOUNT")
    let googleAccount = GoogleAccount(uniqueID: "GOOGLE_ACCOUNT")
    var realm: WebMemoryRealm!
    
    override func setUp() {
        realm = WebMemoryRealm()
        do {
            _ = try realm.register(credentials: usernamePassword)
            _ = try realm.register(credentials: facebookAccount)
            _ = try realm.register(credentials: googleAccount)
        } catch {
            XCTFail("Could not register credentials")
        }
    }
    
    func testLoginWithUsernamePassword() {
        do {
            _ = try realm.authenticate(credentials: usernamePassword)
        } catch {
            XCTFail("We should not fail to authenticate user")
        }
    }
    
    func testLoginWithInvalidUsernamePassword() {
        do {
            _ = try realm.authenticate(credentials: invalidUsernamePassword)
            XCTFail("We should not authenticate bad credentials")
        } catch let e {
            XCTAssert(e is IncorrectCredentialsError)
        }
    }
    
    func testLoginWithFacebook() {
        do {
            _ = try realm.authenticate(credentials: facebookAccount)
        } catch {
            XCTFail("We should not fail to authenticate user")
        }
    }
    
    func testLoginWithGoogle() {
        do {
            _ = try realm.authenticate(credentials: googleAccount)
        } catch {
            XCTFail("We should not fail to authenticate user")
        }
    }
    
    static var allTests = [
        ("testLoginWithUsernamePassword", testLoginWithUsernamePassword),
        ("testLoginWithInvalidUsernamePassword", testLoginWithInvalidUsernamePassword),
        ("testLoginWithFacebook", testLoginWithFacebook),
        ("testLoginWithGoogle", testLoginWithGoogle)
    ]
}