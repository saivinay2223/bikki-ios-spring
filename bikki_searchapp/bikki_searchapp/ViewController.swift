//
//  ViewController.swift
//  bikki_searchapp
//
//  Created by sai vinay kumar bikki on 3/31/25.
//

import UIKit
import AudioUnit

class ViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var searchButtonAction: UIButton!
    
    @IBOutlet weak var resultImage: UIImageView!
    
    @IBOutlet weak var ShowPrevImageBtn: UIButton!
    
    @IBOutlet weak var ResetBtn: UIButton!
    
    @IBOutlet weak var ShowNextImageBtn: UIButton!
    
    @IBOutlet weak var topicInfoText: UITextView!
    var currentTopicIndex = 0
        var currentImageIndex = 0

        let topicNames = ["Beautiful Bridges", "Breathtaking Beaches", "Bountiful Birds", "Brilliant Buildings", "Buzzing Bazaars"]

        let allPics = [
            ["brooklynbridge", "goldengate", "towerbridge"],
            ["bondibeach", "bali", "bahamas"],
            ["bluejay", "baldEagle", "barnOwl"],
            ["burjkhalifa", "bigben", "bankofchina"],
            ["bazaaristanbul", "bazaarmarrakech", "bazaardelhi"]
        ]

        let topicKeywords = [
            ["bridges", "architecture", "landmarks"],
            ["beaches", "coastline", "ocean"],
            ["birds", "nature", "wildlife"],
            ["buildings", "skyscrapers", "monuments"],
            ["markets", "shopping", "culture"]
        ]

    let topicDescriptions = [
            ["Brooklyn Bridge: A historic suspension bridge in New York City, connecting Manhattan and Brooklyn. It was completed in 1883 and is one of the oldest roadway bridges in the United States. Its neo-Gothic towers and steel cables make it a marvel of engineering and a popular tourist attraction.",
             "Golden Gate Bridge: An iconic red suspension bridge spanning the Golden Gate Strait in San Francisco, California. Opened in 1937, it was once the longest suspension bridge in the world and remains one of the most photographed structures globally.",
             "Tower Bridge: A beautiful bascule and suspension bridge in London, crossing the River Thames. Completed in 1894, it features two towers connected by walkways and a central section that lifts to allow ships to pass."]
            ,
            ["Bondi Beach: A famous surf beach in Sydney, Australia, known for its golden sands, strong waves, and vibrant culture. It is a popular destination for surfers and tourists alike.",
             "Bali Beaches: Known for their scenic beauty, tropical vibes, and world-class resorts, Bali’s beaches attract millions of visitors each year. Some notable ones include Kuta, Seminyak, and Nusa Dua.",
             "Bahamas: Home to some of the most beautiful beaches in the world, including Pink Sands Beach and Cable Beach. The crystal-clear waters and coral reefs make it a paradise for snorkeling and diving."]
            ,
            ["Blue Jay: A vibrant blue-colored bird found in North America, known for its intelligence and complex social behavior. They are excellent mimics and can even imitate the calls of hawks.",
             "Bald Eagle: The national bird of the United States, symbolizing strength and freedom. These majestic birds are known for their impressive wingspan and keen hunting skills.",
             "Barn Owl: A nocturnal bird known for its heart-shaped face and silent flight. Found worldwide, they play a crucial role in controlling rodent populations."]
            ,
            ["Burj Khalifa: The tallest building in the world, located in Dubai, UAE. Standing at 828 meters (2,717 feet), it boasts breathtaking views, luxury residences, and high-end hotels.",
             "Big Ben: A famous clock tower in London, officially known as the Elizabeth Tower. It is part of the Houses of Parliament and one of the most recognizable landmarks in the UK.",
             "Bank of China Tower: A unique skyscraper in Hong Kong, designed by architect I. M. Pei. Its sharp angles and glass facade make it one of the city's most distinctive buildings."]
            ,
            ["Grand Bazaar Istanbul: One of the largest and oldest covered markets in the world, featuring over 4,000 shops. It is a hub for Turkish culture, selling everything from spices to jewelry.",
             "Marrakech Bazaar: A lively market in Morocco known for its vibrant atmosphere, exotic goods, and traditional handicrafts. The souks are filled with colorful textiles, spices, and street performances.",
             "Delhi Bazaar: A famous shopping destination in India, where you can find everything from street food and fabrics to intricate jewelry. Popular markets include Chandni Chowk and Dilli Haat."]
        ]
        override func viewDidLoad() {
            super.viewDidLoad()
            initializeView()
            searchTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        }

        func initializeView() {
            resultImage.image = UIImage(named: "welcome_screen")
            topicInfoText.text = "Hello,Vinay Welcome to the Search App!"
            searchButtonAction.isEnabled = false
            ShowNextImageBtn.isEnabled = false
            ShowPrevImageBtn.isEnabled = false
        }
    @objc func textFieldDidChange(_ textField: UITextField) {
            searchButtonAction.isEnabled = !(textField.text?.isEmpty ?? true)
        }


    @IBAction func searchButtonAction(_ sender: Any) {
        guard let searchText = searchTextField.text?.lowercased(), !searchText.isEmpty else { return }

                if let matchedTopicIndex = topicKeywords.firstIndex(where: { $0.contains(searchText) }) {
                    currentTopicIndex = matchedTopicIndex
                    currentImageIndex = 0
                    showTopicImage()
                    AudioServicesPlaySystemSound(1113)
                } else {
                    resultImage.image = UIImage(named: "not_found")
                    topicInfoText.text = "No results found for \(searchText)"
                }
            }

            func showTopicImage() {
                if currentTopicIndex < allPics.count {
                    let images = allPics[currentTopicIndex]
                    if currentImageIndex < images.count {
                        resultImage.image = UIImage(named: images[currentImageIndex])
                        if currentTopicIndex < topicDescriptions.count {
                            let descriptions = topicDescriptions[currentTopicIndex]
                            if currentImageIndex < descriptions.count {
                                topicInfoText.text = descriptions[currentImageIndex]
                            }
                        }
                    }
                }
                refreshButtonsState()
            }
    
    @IBAction func ShowNextImageBtn(_ sender: Any) {
        if currentTopicIndex < allPics.count,
                   currentImageIndex < allPics[currentTopicIndex].count - 1 {
                    currentImageIndex += 1
                    showTopicImage()
                    AudioServicesPlaySystemSound(1105)
                }
            }
    @IBAction func ShowPrevImageBtn(_ sender: Any) {
        if currentImageIndex > 0 {
                    currentImageIndex -= 1
                    showTopicImage()
                    AudioServicesPlaySystemSound(1105)
                }
            }

    @IBAction func ResetBtn(_ sender: Any) {
        initializeView()
                searchTextField.text = ""
                currentTopicIndex = 0
                currentImageIndex = 0
                AudioServicesPlaySystemSound(1111)
            }

            func refreshButtonsState() {
                ShowPrevImageBtn.isEnabled = currentImageIndex > 0
                ShowNextImageBtn.isEnabled = currentTopicIndex < allPics.count &&
                                      currentImageIndex < allPics[currentTopicIndex].count - 1
            }
        }

