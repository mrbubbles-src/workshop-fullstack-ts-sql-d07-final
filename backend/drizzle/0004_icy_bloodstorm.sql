CREATE TYPE "public"."status" AS ENUM('unclassified', 'classified', 'in_progress', 'restored');--> statement-breakpoint
CREATE TABLE "classifiedMemories" (
	"id" varchar(36) PRIMARY KEY NOT NULL,
	"memory" varchar(10000) NOT NULL,
	"status" "status" DEFAULT 'classified',
	"createdAt" timestamp(3) DEFAULT CURRENT_TIMESTAMP NOT NULL,
	"updatedAt" timestamp(3) DEFAULT CURRENT_TIMESTAMP NOT NULL
);
--> statement-breakpoint
CREATE TABLE "restoredMemories" (
	"id" varchar(36) PRIMARY KEY NOT NULL,
	"memory" varchar(10000) NOT NULL,
	"operatorId" varchar(36) NOT NULL,
	"status" "status" DEFAULT 'restored',
	"createdAt" timestamp(3) DEFAULT CURRENT_TIMESTAMP NOT NULL,
	"updatedAt" timestamp(3) DEFAULT CURRENT_TIMESTAMP NOT NULL
);
--> statement-breakpoint
CREATE TABLE "unclassifiedMemories" (
	"id" varchar(36) PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"memory" varchar(10000) NOT NULL,
	"status" "status" DEFAULT 'unclassified',
	"createdAt" timestamp(3) DEFAULT CURRENT_TIMESTAMP NOT NULL,
	"updatedAt" timestamp(3) DEFAULT CURRENT_TIMESTAMP NOT NULL
);
--> statement-breakpoint
ALTER TABLE "operators" RENAME COLUMN "verified" TO "5,2";--> statement-breakpoint
ALTER TABLE "restoredMemories" ADD CONSTRAINT "restoredMemories_operatorId_operators_id_fk" FOREIGN KEY ("operatorId") REFERENCES "public"."operators"("id") ON DELETE no action ON UPDATE no action;