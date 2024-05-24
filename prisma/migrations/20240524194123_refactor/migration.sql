/*
  Warnings:

  - You are about to drop the column `imageXPATH` on the `ProductScraper` table. All the data in the column will be lost.
  - You are about to drop the column `inStockString` on the `ProductScraper` table. All the data in the column will be lost.
  - You are about to drop the column `outOfStockString` on the `ProductScraper` table. All the data in the column will be lost.
  - You are about to drop the column `priceXPATH` on the `ProductScraper` table. All the data in the column will be lost.
  - You are about to drop the column `url` on the `ProductScraper` table. All the data in the column will be lost.
  - You are about to drop the column `currencyType` on the `ScraperLambda` table. All the data in the column will be lost.
  - Added the required column `url` to the `Product` table without a default value. This is not possible if the table is not empty.
  - Added the required column `currency` to the `ProductScraper` table without a default value. This is not possible if the table is not empty.
  - Added the required column `scraperPropertiesId` to the `ProductScraper` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Product" ADD COLUMN     "url" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "ProductScraper" DROP COLUMN "imageXPATH",
DROP COLUMN "inStockString",
DROP COLUMN "outOfStockString",
DROP COLUMN "priceXPATH",
DROP COLUMN "url",
ADD COLUMN     "currency" TEXT NOT NULL,
ADD COLUMN     "scraperPropertiesId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "ScraperLambda" DROP COLUMN "currencyType";

-- CreateTable
CREATE TABLE "ScraperProperties" (
    "id" SERIAL NOT NULL,
    "inStockString" TEXT NOT NULL,
    "outOfStockString" TEXT NOT NULL,
    "priceXPATH" TEXT NOT NULL,
    "imageXPATH" TEXT NOT NULL,
    "companyId" INTEGER,

    CONSTRAINT "ScraperProperties_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "ScraperProperties" ADD CONSTRAINT "ScraperProperties_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES "Company"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProductScraper" ADD CONSTRAINT "ProductScraper_scraperPropertiesId_fkey" FOREIGN KEY ("scraperPropertiesId") REFERENCES "ScraperProperties"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
