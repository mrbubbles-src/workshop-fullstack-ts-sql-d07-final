ALTER TABLE "classifiedMemories" ALTER COLUMN "status" SET NOT NULL;--> statement-breakpoint
ALTER TABLE "restoredMemories" ALTER COLUMN "status" SET NOT NULL;--> statement-breakpoint
ALTER TABLE "unclassifiedMemories" ALTER COLUMN "status" SET NOT NULL;