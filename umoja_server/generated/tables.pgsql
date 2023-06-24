--
-- Class Commodity as table commodity
--

CREATE TABLE "commodity" (
  "id" serial,
  "assetType" text NOT NULL,
  "accountId" text NOT NULL,
  "category" text NOT NULL,
  "name" text NOT NULL,
  "species" text NOT NULL,
  "marketPrice" double precision NOT NULL,
  "weight" double precision NOT NULL,
  "trackerId" text NOT NULL,
  "location" text NOT NULL,
  "imageUrl" text NOT NULL,
  "ownershipDeedUrl" text NOT NULL,
  "medicalCertificateUrl" text NOT NULL,
  "publicDescription" text NOT NULL,
  "tradingStatus" text NOT NULL,
  "orderTradingStep" integer NOT NULL,
  "orderTrackerHash" text NOT NULL,
  "ownerOrg" text NOT NULL
);

ALTER TABLE ONLY "commodity"
  ADD CONSTRAINT commodity_pkey PRIMARY KEY (id);


