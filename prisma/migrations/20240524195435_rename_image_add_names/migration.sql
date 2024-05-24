/*
  Warnings:

  - You are about to drop the column `imageUrl` on the `ProductScraperHistory` table. All the data in the column will be lost.
  - Added the required column `name` to the `ProductScraper` table without a default value. This is not possible if the table is not empty.
  - Added the required column `name` to the `ScraperProperties` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "ProductScraper" ADD COLUMN     "name" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "ProductScraperHistory" DROP COLUMN "imageUrl",
ADD COLUMN     "imageBase64" TEXT;

-- AlterTable
ALTER TABLE "ScraperProperties" ADD COLUMN     "name" TEXT NOT NULL;
