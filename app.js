var express = require('express')
var app = express()
// Esse ./ no início está dizendo que está na mesma pasta raíz que esse arquivo app.js
var database = require('./database')


app.get('/', (req, res, err) => {
	res.send('Servidor up')
})

app.get('/dogs', (req, res, err) => {
	database.getAllDogs((err, rows) => {
		if (!err) {
			res.status(200).json(rows)
		} else {
			res.status(500).json('Internal server error: ' + err)
		}
	})


})


app.post('/', (req, res, err) => {

	var dog = req.query
	if (dog.name && dog.breed){
		
		database.insertDog(dog, (err) => {
			if (!err) {
				res.status(200).json(dog)
			} else {
				res.status(400).json('Invalid insertion: '+ err)
			}
		})
	} else {
		
	}

})






app.listen(3000)