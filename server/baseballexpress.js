import express from "express"
import mysql from "mysql"
import bodyParser from "body-parser"
import cors from "cors"

import dbconf from "./conf/auth.js"

const app = express()
const port = 3010

const db = mysql.createConnection(dbconf)

db.connect()

app.use(cors())
app.use(bodyParser.json())

app.get('/', (req, res) => {
  res.json({result: "success"})
})

app.get('/player', (req, res) => {
  const sql = 'SELECT picture, league, tname, pname, position, age, war FROM team \
LEFT JOIN playerlist ON team.id = playerlist.teamid \
LEFT JOIN player ON playerlist.playid = player.id;'
  
	db.query(sql, (err, rows) => {
		if (err) {
			res.json({result: "error"})
			return console.log(err)
		}
		res.json(rows)
	})
})

app.listen(port, () => {
  console.log(`서버 실행됨 (port ${port})`)
})