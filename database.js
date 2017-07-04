var sqlite3 = require('sqlite3').verbose()

var db = new sqlite3.Database('./db')

//db.run('DROP TABLE dog')
db.run('CREATE TABLE IF NOT EXISTS dog(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, color TEXT)', (err) => {
	if (err) {
		console.log('Error creating table '+ err)
	}
	
})

var insertDog = (dog, callback) => {
	var query = db.prepare('INSERT INTO dog VALUES (?,?, ?)')
	query.run(dog.id, dog.name, dog.color, callback)
}

var getAllDogs = (callback) => {
	db.all('SELECT id, * FROM dog', callback)
}

var deleteDogById = (dog, callback) => {
	var query = db.prepare('DELETE FROM dog WHERE id = ?')
	query.run(dog.id, callback)
}

var updateDogById = (dog, callback) => {
	var query = db.prepare('UPDATE dog SET name = ?, color = ? WHERE id = ?')
	query.run(dog.name, dog.color, dog.id, callback)

}

// Tornar visível os métodos que foram criados para que arquivos externos possam vê-los
module.exports = {
	insertDog,
	getAllDogs,
	updateDogById,
	deleteDogById
}




