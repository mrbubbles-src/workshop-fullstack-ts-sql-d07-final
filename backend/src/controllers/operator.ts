import { NextFunction, Request, Response } from 'express';
import { operatorsTable } from '../db/schema.js';
import { db } from '../db/index.js';
import { eq } from 'drizzle-orm';
import { comparePassword, createJWT } from '../lib/auth/auth.js';
import { GlobalError, JWTPayload } from '../types/types.js';

export const validOperator = (
  req: Request,
  res: Response,
  next: NextFunction,
) => {
  const { operator } = req as Request & { operator?: JWTPayload };
  console.log('Validating operator:', operator);
  if (!operator) {
    const error: GlobalError = new Error('Missing operator in req.body');
    error.statusCode = 400;
    return next(error);
  }

  try {
    const { operator_name, role, memory_level } = operator;

    if (!operator_name || !role || memory_level === undefined) {
      const error: GlobalError = new Error('Invalid operator payload');
      error.statusCode = 400;
      return next(error);
    }

    res.status(200).json({
      ok: true,
      message: 'Operator is valid. They may proceed.',
      operator_name,
      role,
      memory_level: Number(memory_level),
    });
  } catch (error) {
    return next(error);
  }
};
export const verifyOperator = async (
  req: Request,
  res: Response,
  next: NextFunction,
) => {
  try {
    const { email, password } = req.body;
    console.log('Verifying operator with email:', email);
    console.log('Verifying operator with password:', password);

    const user = await db
      .select({
        id: operatorsTable.id,
        operator_name: operatorsTable.operator_name,
        role: operatorsTable.role,
        memory_level: operatorsTable.memory_level,
        password: operatorsTable.password,
      })
      .from(operatorsTable)
      .where(eq(operatorsTable.email, email))
      .limit(1);
    console.log('User found array:', user);
    if (user.length === 0) {
      const error: GlobalError = new Error('Invalid email or password');
      error.statusCode = 401;
      return next(error);
    }
    console.log('User found:', user[0]);
    const isPasswordValid = await comparePassword(password, user[0].password);
    console.log('Is password valid:', isPasswordValid);
    if (!isPasswordValid) {
      const error: GlobalError = new Error('Invalid email or password');
      error.statusCode = 401;
      return next(error);
    }

    const { id, operator_name, role, memory_level } = user[0];

    const token = createJWT(
      {
        id,
        operator_name,
        role,
        memory_level: Number(memory_level),
      } as JWTPayload,
      '5h',
    );
    console.log('Generated token:', token);
    res.cookie('token', token, {
      httpOnly: true,
      secure: true,
      sameSite: 'none',
      maxAge: 5 * 60 * 60 * 1000,
    });

    res.status(200).json({ message: 'Login successful' });
  } catch (error) {
    return next(error);
  }
};

export const logoutOperator = async (
  _req: Request,
  res: Response,
  next: NextFunction,
) => {
  try {
    res.clearCookie('token', {
      httpOnly: true,
      secure: true,
      sameSite: 'none',
    });
    res.status(200).json({ message: 'Logout successful' });
  } catch (error) {
    return next(error);
  }
};
