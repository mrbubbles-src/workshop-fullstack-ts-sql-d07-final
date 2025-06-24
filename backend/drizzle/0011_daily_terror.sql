ALTER TABLE "operators" DROP CONSTRAINT "password";--> statement-breakpoint
ALTER TABLE "operators" ADD CONSTRAINT "password_min_length" CHECK (char_length("operators"."password") >= 8);