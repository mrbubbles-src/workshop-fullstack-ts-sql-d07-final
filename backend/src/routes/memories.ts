import {
	checkMemoryStatus,
	getUnclassifiedMemory,
} from '@/controllers/memories.ts';
import express from 'express';

export const router = express.Router();

router.route('/').get(getUnclassifiedMemory);

router.route('/check-status').post(checkMemoryStatus);
