/*
  Warnings:

  - You are about to drop the column `imageBase64` on the `ProductScraperHistory` table. All the data in the column will be lost.
  - Added the required column `imageUrl` to the `ProductScraperHistory` table without a default value. This is not possible if the table is not empty.
  - Added the required column `scrapeInfo` to the `ProductScraperHistory` table without a default value. This is not possible if the table is not empty.
  - Added the required column `successfulScrape` to the `ProductScraperHistory` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "ProductScraperHistory" DROP COLUMN "imageBase64",
ADD COLUMN     "imageUrl" TEXT NOT NULL,
ADD COLUMN     "scrapeInfo" TEXT NOT NULL,
ADD COLUMN     "successfulScrape" BOOLEAN NOT NULL;
