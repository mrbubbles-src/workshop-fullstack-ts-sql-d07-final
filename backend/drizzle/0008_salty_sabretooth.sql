ALTER TABLE "classifiedMemories" RENAME COLUMN "createdAt" TO "created_at";--> statement-breakpoint
ALTER TABLE "classifiedMemories" RENAME COLUMN "updatedAt" TO "updated_at";--> statement-breakpoint
ALTER TABLE "operators" RENAME COLUMN "operatorname" TO "operator_name";--> statement-breakpoint
ALTER TABLE "operators" RENAME COLUMN "memoryLevel" TO "memory_level";--> statement-breakpoint
ALTER TABLE "operators" RENAME COLUMN "createdAt" TO "created_at";--> statement-breakpoint
ALTER TABLE "operators" RENAME COLUMN "updatedAt" TO "updated_at";--> statement-breakpoint
ALTER TABLE "restoredMemories" RENAME COLUMN "operatorId" TO "operator_id";--> statement-breakpoint
ALTER TABLE "restoredMemories" RENAME COLUMN "createdAt" TO "created_at";--> statement-breakpoint
ALTER TABLE "restoredMemories" RENAME COLUMN "updatedAt" TO "updated_at";--> statement-breakpoint
ALTER TABLE "unclassifiedMemories" RENAME COLUMN "createdAt" TO "created_at";--> statement-breakpoint
ALTER TABLE "unclassifiedMemories" RENAME COLUMN "updatedAt" TO "updated_at";--> statement-breakpoint
ALTER TABLE "operators" DROP CONSTRAINT "operators_operatorname_unique";--> statement-breakpoint
ALTER TABLE "restoredMemories" DROP CONSTRAINT "restoredMemories_operatorId_operators_id_fk";
--> statement-breakpoint
ALTER TABLE "restoredMemories" ADD CONSTRAINT "restoredMemories_operator_id_operators_id_fk" FOREIGN KEY ("operator_id") REFERENCES "public"."operators"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "operators" ADD CONSTRAINT "operators_operator_name_unique" UNIQUE("operator_name");