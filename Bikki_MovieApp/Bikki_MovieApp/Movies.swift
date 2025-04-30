//
//  Movies.swift
//  Bikki_MovieApp
//
//  Created by Vinay on 4/27/25.
//

import Foundation

struct Movies {
    var genre: String
    var list_Array: [MovieList]
}

struct MovieList {
    var movieName: String
    var movieImage: String
    var movieInfo: String
}

let genres = ["Action", "Drama", "Horror", "Sci-Fi"].sorted()

let actionMovies = [
    MovieList(movieName: "Extraction", movieImage: "extraction", movieInfo: "A fearless black-market mercenary embarks on the deadliest mission of his career. He must rescue the kidnapped son of an imprisoned international crime lord. Set in a ruthless underworld, the mission becomes deeply personal."),
    MovieList(movieName: "Top Gun: Maverick", movieImage: "topgun", movieInfo: "After more than 30 years of service, Maverick pushes the limits as a courageous test pilot. Facing ghosts of his past, he trains a new generation of fighter pilots. The film soars with action and emotional depth."),
    MovieList(movieName: "Skyfall", movieImage: "skyfall", movieInfo: "James Bond's loyalty to M is tested as her past comes back to haunt her. As MI6 comes under attack, Bond must track down and destroy the threat. It’s a thrilling journey filled with action, betrayal, and sacrifice."),
    MovieList(movieName: "The Equalizer", movieImage: "equalizer", movieInfo: "A man with a mysterious past believes he has put his violent history behind him. But when he meets a young girl under the control of violent Russian gangsters, he returns to action. Justice will be served."),
    MovieList(movieName: "Mission Impossible: Fallout", movieImage: "fallout", movieInfo: "Ethan Hunt and his team race against time after a mission goes wrong. With ruthless assassins and old allies colliding, he faces his toughest challenge yet. Stunning stunts and intense sequences highlight this thrilling saga."),
]

let dramaMovies = [
    MovieList(movieName: "A Beautiful Mind", movieImage: "beautifulmind", movieInfo: "John Nash, a brilliant mathematician, struggles with schizophrenia. His genius is challenged as reality and delusion blur. It's a moving story of resilience, love, and the pursuit of greatness."),
    MovieList(movieName: "Good Will Hunting", movieImage: "goodwillhunting", movieInfo: "An MIT janitor with a gift for mathematics struggles to find direction in life. With the help of a therapist, he confronts his past. It’s an emotional journey of self-discovery and healing."),
    MovieList(movieName: "The Pursuit of Happyness", movieImage: "pursuit", movieInfo: "A struggling salesman endures hardship and homelessness while raising his son. Against all odds, he pursues a dream of a better future. A deeply inspiring true story about perseverance and hope."),
    MovieList(movieName: "Little Women", movieImage: "littlewomen", movieInfo: "The lives of four sisters unfold during the aftermath of the American Civil War. Their dreams, ambitions, and love for one another define their coming-of-age journey. A beautiful adaptation of a literary classic."),
    MovieList(movieName: "The Green Mile", movieImage: "greenmile", movieInfo: "A death row corrections officer encounters a gentle giant with a supernatural gift. The story explores miracles, injustice, and compassion. It's a deeply emotional journey of humanity and redemption."),
]

let horrorMovies = [
    MovieList(movieName: "The Babadook", movieImage: "babadook", movieInfo: "A widowed mother and her son are haunted by a sinister presence. As grief consumes them, the horror becomes chillingly real. A terrifying exploration of trauma and mental illness."),
    MovieList(movieName: "Midsommar", movieImage: "midsommar", movieInfo: "A grieving woman joins her boyfriend and friends on a trip to a remote Swedish village. What begins as an idyllic retreat quickly devolves into a nightmare. A disturbing and unforgettable horror experience."),
    MovieList(movieName: "The Ring", movieImage: "thering", movieInfo: "A cursed videotape kills its viewers seven days after watching it. A journalist races against time to unravel the mystery. The film blends suspense, dread, and supernatural horror masterfully."),
    MovieList(movieName: "The Witch", movieImage: "witch", movieInfo: "In 1630s New England, a Puritan family confronts forces of evil in the woods beyond their farm. Fear, isolation, and superstition unravel them. A chilling and atmospheric tale of terror."),
    MovieList(movieName: "Sinister", movieImage: "sinister", movieInfo: "A true-crime writer discovers disturbing footage that suggests the murder he’s investigating is the work of a serial killer. As he delves deeper, malevolent forces threaten his family. A terrifying story of obsession and horror."),
]

let sciFiMovies = [
    MovieList(movieName: "Arrival", movieImage: "arrival", movieInfo: "When mysterious spacecraft touch down across the globe, a linguist is recruited to communicate. She must race against time for answers. The film blends science fiction with emotional storytelling about connection and sacrifice."),
    MovieList(movieName: "Ex Machina", movieImage: "exmachina", movieInfo: "A young programmer is selected to participate in a ground-breaking experiment in synthetic intelligence. As he interacts with an advanced humanoid robot, trust and manipulation blur. A thought-provoking exploration of AI and humanity."),
    MovieList(movieName: "Edge of Tomorrow", movieImage: "edgeoftomorrow", movieInfo: "A soldier caught in a time loop relives a brutal battle against alien invaders. Each death brings him closer to victory. Smart, thrilling, and endlessly rewatchable."),
    MovieList(movieName: "The Martian", movieImage: "martian", movieInfo: "An astronaut is stranded on Mars and must survive using his ingenuity. Back on Earth, a team works tirelessly to bring him home. A gripping story of survival and resilience."),
    MovieList(movieName: "Tenet", movieImage: "tenet", movieInfo: "Armed with one word—Tenet—and fighting for the survival of the world, a protagonist journeys through a twilight world of international espionage. Time inversion becomes his weapon. A bold and mind-bending sci-fi thriller."),
]

let moviesCollection: [Movies] = [
    Movies(genre: "Action", list_Array: actionMovies),
    Movies(genre: "Drama", list_Array: dramaMovies),
    Movies(genre: "Horror", list_Array: horrorMovies),
    Movies(genre: "Sci-Fi", list_Array: sciFiMovies)
]
