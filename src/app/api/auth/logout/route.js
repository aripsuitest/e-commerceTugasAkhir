import { NextResponse } from "next/server";

export async function DELETE() {
  const response = NextResponse.json({
    status: "ok",
    message: "Logout berhasil",
  });

  // Hapus cookie dengan mencocokkan properti aslinya
  response.cookies.set("token", "", {
    path: "/",
    expires: new Date(0),
  });

  response.cookies.set("user", "", {
    path: "/",
    expires: new Date(0),
  });

  return response;
}
