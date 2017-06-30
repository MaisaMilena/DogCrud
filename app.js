var express = require('express')
var app = express()

var dogs = []


app.get('/', (req, res, err) => {
	res.send('Servidor up')
})

// Essa barrinha antes do Dog indica o root
app.get('/dogs', (req, res, err) => {

	res.send(JSON.stringify(dogs))
})


app.post('/', (req, res, err) => {

	var dog = req.query
	if (dog.name && dog.breed){
		dogs.push(dog)
		res.send(JSON.stringify(dog))
	} else {
		res.send('Invalid dog')
	}

})






app.listen(3000)