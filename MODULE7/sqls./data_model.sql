-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/s8Wnqm
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "card_holder" (
    "id" SERIAL  NOT NULL ,
    "name" VARCHAR(20)  NOT NULL ,
    CONSTRAINT "pk_card_holder" PRIMARY KEY (
        "id"
    )
)

GO

CREATE TABLE "credit_card" (
    "card" VARCHAR(20)  NOT NULL ,
    "id_card_holder" INT  NOT NULL ,
    CONSTRAINT "pk_credit_card" PRIMARY KEY (
        "card"
    )
)

GO

CREATE TABLE "merchant" (
    "id" SERIAL  NOT NULL ,
    "name" VARCHAR(255)  NOT NULL ,
    "id_merchant_category" INT  NOT NULL ,
    CONSTRAINT "pk_merchant" PRIMARY KEY (
        "id"
    )
)

GO

CREATE TABLE "merchant_category" (
    "id" SERIAL  NOT NULL ,
    "name" VARCHAR(20)  NOT NULL ,
    CONSTRAINT "pk_merchant_category" PRIMARY KEY (
        "id"
    )
)

GO

CREATE TABLE "transaction" (
    "id" INT  NOT NULL ,
    "date" TIMESTAMP  NOT NULL ,
    "amount" FLOAT  NOT NULL ,
    "card" VARCHAR(20)  NOT NULL ,
    "id_merchant" INT  NOT NULL ,
    CONSTRAINT "pk_transaction" PRIMARY KEY (
        "id"
    )
)

GO

ALTER TABLE "credit_card" ADD CONSTRAINT "fk_credit_card_id_card_holder" FOREIGN KEY("id_card_holder")
REFERENCES "card_holder" ("id")
GO

ALTER TABLE "merchant" ADD CONSTRAINT "fk_merchant_id_merchant_category" FOREIGN KEY("id_merchant_category")
REFERENCES "merchant_category" ("id")
GO

ALTER TABLE "transaction" ADD CONSTRAINT "fk_transaction_card" FOREIGN KEY("card")
REFERENCES "credit_card" ("card")
GO

ALTER TABLE "transaction" ADD CONSTRAINT "fk_transaction_id_merchant" FOREIGN KEY("id_merchant")
REFERENCES "merchant" ("id")
GO

