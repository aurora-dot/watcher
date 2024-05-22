import type { Product } from '@prisma/client';
import { notFound } from 'next/navigation';
import { fetchProductData } from './getProduct';

export const metadata = {
  title: '',
  description: '',
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
      {/* Hardcoding to ProductScraper[0] for now */}
      <p>{product.ProductScraper[0].url}</p>
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
