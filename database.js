var sqlite3 = require('sqlite3').verbose()

var db = new sqlite3.Database('./db')

db.run('CREATE TABLE IF NOT EXISTS dog(name TEXT, breed TEXT)', (err) => {
	if (err) {
		console.log('Error creating table '+ err)
	}
	
})

var insertDog = (dog, callback) => {
	var query = db.prepare('INSERT INTO dog VALUES (?, ?)')
	query.run(dog.name, dog.breed, callback)
}

var getAllDogs = (callback) => {
	db.all('SELECT rowid AS id, * FROM dog', callback)
}

// Tornar visível os métodos que foram criados para que arquivos externos possam vê-los
module.exports = {
	insertDog,
	getAllDogs
}




