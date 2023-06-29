//
//  ExampleScripts.swift
//  Extension
//
//  Created by Lucas Neves dos santos pompeu on 29/06/23.
//

import Foundation

enum ExampleScripts: String {
    case displayAlert = """
    alert(`Page title: ${document.title}\nPage URL: ${document.URL}`);
    """
    case replacePageContent = """
    document.body.innerHTML = "";
    var p = document.createElement("p");
    p.textContent = "I have replaced the page content!";
    document.body.appendChild(p);
    """
}
