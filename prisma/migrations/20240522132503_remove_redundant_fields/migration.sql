/*
  Warnings:

  - You are about to drop the column `currencyType` on the `Product` table. All the data in the column will be lost.
  - You are about to drop the column `currentPrice` on the `Product` table. All the data in the column will be lost.
  - You are about to drop the column `inStock` on the `Product` table. All the data in the column will be lost.
  - You are about to drop the column `updated` on the `Product` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Product" DROP COLUMN "currencyType",
DROP COLUMN "currentPrice",
DROP COLUMN "inStock",
DROP COLUMN "updated";
