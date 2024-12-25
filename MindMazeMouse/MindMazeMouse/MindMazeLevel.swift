//
//  Level.swift
//  MindMazeMouse
//
//  Created by MindMazeMouse on 2024/12/25.
//


// Level Model
struct MindMazeLevel {
    let levelNumber: Int          // Level number
    let questions: [MindMazeQuestion]     // Array of questions
}


let levels: [MindMazeLevel] = [
    MindMazeLevel(levelNumber: 1, questions: [
        MindMazeQuestion(
            questionText: "Find the TV Remote!",
            scenario: "The remote is missing in the family room. You can see a couch, coffee table, and cushions.",
            answer: "Cushion"
        ),
        MindMazeQuestion(
            questionText: "Turn on the Lights!",
            scenario: "The room is dark, and the light switch doesn’t seem to work. There is a lamp nearby.",
            answer: "Lamp"
        ),
        MindMazeQuestion(
            questionText: "Fix the Broken Clock!",
            scenario: "The wall clock has stopped. You notice a drawer with some items inside.",
            answer: "Battery"
        ),
        MindMazeQuestion(
            questionText: "Clean the Messy Room!",
            scenario: "Toys, books, and pillows are scattered all over the floor. There’s a basket in the corner.",
            answer: "Basket"
        ),
        MindMazeQuestion(
            questionText: "Stop the Dog from Barking!",
            scenario: "A dog is barking loudly near the sofa. You see a bone lying nearby.",
            answer: "Bone"
        ),
        MindMazeQuestion(
            questionText: "Find Grandpa's Glasses!",
            scenario: "Grandpa is sitting on the armchair and can’t find his glasses. Look carefully at him.",
            answer: "Head"
        ),
        MindMazeQuestion(
            questionText: "Catch the Flying Balloon!",
            scenario: "A helium balloon is floating toward the ceiling. There’s a fan on the table.",
            answer: "Fan"
        ),
        MindMazeQuestion(
            questionText: "Fix the Family Photo!",
            scenario: "A picture frame on the wall is crooked, and there’s a small nail nearby.",
            answer: "Tap"
        ),
        MindMazeQuestion(
            questionText: "Find the Hidden Key!",
            scenario: "The key to the cabinet is missing. Look under objects in the room.",
            answer: "Rug"
        ),
        MindMazeQuestion(
            questionText: "Help the Baby Reach the Toy!",
            scenario: "A baby is crying because their toy is on a high shelf. You notice a chair nearby.",
            answer: "Chair"
        )
    ]),
    MindMazeLevel(levelNumber: 2, questions: [
        MindMazeQuestion(
            questionText: "Help the Cat Drink Milk!",
            scenario: "A cat is sitting by an empty bowl. There’s a cow in the background.",
            answer: "Cow"
        ),
        MindMazeQuestion(
            questionText: "Which One is the Tallest?",
            scenario: "A tree, a giraffe, and a mountain are visible in the scene.",
            answer: "Sun"
        ),
        MindMazeQuestion(
            questionText: "Make the Baby Stop Crying!",
            scenario: "A baby is crying with a teddy bear, milk bottle, and rattle nearby.",
            answer: "Tilt"
        ),
        MindMazeQuestion(
            questionText: "Unlock the Treasure Chest!",
            scenario: "A treasure chest is locked, but the key is nowhere to be found.",
            answer: "Shake"
        ),
        MindMazeQuestion(
            questionText: "Find the Largest Number!",
            scenario: "Numbers like 15, 30, 45, and 60 are written on the screen.",
            answer: "600"
        ),
        MindMazeQuestion(
            questionText: "Wake the Sleeping Bear!",
            scenario: "A bear is sleeping under a tree, and nothing seems to wake it.",
            answer: "Sun"
        ),
        MindMazeQuestion(
            questionText: "Help the Fish Survive!",
            scenario: "A fish is on land and gasping for water. There’s a cloud above.",
            answer: "Rain"
        ),
        MindMazeQuestion(
            questionText: "Find the Hidden Bird!",
            scenario: "A tree with a nest, but no visible bird. Maybe it’s hiding.",
            answer: "Shake"
        ),
        MindMazeQuestion(
            questionText: "Make the Ice Cream Cooler!",
            scenario: "The ice cream is melting fast in the heat. Clouds are visible.",
            answer: "Cloud"
        ),
        MindMazeQuestion(
            questionText: "Help the Boy Cross the River!",
            scenario: "A boy is stuck on one side of the river. The bridge is broken.",
            answer: "Boat"
        )
    ]),
    
    
    MindMazeLevel(levelNumber: 3, questions: [
        MindMazeQuestion(
            questionText: "Find the Lost Sock!",
            scenario: "A laundry basket is full of clothes, but one sock is missing. Look carefully around the room.",
            answer: "Under"
        ),
        MindMazeQuestion(
            questionText: "Fix the Leaking Pipe!",
            scenario: "Water is dripping from a pipe under the sink. A wrench is lying nearby.",
            answer: "Wrench"
        ),
        MindMazeQuestion(
            questionText: "Help the Mouse Escape!",
            scenario: "A mouse is trapped in a corner. There’s a cat nearby and a hole in the wall.",
            answer: "Hole"
        ),
        MindMazeQuestion(
            questionText: "Cool Down the Soup!",
            scenario: "A bowl of hot soup is steaming. You notice a window and a fan in the room.",
            answer: "Fan"
        ),
        MindMazeQuestion(
            questionText: "Find the Hidden Ball!",
            scenario: "A ball is missing. There’s a couch, a table, and a pile of blankets nearby.",
            answer: "Blankets"
        ),
        MindMazeQuestion(
            questionText: "Catch the Thief!",
            scenario: "A thief is running away in the dark. A flashlight is on the table.",
            answer: "Flashlight"
        ),
        MindMazeQuestion(
            questionText: "Save the Candle from Blowing Out!",
            scenario: "A candle is lit, but a gust of wind is coming from the window.",
            answer: "Window"
        ),
        MindMazeQuestion(
            questionText: "Make the Iceberg Float!",
            scenario: "An iceberg is stuck underwater. You notice the temperature is adjustable.",
            answer: "Heat"
        ),
        MindMazeQuestion(
            questionText: "Help the Kid Draw a Perfect Circle!",
            scenario: "The kid can’t draw a perfect circle. There’s a coin on the table.",
            answer: "Coin"
        ),
        MindMazeQuestion(
            questionText: "Fix the Stuck Door!",
            scenario: "A door is jammed. There’s a crowbar and a bottle of oil on the floor.",
            answer: "Oil"
        )
    ]),
    
    
    MindMazeLevel(levelNumber: 4, questions: [
        MindMazeQuestion(
            questionText: "Find the Missing Puzzle Piece!",
            scenario: "A puzzle is almost complete, but one piece is missing. The room is messy with books and toys.",
            answer: "Books"
        ),
        MindMazeQuestion(
            questionText: "Stop the Clock Alarm!",
            scenario: "An alarm clock is ringing loudly. The clock’s batteries are exposed.",
            answer: "Remove"
        ),
        MindMazeQuestion(
            questionText: "Turn Off the TV!",
            scenario: "The TV is playing loudly, and the remote is missing. You notice a button on the TV.",
            answer: "Button"
        ),
        MindMazeQuestion(
            questionText: "Help the Bird Fly Away!",
            scenario: "A bird is stuck inside the house. There’s an open window.",
            answer: "Window"
        ),
        MindMazeQuestion(
            questionText: "Fix the Broken Chair!",
            scenario: "A wooden chair is broken. You notice a hammer and nails nearby.",
            answer: "Hammer"
        ),
        MindMazeQuestion(
            questionText: "Stop the Cat from Scratching the Sofa!",
            scenario: "A cat is scratching the sofa. A toy mouse is lying on the floor.",
            answer: "Toy"
        ),
        MindMazeQuestion(
            questionText: "Find the Hidden Apple!",
            scenario: "An apple is hidden somewhere in the kitchen. Look carefully in the fruit basket.",
            answer: "Basket"
        ),
        MindMazeQuestion(
            questionText: "Cool Down the Laptop!",
            scenario: "A laptop is overheating. There’s an ice pack on the table.",
            answer: "Icepack"
        ),
        MindMazeQuestion(
            questionText: "Make the Kid Laugh!",
            scenario: "A kid is sitting on the floor looking sad. A funny mask is on the chair.",
            answer: "Mask"
        ),
        MindMazeQuestion(
            questionText: "Start the Old Clock!",
            scenario: "An old clock isn’t ticking. You see a key nearby.",
            answer: "Key"
        )
    ]),
    
    MindMazeLevel(levelNumber: 5, questions: [
        MindMazeQuestion(
            questionText: "Find the Hidden Treasure!",
            scenario: "A pirate map shows a treasure buried on the island. There’s a shovel nearby.",
            answer: "Shovel"
        ),
        MindMazeQuestion(
            questionText: "Help the Frog Cross the Pond!",
            scenario: "A frog is stuck on a lily pad, and there’s a large gap to the other side.",
            answer: "Log"
        ),
        MindMazeQuestion(
            questionText: "Light Up the Campfire!",
            scenario: "A campfire is ready, but it’s not lit. You see matches and dry leaves.",
            answer: "Matches"
        ),
        MindMazeQuestion(
            questionText: "Find the Kid’s Shoes!",
            scenario: "A kid can’t find their shoes. Look under the bed and near the closet.",
            answer: "Bed"
        ),
        MindMazeQuestion(
            questionText: "Catch the Falling Leaf!",
            scenario: "A leaf is falling from a tree, and it’s about to hit the ground.",
            answer: "Hand"
        ),
        MindMazeQuestion(
            questionText: "Fix the Broken Kite!",
            scenario: "The kite is torn, but there’s tape nearby.",
            answer: "Tape"
        ),
        MindMazeQuestion(
            questionText: "Help the Dog Find Its Bone!",
            scenario: "A dog is sniffing around the garden. There’s a spot with loose dirt.",
            answer: "Dig"
        ),
        MindMazeQuestion(
            questionText: "Turn Off the Leaking Tap!",
            scenario: "Water is leaking from a tap. The valve is within reach.",
            answer: "Valve"
        ),
        MindMazeQuestion(
            questionText: "Clean the Foggy Window!",
            scenario: "A window is covered in fog. You notice a piece of cloth nearby.",
            answer: "Cloth"
        ),
        MindMazeQuestion(
            questionText: "Fix the Broken Mirror!",
            scenario: "A mirror is cracked, but there’s glue on the table.",
            answer: "Glue"
        )
    ]),
    MindMazeLevel(levelNumber: 6, questions: [
        MindMazeQuestion(
            questionText: "Find the Escaping Balloon!",
            scenario: "A balloon is floating away. There’s a stick nearby.",
            answer: "Stick"
        ),
        MindMazeQuestion(
            questionText: "Wake Up the Sleepy Owl!",
            scenario: "An owl is dozing on a branch. You notice a flashlight in the scene.",
            answer: "Flashlight"
        ),
        MindMazeQuestion(
            questionText: "Clean the Dirty Window!",
            scenario: "A window is dirty, but there’s soap and water nearby.",
            answer: "Soap"
        ),
        MindMazeQuestion(
            questionText: "Find the Golden Egg!",
            scenario: "A hen is sitting on some eggs. One of them looks shiny.",
            answer: "Lift"
        ),
        MindMazeQuestion(
            questionText: "Stop the Crying Baby!",
            scenario: "A baby is crying in the crib. There’s a pacifier on the table.",
            answer: "Pacifier"
        ),
        MindMazeQuestion(
            questionText: "Open the Jammed Drawer!",
            scenario: "A drawer is stuck. A crowbar is within reach.",
            answer: "Crowbar"
        ),
        MindMazeQuestion(
            questionText: "Help the Kid Find Their Hat!",
            scenario: "A hat is missing. Look near the coat rack.",
            answer: "Rack"
        ),
        MindMazeQuestion(
            questionText: "Make the Flowers Bloom!",
            scenario: "Flowers are wilting. You notice a watering can in the corner.",
            answer: "Water"
        ),
        MindMazeQuestion(
            questionText: "Turn on the Fan!",
            scenario: "The fan is off. The switch is visible on the wall.",
            answer: "Switch"
        ),
        MindMazeQuestion(
            questionText: "Find the Lost Keychain!",
            scenario: "A keychain is missing. Look near the couch cushions.",
            answer: "Cushions"
        )
    ])
]
