--
-- Class Commodity as table commodity
--

CREATE TABLE "commodity" (
  "id" serial,
  "assetType" text NOT NULL,
  "accountId" text NOT NULL,
  "category" text NOT NULL,
  "name" text NOT NULL,
  "species" text,
  "marketPrice" double precision,
  "weight" double precision NOT NULL,
  "trackerId" text,
  "location" text,
  "imageUrl" text,
  "ownershipDeedUrl" text,
  "medicalCertificateUrl" text,
  "publicDescription" text NOT NULL,
  "tradingStatus" text,
  "orderTradingStep" integer,
  "orderTrackerHash" text,
  "ownerOrg" text
);

ALTER TABLE ONLY "commodity"
  ADD CONSTRAINT commodity_pkey PRIMARY KEY (id);


--
-- Class Person as table person
--

CREATE TABLE "person" (
  "id" serial,
  "firstName" text NOT NULL,
  "lastName" text NOT NULL,
  "phone" text,
  "password" text,
  "email" text,
  "role" text NOT NULL,
  "org" text,
  "imageUrl" text
);

ALTER TABLE ONLY "person"
  ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- Class ServiceProvider as table service_provider
--

CREATE TABLE "service_provider" (
  "id" serial,
  "providerId" text NOT NULL,
  "adminId" integer NOT NULL,
  "accountType" text NOT NULL,
  "logo" text,
  "tradingName" text,
  "tradingCategory" text,
  "org" text
);

ALTER TABLE ONLY "service_provider"
  ADD CONSTRAINT service_provider_pkey PRIMARY KEY (id);

ALTER TABLE ONLY "service_provider"
  ADD CONSTRAINT service_provider_fk_0
    FOREIGN KEY("adminId")
      REFERENCES person(id)
        ON DELETE CASCADE;

--
-- Class ServiceOrder as table service_order
--

CREATE TABLE "service_order" (
  "id" serial,
  "orderDate" text,
  "accountId" integer NOT NULL,
  "orderTrackerHash" text,
  "commodityId" integer NOT NULL,
  "commodityName" text,
  "commodityCategory" text,
  "commodityWeight" integer,
  "orderingAccountId" text,
  "serviceInRequest" text,
  "servingAccountId" text,
  "servingStatus" text,
  "servingStep" integer,
  "quantity" integer,
  "orderStatus" text,
  "tradingStatus" text,
  "status" text,
  "orderStep" integer,
  "modifiedStatus" text,
  "newOrderId" text,
  "transporterDeliveryTime" text,
  "transporterPickUpTime" text,
  "transporterVehicleId" text
);

ALTER TABLE ONLY "service_order"
  ADD CONSTRAINT service_order_pkey PRIMARY KEY (id);

ALTER TABLE ONLY "service_order"
  ADD CONSTRAINT service_order_fk_0
    FOREIGN KEY("accountId")
      REFERENCES service_provider(id)
        ON DELETE CASCADE;
ALTER TABLE ONLY "service_order"
  ADD CONSTRAINT service_order_fk_1
    FOREIGN KEY("commodityId")
      REFERENCES commodity(id)
        ON DELETE CASCADE;

--
-- Class Customer as table customer
--

CREATE TABLE "customer" (
  "id" serial,
  "createdDate" timestamp without time zone NOT NULL,
  "customerAccountId" integer NOT NULL,
  "serviceProviderAccountId" integer NOT NULL
);

ALTER TABLE ONLY "customer"
  ADD CONSTRAINT customer_pkey PRIMARY KEY (id);

ALTER TABLE ONLY "customer"
  ADD CONSTRAINT customer_fk_0
    FOREIGN KEY("customerAccountId")
      REFERENCES person(id)
        ON DELETE CASCADE;
ALTER TABLE ONLY "customer"
  ADD CONSTRAINT customer_fk_1
    FOREIGN KEY("serviceProviderAccountId")
      REFERENCES service_provider(id)
        ON DELETE CASCADE;

--
-- Class WarehouseReciept as table warehouse_reciept
--

CREATE TABLE "warehouse_reciept" (
  "id" serial,
  "createdDate" timestamp without time zone NOT NULL,
  "certificateTag" text,
  "orderTrackerHash" text,
  "orderId" integer NOT NULL,
  "commodityId" integer NOT NULL,
  "commodityName" text,
  "commodityCategory" text,
  "orderStatus" text,
  "tradingStatus" text,
  "holderAccountId" integer NOT NULL,
  "issuerAccountId" integer NOT NULL,
  "holderOrg" text
);

ALTER TABLE ONLY "warehouse_reciept"
  ADD CONSTRAINT warehouse_reciept_pkey PRIMARY KEY (id);

ALTER TABLE ONLY "warehouse_reciept"
  ADD CONSTRAINT warehouse_reciept_fk_0
    FOREIGN KEY("orderId")
      REFERENCES service_order(id)
        ON DELETE CASCADE;
ALTER TABLE ONLY "warehouse_reciept"
  ADD CONSTRAINT warehouse_reciept_fk_1
    FOREIGN KEY("commodityId")
      REFERENCES commodity(id)
        ON DELETE CASCADE;
ALTER TABLE ONLY "warehouse_reciept"
  ADD CONSTRAINT warehouse_reciept_fk_2
    FOREIGN KEY("holderAccountId")
      REFERENCES person(id)
        ON DELETE CASCADE;
ALTER TABLE ONLY "warehouse_reciept"
  ADD CONSTRAINT warehouse_reciept_fk_3
    FOREIGN KEY("issuerAccountId")
      REFERENCES service_provider(id)
        ON DELETE CASCADE;

--
-- Class WarehouseRecieptItem as table warehouse_reciept_item
--

CREATE TABLE "warehouse_reciept_item" (
  "id" serial,
  "recieptId" integer NOT NULL,
  "commodityName" text,
  "commodityCategory" text,
  "grade" text,
  "gradingComments" text,
  "recommendation" text,
  "commodityWeight" integer
);

ALTER TABLE ONLY "warehouse_reciept_item"
  ADD CONSTRAINT warehouse_reciept_item_pkey PRIMARY KEY (id);

ALTER TABLE ONLY "warehouse_reciept_item"
  ADD CONSTRAINT warehouse_reciept_item_fk_0
    FOREIGN KEY("recieptId")
      REFERENCES warehouse_reciept(id)
        ON DELETE CASCADE;

--
-- Class TradingCertificate as table trading_certificate
--

CREATE TABLE "trading_certificate" (
  "id" serial,
  "createdDate" text,
  "orderTrackerHash" text,
  "recieptId" integer NOT NULL,
  "recieptItemId" integer NOT NULL,
  "certificateTag" text,
  "tradingStatus" text,
  "tokenValue" text,
  "certificaterl" text,
  "publicDescription" text,
  "holderAccountId" integer NOT NULL,
  "issuerAccountId" integer NOT NULL,
  "holderOrg" text
);

ALTER TABLE ONLY "trading_certificate"
  ADD CONSTRAINT trading_certificate_pkey PRIMARY KEY (id);

ALTER TABLE ONLY "trading_certificate"
  ADD CONSTRAINT trading_certificate_fk_0
    FOREIGN KEY("recieptId")
      REFERENCES warehouse_reciept(id)
        ON DELETE CASCADE;
ALTER TABLE ONLY "trading_certificate"
  ADD CONSTRAINT trading_certificate_fk_1
    FOREIGN KEY("recieptItemId")
      REFERENCES warehouse_reciept_item(id)
        ON DELETE CASCADE;
ALTER TABLE ONLY "trading_certificate"
  ADD CONSTRAINT trading_certificate_fk_2
    FOREIGN KEY("holderAccountId")
      REFERENCES person(id)
        ON DELETE CASCADE;
ALTER TABLE ONLY "trading_certificate"
  ADD CONSTRAINT trading_certificate_fk_3
    FOREIGN KEY("issuerAccountId")
      REFERENCES service_provider(id)
        ON DELETE CASCADE;

