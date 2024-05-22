import type { Product } from '@prisma/client';
import { notFound } from 'next/navigation';
import { fetchProductData } from './getProduct';
import { Overpass_Mono } from 'next/font/google';

const overpassMono = Overpass_Mono({ subsets: ['latin'] });

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
  console.log(product.ProductScraper[0].ProductScraperHistory[0].inStock);

  return (
    <div className='mx-auto mt-10 flex-grow space-y-3 px-4 text-gray-800 sm:px-6 md:max-w-2xl md:px-4 lg:max-w-4xl lg:px-12'>
      <div className='flex max-w-screen-lg flex-row items-center'>
        <div className='mr-8 w-3/4'>
          <a href={product.ProductScraper[0].url}>
            <div className='border-l-2 border-l-green-500 bg-green-50 p-5'>
              <img
                src={
                  product.ProductScraper[0].ProductScraperHistory[0].imageBase64
                }
              />
            </div>
          </a>
          <p className='mt-3 text-xs'>
            Last updated:{' '}
            <span className='text-pink-500'>
              {product.ProductScraper[0].ProductScraperHistory[0].created.toISOString()}
            </span>
          </p>
        </div>
        <div className='space-y-4'>
          <div className={overpassMono.className}>
            <h1 className={overpassMono.className + ' text-2xl font-bold'}>
              {product.name}
            </h1>
            <h2 className='text-sm'>{product.Company.name}</h2>
          </div>
          <div
            className={
              overpassMono.className + ' text-xl font-bold text-green-600'
            }
          >
            <h1>
              <span className='font-semi-bold text-gray-800'> Price </span>
              {product.ProductScraper[0].ScraperLambda.currencyType}
              {product.ProductScraper[0].ProductScraperHistory[0].price}
            </h1>
            <h2 className='text-sm'>
              <span className='font-semi-bold text-gray-800'> In Stock </span>
              {product.ProductScraper[0].ProductScraperHistory[0].inStock.toString()}
            </h2>
          </div>

          {/* Hardcoding to ProductScraper[0] for now */}
          <p>
            <a
              className='text-green-600 underline'
              href={product.ProductScraper[0].url}
            >
              Product Link
            </a>
          </p>
        </div>
      </div>
    </div>
  );
}
