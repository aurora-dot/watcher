import prisma from '@/app/lib/db';
import type { Product } from '@prisma/client';
import { notFound } from 'next/navigation';

export const metadata = {
  title: 'Create Next App',
  description: 'Generated by create next app',
};

export function updateMetadata(product: Product) {
  metadata.title = product.name;
  metadata.description = product.name;
}

export default async function Page({
  params,
}: {
  params: { company: string; slug: string };
}) {
  let product: Product | null = null;
  try {
    product = await fetchProductData(params.company, params.slug);
  } catch (error) {
    if (error instanceof TypeError) notFound();
    else console.log(error);
  }

  if (!product) {
    notFound();
  }

  updateMetadata(product);

  return (
    <div>
      <h1>{product.name}</h1>
      <h2>{product.Company.name}</h2>
      <p>{product.ProductScraper[0].url}</p>
      {/* Hardcoding to ProductScraper[0] for now */}
      <h3>
        {product.ProductScraper[0].ScraperLambda.currencyType}
        {product.ProductScraper[0].ProductScraperHistory[0].price}
      </h3>
      <img
        src={product.ProductScraper[0].ProductScraperHistory[0].imageBase64}
      />
    </div>
  );
}

async function fetchProductData(
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
            ScraperLambda: {
              select: {
                currencyType: true,
              },
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