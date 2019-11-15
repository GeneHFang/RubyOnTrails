Discovery.destroy_all
Place.destroy_all

#Place

temple = Place.create(name: "Cambodian Jungle Temple")
castle = Place.create(name: "Abandoned Castle")

#Discoveries
    #Temple Discoveries 
    Animal.create(name: "Hungry Tiger", place: temple)
    Animal.create(name: "Enraged Monkey", place: temple)
    Artifact.create(name: "Copper Idol", place: temple)
    Artifact.create(name: "Ornate Vase", place: temple)
    Flora.create(name: "Strange Roots", place: temple)
    Flora.create(name: "Vibrant Berries", place: temple)

    #Castle Discoveries
    Animal.create(name: "Poisonous Snake", place: castle)
    Animal.create(name: "Giant Scorpion", place: castle)
    Artifact.create(name: "Preserved Painting", place: castle)
    Artifact.create(name: "Rusty Sword", place: castle)
    Flora.create(name: "Leafy Vines", place: castle)
    Flora.create(name: "Juicy Moss", place: castle)


    
