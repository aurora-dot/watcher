/*
  Warnings:

  - You are about to drop the column `screenshotBase64` on the `ProductPricingHistory` table. All the data in the column will be lost.
  - Added the required column `imageBase64` to the `ProductPricingHistory` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "ProductPricingHistory" DROP COLUMN "screenshotBase64",
ADD COLUMN     "imageBase64" TEXT NOT NULL;
