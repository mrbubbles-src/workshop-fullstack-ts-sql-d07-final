ALTER TABLE "users" RENAME COLUMN "username" TO "operatorname";--> statement-breakpoint
ALTER TABLE "users" DROP CONSTRAINT "users_username_unique";--> statement-breakpoint
ALTER TABLE "users" ADD CONSTRAINT "users_operatorname_unique" UNIQUE("operatorname");