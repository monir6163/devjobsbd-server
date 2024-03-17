const jobServices = require("../services/jobServices");
const { formidable } = require("formidable");

class jobControllers {
  add_job = async (req, res, next) => {
    try {
      const formData = formidable({});
      const [fields, files] = await formData.parse(req);
      // [ '[{"value":"onsite","label":"OnSite"}]' ] => [ 'onsite' ]
      fields.workType = JSON.parse(fields.workType);
      fields.hireInternsandFreshers = JSON.parse(fields.hireInternsandFreshers);

      const result = await jobServices.add_job({
        companyName: fields.companyName[0]?.trim(),
        companyLogo: files.companyLogo ? files.companyLogo[0]?.filepath : "",
        companyUrl: fields.companyUrl[0]?.trim(),
        companyLinkedin: fields.companyLinkedin
          ? fields.companyLinkedin[0]?.trim()
          : null,
        companyFacebook: fields.companyFacebook
          ? fields.companyFacebook[0]?.trim()
          : null,
        companyCareersUrl: fields.companyCareersUrl[0]?.trim(),
        workType: fields.workType?.map((work) => work?.value).join(","), // "onsite,hybrid,remote"
        hireInternsandFreshers: fields.hireInternsandFreshers
          ?.map((data) => data?.value)
          .join(","), // "hireInterns,hireFreshers"
        officeLocation: fields.officeLocation
          ? fields.officeLocation[0]?.trim()
          : null,
        established: fields.established ? fields.established[0]?.trim() : null,
        totalEmployees: fields.totalEmployees
          ? fields.totalEmployees[0]?.trim()
          : null,
        primaryTechStack: fields.primaryTechStack
          ? fields.primaryTechStack[0]?.trim()
          : null,
        currentHiringRole: fields.currentHiringRole
          ? fields.currentHiringRole[0]?.trim()
          : null,
        companyDescription: fields.companyDescription
          ? fields.companyDescription[0]
          : null,
        companyEmail: fields.companyEmail
          ? fields.companyEmail[0]?.trim()
          : null,
        salaryRange: fields.salaryRange ? fields.salaryRange[0]?.trim() : null,
      });
      res.status(201).json({
        status: "success",
        message: "Job added successfully",
      });
    } catch (error) {
      next(error);
    }
  };

  get_jobs = async (req, res, next) => {
    try {
      const { job_type, tech_stack, hiring_type, skipData, jobParpage } =
        req.query;

      const result = await jobServices.get_jobs(
        job_type,
        tech_stack,
        hiring_type,
        skipData,
        jobParpage
      );
      res.status(200).json({
        status: "success",
        data: result.result,
        totalCount: result.totalCount,
      });
    } catch (error) {
      next(error);
    }
  };

  //get tech stack
  get_techStack = async (req, res, next) => {
    try {
      const result = await jobServices.get_techStack();
      res.status(200).json({ status: "success", data: result });
    } catch (error) {
      next(error);
    }
  };
}

module.exports = new jobControllers();
