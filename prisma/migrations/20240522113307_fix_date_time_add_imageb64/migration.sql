/*
  Warnings:

  - Added the required column `screenshotBase64` to the `Product` table without a default value. This is not possible if the table is not empty.
  - Added the required column `screenshotBase64` to the `ProductPricingHistory` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Product" ADD COLUMN     "screenshotBase64" TEXT NOT NULL,
ALTER COLUMN "created" SET DEFAULT CURRENT_TIMESTAMP;

-- AlterTable
ALTER TABLE "ProductPricingHistory" ADD COLUMN     "screenshotBase64" TEXT NOT NULL,
ALTER COLUMN "created" SET DEFAULT CURRENT_TIMESTAMP;
