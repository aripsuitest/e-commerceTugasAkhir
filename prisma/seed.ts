import { PrismaClient, Roles } from "@prisma/client";
import bcrypt from "bcryptjs";

const prisma = new PrismaClient();

async function main() {
  // Seed User
  await Promise.all(
    [
      { name: "user", role: Roles.user, email: "user@gmail.com" },
      { name: "admin", role: Roles.admin, email: "admin@gmail.com" },
    ].map(async (user) => {
      const password = await bcrypt.hash("user123", 10);
      return prisma.user.create({
        data: {
          ...user,
          password,
        },
      });
    })
  );

  console.log("Seeding data berhasil.");
}

main()
  .then(async () => {
    await prisma.$disconnect();
  })
  .catch(async (e) => {
    console.error(e);
    await prisma.$disconnect();
    process.exit(1);
  });
