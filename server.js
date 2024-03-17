const express = require("express");
const dotenv = require("dotenv");
const bodyParser = require("body-parser");
const cors = require("cors");
const router = require("./utlis");
const app = new express();
const rateLimit = require("express-rate-limit");
const helmet = require("helmet");
const xss = require("xss-clean");
const hpp = require("hpp");
const cookieParser = require("cookie-parser");
dotenv.config();
app.use(bodyParser.json({ limit: "50mb" }));
app.use(bodyParser.urlencoded({ extended: true, limit: "50mb" }));
if (process.env.mode === "production") {
  app.use(cors({ origin: "*" }));
} else {
  app.use(cors({ origin: "http://localhost:3000" }));
}
const port = process.env.Port || 5000;
// Set security headers
app.use(helmet());
// Prevent XSS attacks
app.use(xss());
// Prevent http param pollution
app.use(hpp());
// Cookie Parser
app.use(cookieParser());
// Rate Limiting
// const limiter = rateLimit({
//   windowMs: 10 * 60 * 1000, // 10 minutes
//   max: 100, // limit each IP to 100 requests per windowMs
// });
// app.use(limiter);
// Routes for the app
app.use("/api", router);
app.get("/", (req, res) => {
  res.send("devjobsbd server is up and running!");
});

//error handling middleware function for all routes
app.use((err, req, res, next) => {
  console.log(err);
  const message = err.message ? err.message : "Server Error Occurred";
  const status = err.status ? err.status : 500;
  res.status(status).json({
    message,
  });
});

app.listen(port, () => {
  console.log(`devjobsbd app listening at http://localhost:${port}`);
});
