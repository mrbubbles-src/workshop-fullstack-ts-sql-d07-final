import { verifyJWT } from '@/lib/auth/auth.ts';
import { GlobalError, JWTPayload } from '@/types/types.ts';
import { Request, Response, NextFunction } from 'express';

export const verifyOperatorToken = (
	req: Request,
	_res: Response,
	next: NextFunction,
): void => {
	const token = req.cookies?.token;
	if (!token) {
		return next();
	}
	try {
		const payload = verifyJWT(token) as JWTPayload;

		if (payload) {
			(req as Request & { operator?: JWTPayload }).operator = payload;
			return next();
		}
	} catch {
		const error: GlobalError = new Error('Ungültiger Token');
		error.statusCode = 401;
		return next(error);
	}
};
