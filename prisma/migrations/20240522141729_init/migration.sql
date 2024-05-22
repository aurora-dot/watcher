-- CreateTable
CREATE TABLE "Company" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "slug" TEXT NOT NULL,

    CONSTRAINT "Company_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Product" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "slug" TEXT NOT NULL,
    "companyId" INTEGER NOT NULL,

    CONSTRAINT "Product_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProductScraper" (
    "id" SERIAL NOT NULL,
    "url" TEXT NOT NULL,
    "inStockString" TEXT NOT NULL,
    "outOfStockString" TEXT NOT NULL,
    "priceXPATH" TEXT NOT NULL,
    "productId" INTEGER NOT NULL,
    "scraperLambdaId" INTEGER NOT NULL,

    CONSTRAINT "ProductScraper_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ScraperLambda" (
    "id" SERIAL NOT NULL,
    "url" TEXT NOT NULL,
    "region" TEXT NOT NULL,
    "currencyType" TEXT NOT NULL,

    CONSTRAINT "ScraperLambda_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProductScraperHistory" (
    "id" SERIAL NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,
    "inStock" BOOLEAN NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "productId" INTEGER NOT NULL,
    "imageBase64" TEXT NOT NULL,
    "productScraperId" INTEGER NOT NULL,

    CONSTRAINT "ProductScraperHistory_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Company_name_key" ON "Company"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Company_slug_key" ON "Company"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "Product_slug_key" ON "Product"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "ScraperLambda_url_key" ON "ScraperLambda"("url");

-- AddForeignKey
ALTER TABLE "Product" ADD CONSTRAINT "Product_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES "Company"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProductScraper" ADD CONSTRAINT "ProductScraper_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProductScraper" ADD CONSTRAINT "ProductScraper_scraperLambdaId_fkey" FOREIGN KEY ("scraperLambdaId") REFERENCES "ScraperLambda"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProductScraperHistory" ADD CONSTRAINT "ProductScraperHistory_productScraperId_fkey" FOREIGN KEY ("productScraperId") REFERENCES "ProductScraper"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
