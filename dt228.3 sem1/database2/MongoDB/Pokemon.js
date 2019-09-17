fire = db.Pokemon.find({$or:[{"Type1":"Fire"},{"Type2":"Fire"}]}).toArray()  //find fire pokemon and store in fire as array
for(i = 0; i< fire.length; i ++)
{
printjson(fire[i].Sp);
}
for(i = 0; i< fire.length; i ++)  //use for loop to insert array fire into FirePokemon
{
db.FirePokemon.insert(
{ 
    "Name" : fire[i].Name,
    "Type": {
    "Type1" : fire[i].Type1, 
    "Type2" : fire[i].Type2 
    },
    "Total" : fire[i].Total, 
    "HP" : fire[i].HP, 
    "Attack" : fire[i].Attack, 
    "Defense" : fire[i].Defense, 
    "Sp" : 
        fire[i].Sp
    , 
    "Speed" : fire[i].Speed, 
    "Generation" : fire[i].Generation, 
    "Legendary" : fire[i].Legendary
}
)
}

Legendary = db.Pokemon.find({"Total":{$gt:400}, "Legendary":true}).toArray() //create array Legendary to store the pokemon which are legendary and total more than 400

for(i = 0; i< Legendary.length; i ++) //use for loop to insert array legendary into Legendary pokemon
{
db.LegendaryPokemon.insert(
{ 
    "Name" : Legendary[i].Name,
    "Type": {
    "Type1" : Legendary[i].Type1, 
    "Type2" : Legendary[i].Type2 
    },
    "Total" : Legendary[i].Total,
    "Ability":{
     
    "HP" : Legendary[i].HP, 
    "Attack" : Legendary[i].Attack, 
    "Defense" : Legendary[i].Defense, 
    "Sp" : 
        Legendary[i].Sp
    , 
    "Speed" : Legendary[i].Speed }, 
    "Generation" : Legendary[i].Generation, 
    "Legendary" : Legendary[i].Legendary
}
)
}

db.LegendaryPokemon.find({"Ability.Sp. Def":{$lt:100}}).sort({"Ability.Sp. Def":1}) // find pokemons which are sp def less than 100 from LegendaryPokemon
db.Pokemon.find({$or:[{"Type1":"Water"}, {"Type2":"Water"}],"Legendary":false}) //find pokemon which type is water and not a legendary 

db.FirePokemon.find({"Attack": {$gte:50, $lte:100}},{_id:0}).sort({"Attack":-1}) //find pokemons which are attack more than 50 and less than 100 use descending order and hide _id

db.FirePokemon.find( { "Generation": 2},{_id:0, "Name" :1, "Type.Type2":1} ) //to find second seneration of pokemon adn just how name and type2


db.Pokemon.aggregate([{$match:{"Generation":1}}, {$group:{_id:"$Type1", "TotalAttack":{$sum:"$Attack"}}}])//to aggregate the different type of pokemon and show the total attack

//to aggregate the pokemon special attack less than 100 and show tatal special attcak of different type of polemon
db.LegendaryPokemon.aggregate([{$match:{"Ability.Sp. Atk":{$lt:100}}}, {$group:{_id:"$Type.Type1", "TotalAttack":{$sum:"$Ability.Sp. Atk"}}}])