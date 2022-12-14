import express from "express"
import mysql from 'mysql'
import fs from 'fs'

const app = express()

const connection = mysql.createConnection({
    host: 'vps1.dba-training.online',
    user: 'sql-basis',
    password: 'sql-basis',
    database: 'mhl_database'
})

connection.connect()



app.get("/", (request, response) => { 
    connection.query('select * from management', (err, rows, fields) => {
        if(err) throw(err)
        response.send(rows)
    })
})

app.get("/get/:table", (request, response) => {
    connection.query(`select * from ${request.params.table}`, (err, rows, fields) => {
        if(err) throw(err)
        response.send(rows)
    })
})

app.get("/get/:table/:id", (request, response) => {
    connection.query(`select * from mhl_${request.params.table} where id = ?`, 
                     [request.params.id],
                     (err, rows, fields) => {
        if(err) throw(err)
        response.send(rows)
    })
})

app.get("/sql/:name", (request, response) => {
  const f = `sql/${request.params.name}.sql`
  const sql = fs.readFileSync(f,'utf-8')

  connection.query(sql, (err, rows, fields) => {
        if(err) throw(err)
        response.send(rows)
  })

})

app.listen(3001, () => {
    console.log("Running!")
})