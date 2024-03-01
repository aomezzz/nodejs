require("dotenv").config();
const express = require("express");
const cors = require("cors");
const app = express();
const mysql = require("mysql2");

app.use(cors());
app.use(express.json());

const connection = mysql.createConnection(process.env.DATABASE_URL);

app.all("/", (req, res) => {
    console.log("Just got a request!");
    res.send("Yo!");
});

app.get("/food", (req, res) => {
    connection.query("SELECT * FROM tbl_menu WHERE menuID = 1", function (err, results, fields) {
        if (err) {
            console.error(err);
            return res.status(500).send("Error fetching data from database");
        }
        res.send(results);
    });
});

app.post("/addmenu", function (req, res) {
    const { menuID, menuName } = req.body;
    if (!menuID || !menuName) {
        return res.status(400).send("Both menuID and menuName are required");
    }
    connection.query(
        "INSERT INTO tbl_menu (menuID, menuName) VALUES (?,?)",
        [req.body.menuID, req.body.menuName],
        function (err, results) {
            if (err) {
                console.error(err);
                return res.status(500).send("Error adding new menu");
            }
            return res.send({
                err: false,
                data: results,
                message: "New menu has been created successfully.",
            });
        }
    );
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
  