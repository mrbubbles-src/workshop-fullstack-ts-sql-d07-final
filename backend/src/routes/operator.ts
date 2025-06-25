import express from 'express';
import {
  logoutOperator,
  validOperator,
  verifyOperator,
} from '../controllers/operator.js';
import { verifyOperatorToken } from '../middleware/verify-operator-token.js';
import { operatorValidationRules } from '../lib/auth/auth-rules.js';
import { validateInputs } from '../middleware/input-validation.js';

export const router = express.Router();

router.route('/data').get(verifyOperatorToken, validOperator);
router
  .route('/login')
  .post(
    verifyOperatorToken,
    validateInputs(operatorValidationRules.login),
    verifyOperator,
  );
router.route('/logout').post(logoutOperator);
