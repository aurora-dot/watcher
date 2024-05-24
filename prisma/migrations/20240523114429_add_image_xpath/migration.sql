-- AlterTable
ALTER TABLE "ProductScraper" ADD COLUMN     "imageXPATH" TEXT NOT NULL DEFAULT '';

-- AlterTable
ALTER TABLE "ProductScraperHistory" ALTER COLUMN "imageUrl" DROP NOT NULL,
ALTER COLUMN "imageUrl" SET DEFAULT 'https://loremflickr.com/1000/1000/cat';
