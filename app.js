var express = require('express')
var app = express()
// Esse ./ no início está dizendo que está na mesma pasta raíz que esse arquivo app.js
var database = require('./database')


app.get('/', (req, res, err) => {
	res.send('Servidor up')
})

// Chamada para selecionar todos os Dog via GET
app.get('/dogs', (req, res, err) => {
	database.getAllDogs((err, rows) => {
		if (!err) {
			res.status(200).json(rows)
		} else {
			res.status(500).json('Internal server error: ' + err)
		}
	})


})

// Chamada para insert em Dog via POST
app.post('/dogs/insert', (req, res, err) => {

	var dog = req.query
	database.insertDog(dog, (err) => {
			if (!err) {
				res.status(200)
				res.send('Dog registrado com sucesso!')
			} else {
				res.status(400).json('Invalid insertion: '+ err)
			}
	})

})

// Chamada para deletar um Dog via DELETE
app.delete('/dogs/delete', (req, res, err) => {

	var dog = req.query
	database.deleteDogById(dog, (err) => {
		if(!err) {
			res.send('Doguinho de id '+dog.id+ ' excluído')
		} else {
			res.status(400).json('Delete problem: '+err)
		}
	})
})


// Chamada para atualizar um Dog via POST
app.post('/dogs/update', (req, res, err) => {

	var dog = req.query
	database.updateDogById(dog, (err) => {
		if(!err) {
			res.send('Doguinho de id '+dog.id+' atualizado')
		} else {
			res.status(400).json('Update problem: '+err)
		}
	})
})





app.listen(3000)