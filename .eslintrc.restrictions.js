/**
 * ESLint Rules específicas para verificar restricciones del proyecto
 * 
 * Estas reglas deben agregarse a la configuración de ESLint del proyecto
 */

module.exports = {
  rules: {
    // Restricción 1.7: No secrets en código
    'no-secrets/no-secrets': [
      'error',
      {
        ignoreContent: ['example', 'TODO', 'FIXME'],
      },
    ],

    // Restricción 4: TypeScript - evitar 'any'
    '@typescript-eslint/no-explicit-any': 'warn',
    '@typescript-eslint/no-unsafe-assignment': 'warn',
    '@typescript-eslint/no-unsafe-member-access': 'warn',
    '@typescript-eslint/no-unsafe-call': 'warn',

    // Restricción 4: Usar const por defecto
    'prefer-const': 'error',
    'no-var': 'error',

    // Restricción 4: Async/await en lugar de .then()
    'prefer-promise-reject-errors': 'error',
    'no-async-promise-executor': 'error',

    // Restricción 3: No dejar catch blocks vacíos
    'no-empty': ['error', { allowEmptyCatch: false }],

    // Restricción 2: Clean Code - nombres descriptivos
    'id-length': ['warn', { min: 2, exceptions: ['i', 'j', 'x', 'y', 'z'] }],

    // Restricción 2: Funciones pequeñas
    'max-lines-per-function': ['warn', { max: 100, skipComments: true }],

    // Restricción 2: No código duplicado
    'no-duplicate-imports': 'error',

    // Restricción 7.1: Angular - desuscribirse de observables
    'rxjs/no-unsubscribed-observable': 'warn',
    'rxjs/no-subject-unsubscribe': 'warn',

    // Restricción 1.5: No innerHTML sin sanitización
    'no-unsanitized/method': 'error',
    'no-unsanitized/property': 'error',
  },
  plugins: [
    // Requiere: npm install --save-dev eslint-plugin-no-secrets
    // 'no-secrets',
    // Requiere: npm install --save-dev eslint-plugin-no-unsanitized
    // 'no-unsanitized',
  ],
};

