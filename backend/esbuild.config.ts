import { build } from 'esbuild';
import path from 'path';

await build({
  entryPoints: ['src/app.ts'],
  outfile: 'dist/app.cjs',
  bundle: true,
  platform: 'node',
  target: 'node22',
  alias: {
    '@': path.resolve(process.cwd(), 'src'),
  },
  format: 'cjs',
  loader: { '.ts': 'ts' },
  resolveExtensions: ['.ts', '.js'],
  external: ['express', 'dotenv', 'bcrypt', 'node:*'],
  minify: true,
  sourcemap: true,
  tsconfig: 'tsconfig.json',
});
console.log('Build completed successfully!');
