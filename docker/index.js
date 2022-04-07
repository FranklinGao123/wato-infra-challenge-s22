const express = require("express");
const app = express();
const port = 3000;

const studentID = "f39gao"; // change me!

app.get("/", (req, res) => {
    res.send(`Hello World from ${studentID}!`);
});

app.listen(port, () => {
    console.log(`Example app listening on port ${port}`);
});
