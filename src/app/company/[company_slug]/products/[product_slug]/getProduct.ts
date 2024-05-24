import prisma from '@/lib/db';
import type { Product } from '@prisma/client';

export async function fetchProductData(
  company: string | string[] | undefined,
  slug: string | string[] | undefined
): Promise<Product> {
  if (typeof slug === 'string' && typeof company === 'string') {
    const product = await prisma.product.findFirst({
      include: {
        Company: true,
        ProductScraper: {
          include: {
            ProductScraperHistory: {
              orderBy: {
                created: 'desc',
              },
              take: 25,
            },
          },
        },
      },
      where: { slug: slug, Company: { slug: company } },
    });

    if (!product) throw new TypeError('fetchProductData: product is null');
    return product;
  } else {
    throw new TypeError('fetchProductData: slug or domain is not a string');
  }
}
