import type { Product as ProductType } from '@prisma/client';
import { notFound } from 'next/navigation';
import { fetchProductData } from './getProduct';
import Product from '@/components/Product';

export const metadata = {
  title: '',
  description: '',
};

export function updateMetadata(product: ProductType) {
  metadata.title = product.name;
  metadata.description = product.name;
}

export default async function Page({
  params,
}: {
  params: { company_slug: string; product_slug: string };
}) {
  let product: ProductType | null = null;
  try {
    product = await fetchProductData(params.company_slug, params.product_slug);
  } catch (error) {
    if (error instanceof TypeError) notFound();
    else console.log(error);
  }

  if (!product) {
    notFound();
  }

  updateMetadata(product);

  return (
    <div className='mx-auto mt-3 flex-grow space-y-3 px-4 text-gray-800 sm:px-6 md:max-w-3xl md:px-4 lg:max-w-5xl lg:px-10'>
      <Product product={product} />
    </div>
  );
}
