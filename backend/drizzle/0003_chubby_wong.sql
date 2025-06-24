ALTER TABLE "users" RENAME TO "operators";--> statement-breakpoint
ALTER TABLE "operators" DROP CONSTRAINT "users_operatorname_unique";--> statement-breakpoint
ALTER TABLE "operators" DROP CONSTRAINT "users_email_unique";--> statement-breakpoint
ALTER TABLE "operators" ADD CONSTRAINT "operators_operatorname_unique" UNIQUE("operatorname");--> statement-breakpoint
ALTER TABLE "operators" ADD CONSTRAINT "operators_email_unique" UNIQUE("email");