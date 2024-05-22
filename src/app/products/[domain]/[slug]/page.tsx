import { useRouter } from 'next/router';
import prisma from '@/app/lib/db';
import type { Product } from '@prisma/client';
import { notFound } from 'next/navigation';

export default async function Page({
  params,
}: {
  params: { domain: string; slug: string };
}) {
  let product: Product | null = null;
  try {
    product = await fetchProductData(params.domain, params.slug);
  } catch (error) {
    console.log(error);
    if (error instanceof TypeError) notFound();
  }

  if (!product) {
    notFound();
  }

  return <h1>{product.name}</h1>;
}

async function fetchProductData(
  domain: string | string[] | undefined,
  slug: string | string[] | undefined
): Promise<Product> {
  if (typeof slug === 'string' && typeof domain === 'string') {
    const product = await prisma.product.findFirst({
      include: {
        Domain: true,
      },
      where: { slug: slug, Domain: { name: domain } },
    });
    if (!product) throw new TypeError('fetchProductData: product is null');
    return product;
  } else {
    throw new TypeError('fetchProductData: slug or domain is not a string');
  }
}
