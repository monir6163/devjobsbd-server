const { PrismaClient } = require("@prisma/client");
const { parse } = require("dotenv");
const prisma = new PrismaClient();
class jobServices {
  get_jobs = async (
    job_type,
    tech_stack,
    hiring_type,
    skipData,
    jobParpage
  ) => {
    let searchFilter = {};
    if (job_type || tech_stack || hiring_type) {
      searchFilter = {
        OR: [
          job_type ? { workType: { some: { workType: job_type } } } : {},
          tech_stack
            ? { primaryTechStack: { some: { techStack: tech_stack } } }
            : {},
          hiring_type
            ? { hireInternsandFreshers: { some: { hireType: hiring_type } } }
            : {},
        ],
      };
    }

    const where = {
      AND: [
        searchFilter,
        { status: 1 }, // Assuming status 1 indicates active jobs
      ],
    };
    const totalCount = await prisma.companies.count({ where });
    const result = await prisma.companies.findMany({
      where,
      skip: parseInt(skipData),
      take: parseInt(jobParpage),
      include: {
        primaryTechStack: {
          select: {
            techStack: true,
          },
        },
        workType: {
          select: {
            workType: true,
          },
        },
        hireInternsandFreshers: {
          select: {
            hireType: true,
          },
        },
        currentHiringRole: {
          select: {
            hiringRole: true,
          },
        },
      },
      orderBy: {
        createdAt: "desc",
      },
    });
    return {
      result,
      totalCount,
    };
  };

  get_techStack = async () => {
    return prisma.primaryTechStack.findMany({
      select: {
        techStack: true,
      },
      // manay tech stack same name i want to remove duplicate
      distinct: ["techStack"],
    });
  };

  add_job = async ({
    companyName,
    companyLogo,
    companyUrl,
    companyLinkedin,
    companyFacebook,
    companyCareersUrl,
    workType,
    hireInternsandFreshers,
    officeLocation,
    established,
    totalEmployees,
    primaryTechStack,
    currentHiringRole,
    companyDescription,
    companyEmail,
    salaryRange,
  }) => {
    let techStack = primaryTechStack ? primaryTechStack.split(",") : [];
    let currentHiringRoles = currentHiringRole
      ? currentHiringRole.split(",")
      : [];
    let workTypes = workType ? workType.split(",") : [];
    let hiretypes = hireInternsandFreshers
      ? hireInternsandFreshers.split(",")
      : [];

    return prisma.companies.create({
      data: {
        companyName,
        companyLogo,
        companyUrl,
        companyLinkedin,
        companyFacebook,
        companyCareersUrl,
        workType: {
          create: workTypes?.map((work) => {
            return {
              workType: work,
            };
          }),
        },
        hireInternsandFreshers: {
          create: hiretypes?.map((hire) => {
            return {
              hireType: hire,
            };
          }),
        },
        officeLocation,
        established,
        totalEmployees,
        companyDescription,
        currentHiringRole: {
          create: currentHiringRoles.map((role) => {
            return {
              hiringRole: role,
            };
          }),
        },
        companyEmail,
        salaryRange,
        primaryTechStack: {
          create: techStack.map((tech) => {
            return {
              techStack: tech,
            };
          }),
        },
      },
    });
  };
}

module.exports = new jobServices();
