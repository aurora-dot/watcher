/*
  Warnings:

  - You are about to drop the column `InStockString` on the `ProductScraper` table. All the data in the column will be lost.
  - You are about to drop the column `OutOfStockString` on the `ProductScraper` table. All the data in the column will be lost.
  - You are about to drop the column `PriceXPATH` on the `ProductScraper` table. All the data in the column will be lost.
  - You are about to drop the column `URL` on the `ProductScraper` table. All the data in the column will be lost.
  - Added the required column `inStockString` to the `ProductScraper` table without a default value. This is not possible if the table is not empty.
  - Added the required column `outOfStockString` to the `ProductScraper` table without a default value. This is not possible if the table is not empty.
  - Added the required column `priceXPATH` to the `ProductScraper` table without a default value. This is not possible if the table is not empty.
  - Added the required column `url` to the `ProductScraper` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "ProductScraper" DROP COLUMN "InStockString",
DROP COLUMN "OutOfStockString",
DROP COLUMN "PriceXPATH",
DROP COLUMN "URL",
ADD COLUMN     "inStockString" TEXT NOT NULL,
ADD COLUMN     "outOfStockString" TEXT NOT NULL,
ADD COLUMN     "priceXPATH" TEXT NOT NULL,
ADD COLUMN     "url" TEXT NOT NULL;
