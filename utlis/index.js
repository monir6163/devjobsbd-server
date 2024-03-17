const jobRoutes = require("../routes/jobRoutes");
const { Router } = require("express");
const router = Router();

const moduleRoutes = [
  {
    path: "/jobs",
    route: jobRoutes,
  },
  // {
  //   path: "/categories",
  //   route: categoryRoutes,
  // },
  // {
  //   path: "/products",
  //   route: productRoutes,
  // },
];

moduleRoutes.forEach((route) => router.use(route.path, route.route));

module.exports = router;
