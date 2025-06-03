import { cookies } from "next/headers";
import { NextResponse } from "next/server";

export async function DELETE() {
  const cookieStore = await cookies();
  cookieStore.delete("token");
  cookieStore.delete("user");
  return NextResponse.json({ status: "ok", message: "anda berhasil logout!!" });
}
