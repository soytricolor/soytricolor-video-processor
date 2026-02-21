import express from "express";

const app = express();

app.get("/", (req, res) => {
  res.send("soytricolor-video-processor OK");
});

const port = process.env.PORT || 8080;

app.listen(port, () => {
  console.log("Server running on port " + port);
});
