const jobControllers = require("../controllers/jobControllers");
const { Router } = require("express");
const router = Router();

router.post("/", jobControllers.add_job);
router.get("/", jobControllers.get_jobs);
router.get("/techStack", jobControllers.get_techStack);

module.exports = router;
