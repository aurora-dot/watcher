-- CreateTable
CREATE TABLE "Product" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "currentPrice" DOUBLE PRECISION NOT NULL,
    "currencyType" TEXT NOT NULL,
    "inStock" BOOLEAN NOT NULL,
    "created" TIMESTAMP(3) NOT NULL,
    "updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Product_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProductPricingHistory" (
    "id" SERIAL NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,
    "inStock" BOOLEAN NOT NULL,
    "currencyType" TEXT NOT NULL,
    "created" TIMESTAMP(3) NOT NULL,
    "productId" INTEGER NOT NULL,

    CONSTRAINT "ProductPricingHistory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProductScraper" (
    "id" SERIAL NOT NULL,
    "URL" TEXT NOT NULL,
    "InStockString" TEXT NOT NULL,
    "OutOfStockString" TEXT NOT NULL,
    "PriceXPATH" TEXT NOT NULL,
    "productId" INTEGER NOT NULL,

    CONSTRAINT "ProductScraper_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "ProductScraper_productId_key" ON "ProductScraper"("productId");

-- AddForeignKey
ALTER TABLE "ProductPricingHistory" ADD CONSTRAINT "ProductPricingHistory_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProductScraper" ADD CONSTRAINT "ProductScraper_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
