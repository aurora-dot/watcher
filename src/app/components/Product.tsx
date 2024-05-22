import { Product as ProductType } from '@prisma/client';
import { Overpass_Mono } from 'next/font/google';

const overpassMono = Overpass_Mono({ subsets: ['latin'] });

export default function Product({ product }: any) {
  return (
    <div className='max-w-screen-lg items-center sm:flex sm:flex-row'>
      <div className='sm:mr-8 sm:w-3/4'>
        <a href={product.ProductScraper[0].url}>
          <div className='border-l-2 border-l-green-500 bg-green-50 p-3'>
            <img
              src={
                product.ProductScraper[0].ProductScraperHistory[0].imageBase64
              }
            />
          </div>
        </a>
        <p className='mt-3 text-xs'>
          <span className='font-medium'>Last updated:</span>{' '}
          <span className='text-pink-500'>
            {product.ProductScraper[0].ProductScraperHistory[0].created.toISOString()}
          </span>
        </p>
      </div>
      <div className='mt-2 space-y-4 sm:mt-0'>
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
  );
}
