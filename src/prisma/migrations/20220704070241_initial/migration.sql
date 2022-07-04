-- CreateTable
CREATE TABLE "Clients" (
    "id" INT8 NOT NULL DEFAULT unique_rowid(),
    "name" STRING(255) NOT NULL,
    "rootId" STRING(255) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Clients_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LegalEntities" (
    "id" INT8 NOT NULL DEFAULT unique_rowid(),
    "name" STRING NOT NULL,
    "clientId" INT8 NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "LegalEntities_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ClientsStores" (
    "id" INT8 NOT NULL DEFAULT unique_rowid(),
    "name" STRING,
    "clientId" INT8 NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ClientsStores_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Logs" (
    "id" INT8 NOT NULL DEFAULT unique_rowid(),
    "name" STRING NOT NULL,
    "storeId" INT8 NOT NULL,
    "request" STRING NOT NULL,
    "response" STRING NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Logs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ClientsStoresOptions" (
    "id" INT8 NOT NULL DEFAULT unique_rowid(),
    "name" STRING,
    "storeId" INT8 NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ClientsStoresOptions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cryptocurrencies" (
    "id" INT8 NOT NULL DEFAULT unique_rowid(),
    "name" STRING(255) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Cryptocurrencies_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CryptocurrenciesOptions" (
    "id" INT8 NOT NULL DEFAULT unique_rowid(),
    "cryptocurrencyid" INT8 NOT NULL,
    "name" STRING(255) NOT NULL,
    "value" STRING(255) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CryptocurrenciesOptions_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "LegalEntities" ADD CONSTRAINT "LegalEntities_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "Clients"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ClientsStores" ADD CONSTRAINT "ClientsStores_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "Clients"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Logs" ADD CONSTRAINT "Logs_storeId_fkey" FOREIGN KEY ("storeId") REFERENCES "ClientsStores"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ClientsStoresOptions" ADD CONSTRAINT "ClientsStoresOptions_storeId_fkey" FOREIGN KEY ("storeId") REFERENCES "ClientsStores"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CryptocurrenciesOptions" ADD CONSTRAINT "CryptocurrenciesOptions_cryptocurrencyid_fkey" FOREIGN KEY ("cryptocurrencyid") REFERENCES "Cryptocurrencies"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
