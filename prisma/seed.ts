import { PrismaClient, Roles, WorkerStatus } from "@prisma/client";
import bcrypt from "bcryptjs";

const prisma = new PrismaClient();

async function main() {
  // Seed User
  const users = await Promise.all(
    [
      { name: "User 1", role: Roles.user, email: "user1@gmail.com" },
      { name: "User 2", role: Roles.user, email: "user2@gmail.com" },
      { name: "User 3", role: Roles.user, email: "user3@gmail.com" },
      { name: "Admin", role: Roles.admin, email: "admin@gmail.com" },
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

  // Seed Workers
  const workers = await Promise.all(
    users.map((user, index) => {
      return prisma.worker.create({
        data: {
          userId: user.id,
          description: `Deskripsi untuk ${user.name}`,
          status: index === 3 ? WorkerStatus.active : WorkerStatus.inactive,
          banner: "https://example.com/banner.jpg",
        },
      });
    })
  );

  // Seed Categories
  const categories = await Promise.all(
    [
      {
        name: "Konstruksi",
        image: "fas fa-hard-hat",
        description:
          "Pembangunan dan renovasi rumah, gedung, dan infrastruktur dengan tenaga ahli profesional.",
      },
      {
        name: "Elektronik",
        image: "fas fa-tv",
        description:
          "Layanan instalasi, perbaikan, dan penjualan perangkat elektronik rumah tangga dan kantor.",
      },
      {
        name: "Otomotif",
        image: "fas fa-car",
        description:
          "Servis dan perawatan kendaraan bermotor, termasuk modifikasi, sparepart, dan inspeksi berkala.",
      },
      {
        name: "Serba Bisa",
        image: "fas fa-toolbox",
        description:
          "Layanan umum seperti tukang, kebersihan, pengangkutan, hingga konsultasi solusi harian.",
      },
    ].map((category) => {
      return prisma.category.create({
        data: category,
      });
    })
  );

  // Seed SubCategories
  await Promise.all(
    [
      { name: "Cat Rumah", categoryId: categories[0].id },
      { name: "Bangunan", categoryId: categories[0].id },
      { name: "AC", categoryId: categories[1].id },
      { name: "TV", categoryId: categories[1].id },
      { name: "Radio Klasik", categoryId: categories[2].id },
      { name: "Ganti Ban", categoryId: categories[2].id },
    ].map((subCategory) => {
      return prisma.subCategory.create({
        data: subCategory,
      });
    })
  );

  // Seed WorkerCategories
  await Promise.all(
    [
      { workerId: workers[0].id, categoryId: categories[0].id },
      { workerId: workers[1].id, categoryId: categories[1].id },
      { workerId: workers[2].id, categoryId: categories[2].id },
    ].map((wc) => {
      return prisma.workerCategory.create({
        data: wc,
      });
    })
  );

  console.log("✅ Seeding data berhasil.");
}

main()
  .then(async () => {
    await prisma.$disconnect();
  })
  .catch(async (e) => {
    console.error("❌ Error saat seeding:", e);
    await prisma.$disconnect();
    process.exit(1);
  });
