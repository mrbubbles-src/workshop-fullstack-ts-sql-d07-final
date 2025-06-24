import express from 'express';
import {
	logoutOperator,
	validOperator,
	verifyOperator,
} from '@/controllers/operator.ts';
import { verifyOperatorToken } from '@/middleware/verify-operator-token.ts';
import { operatorValidationRules } from '@/lib/auth/auth-rules.ts';
import { validateInputs } from '@/middleware/input-validation.ts';

export const router = express.Router();

router.route('/').get(verifyOperatorToken, validOperator);
router
	.route('/login')
	.post(
		verifyOperatorToken,
		validateInputs(operatorValidationRules.login),
		verifyOperator,
	);
router.route('/logout').post(logoutOperator);
