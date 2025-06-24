ALTER TABLE "classifiedMemories" ALTER COLUMN "id" SET DATA TYPE text;--> statement-breakpoint
ALTER TABLE "classifiedMemories" ALTER COLUMN "memory" SET DATA TYPE text;--> statement-breakpoint
ALTER TABLE "operators" ALTER COLUMN "id" SET DATA TYPE text;--> statement-breakpoint
ALTER TABLE "operators" ALTER COLUMN "id" SET DEFAULT gen_random_uuid();--> statement-breakpoint
ALTER TABLE "operators" ALTER COLUMN "operator_name" SET DATA TYPE text;--> statement-breakpoint
ALTER TABLE "operators" ALTER COLUMN "email" SET DATA TYPE text;--> statement-breakpoint
ALTER TABLE "operators" ALTER COLUMN "password" SET DATA TYPE text;--> statement-breakpoint
ALTER TABLE "restoredMemories" ALTER COLUMN "id" SET DATA TYPE text;--> statement-breakpoint
ALTER TABLE "restoredMemories" ALTER COLUMN "memory" SET DATA TYPE text;--> statement-breakpoint
ALTER TABLE "restoredMemories" ALTER COLUMN "operator_id" SET DATA TYPE text;--> statement-breakpoint
ALTER TABLE "unclassifiedMemories" ALTER COLUMN "id" SET DATA TYPE text;--> statement-breakpoint
ALTER TABLE "unclassifiedMemories" ALTER COLUMN "id" SET DEFAULT gen_random_uuid();--> statement-breakpoint
ALTER TABLE "unclassifiedMemories" ALTER COLUMN "memory" SET DATA TYPE text;