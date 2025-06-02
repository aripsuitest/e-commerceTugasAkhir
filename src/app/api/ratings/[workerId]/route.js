import { NextResponse } from 'next/server';
import prisma from '@/lib/prisma';

export async function GET(request, { params }) {
  const { workerId } = params;  // Pastikan sudah di-destructure dari params

  const { searchParams } = new URL(request.url);
  const page = parseInt(searchParams.get('page') || '1');
  const limit = parseInt(searchParams.get('limit') || '3');
  const skip = (page - 1) * limit;

  try {
    // Get ratings with user data
    const ratings = await prisma.rating.findMany({
      where: {
        order: {
          workerId: workerId,   // Gunakan workerId dengan benar
        },
      },
      include: {
        order: {
          include: {
            user: true,
          },
        },
      },
      orderBy: {
        createdAt: 'desc',
      },
      skip,
      take: limit + 1,
    });

    // Calculate rating stats
    const ratingStats = await prisma.rating.groupBy({
      by: ['rating'],
      where: {
        order: {
          workerId: workerId,  // Gunakan workerId yang sudah diambil
        },
      },
      _count: {
        rating: true,
      },
    });

    const totalRatings = ratingStats.reduce((sum, stat) => sum + stat._count.rating, 0);
    const averageRating = totalRatings > 0
      ? (ratingStats.reduce((sum, stat) => sum + (stat.rating * stat._count.rating), 0) / totalRatings)
      : 0;

    // Prepare rating distribution
    const ratingDistribution = [5, 4, 3, 2, 1].map(star => {
      const stat = ratingStats.find(s => s.rating === star);
      const count = stat ? stat._count.rating : 0;
      return {
        stars: star,
        count,
        percentage: totalRatings > 0 ? Math.round((count / totalRatings) * 100) : 0,
      };
    });

    const hasMore = ratings.length > limit;
    const items = hasMore ? ratings.slice(0, limit) : ratings;

    return NextResponse.json({
      success: true,
      data: items,
      stats: {
        average: averageRating.toFixed(1),
        total: totalRatings,
        distribution: ratingDistribution,
      },
      pagination: {
        page,
        limit,
        hasMore,
      },
    });
  } catch (error) {
    console.error(error);
    return NextResponse.json(
      { success: false, error: 'Failed to fetch ratings' },
      { status: 500 },
    );
  }
}
