# Development Guidelines for Claude

## Core Philosophy

**TEST-DRIVEN DEVELOPMENT IS NON-NEGOTIABLE.** Every line of production code must be written in response to a failing test. No exceptions.

Follow TDD with behavior-driven testing and functional programming principles. Work in small, incremental changes that maintain a working state.

## Quick Reference

**Key Principles:**

- Write tests first (TDD)
- Test behavior, not implementation
- No `any` types or type assertions
- Immutable data only
- Small, pure functions
- TypeScript strict mode always
- Use real schemas/types in tests, never redefine them

**Preferred Tools:**

- **Language**: TypeScript (strict mode)
- **Testing**: Jest/Vitest + React Testing Library
- **State Management**: Prefer immutable patterns

## Testing Principles

### Behavior-Driven Testing

- **No "unit tests"** - verify expected behavior, treating implementation as a black box
- Test through public API exclusively - internals invisible to tests
- No 1:1 mapping between test files and implementation files
- **100% coverage** expected, but tests must be based on business behavior, not implementation details

### Testing Tools

- **Jest** or **Vitest** for testing frameworks
- **React Testing Library** for React components
- **MSW (Mock Service Worker)** for API mocking when needed
- All test code must follow the same TypeScript strict mode rules as production code

### Test Organization

```
src/
  features/
    payment/
      payment-processor.ts
      payment-validator.ts
      payment-processor.test.ts // The validator is an implementation detail. Validation is fully covered, but by testing the expected business behaviour, treating the validation code itself as an implementation detail
```

### Test Data Pattern

Use factory functions with optional overrides:

```typescript
const getMockPayment = (overrides?: Partial<Payment>): Payment => ({
  amount: 100,
  currency: "USD",
  cardId: "card_123",
  ...overrides,
});
```

Principles: Return complete objects with defaults, accept `Partial<T>` overrides, compose factories for complex objects.

## TypeScript Guidelines

### Strict Mode Requirements

Enable all strict TypeScript options. Never use `any`, type assertions, or `@ts-ignore` without justification. These rules apply to test code too.

### Type Definitions

- Prefer `type` over `interface`
- Use utility types (`Pick`, `Omit`, `Partial`, `Required`)
- Create branded types for type safety: `type UserId = string & { readonly brand: unique symbol }`
- Use schema-first development with Zod

#### Schema-First Development

Define schemas first, derive types from them:

```typescript
const PaymentSchema = z.object({
  amount: z.number().positive(),
  currency: z.string(),
  cardId: z.string(),
});

type Payment = z.infer<typeof PaymentSchema>;

// Use at runtime boundaries
export const parsePayment = (data: unknown): Payment => 
  PaymentSchema.parse(data);
```

#### Schema Usage in Tests

**CRITICAL**: Tests must import real schemas from the main project, never redefine them.

```typescript
// ✅ Import from shared location
import { PaymentSchema, type Payment } from "@/schemas";

const getMockPayment = (overrides?: Partial<Payment>): Payment => 
  PaymentSchema.parse({ amount: 100, currency: "USD", ...overrides });
```

This ensures type safety, consistency, and prevents schema drift between tests and production.

## Code Style

### Functional Programming

- **No data mutation** - immutable data structures only
- **Pure functions** wherever possible
- **Composition** over complex logic
- Use array methods (`map`, `filter`, `reduce`) over loops
- Avoid heavy FP abstractions unless clearly beneficial

```typescript
// Immutable updates
const applyDiscount = (order: Order, percent: number): Order => ({
  ...order,
  items: order.items.map(item => ({
    ...item,
    price: item.price * (1 - percent / 100)
  }))
});

// Composition
const processOrder = (order: Order) => 
  pipe(order, validateOrder, applyPromotions, calculateTax);
```

### Code Structure & Naming

- No nested if/else - use early returns
- Avoid deep nesting (max 2 levels)
- Small, focused functions
- **Functions**: `camelCase` (verbs)
- **Types**: `PascalCase` 
- **Constants**: `UPPER_SNAKE_CASE`
- **Files**: `kebab-case.ts`

### No Comments in Code

Code should be self-documenting through clear naming. Extract complex logic to well-named functions instead of commenting.

```typescript
// Avoid: Comments
const calculateDiscount = (price: number, customer: Customer): number => {
  // Check if premium customer
  if (customer.tier === "premium") return price * 0.8;
  return price * 0.9;
};

// Good: Self-documenting
const PREMIUM_DISCOUNT = 0.8;
const STANDARD_DISCOUNT = 0.9;

const calculateDiscount = (price: number, customer: Customer): number => 
  customer.tier === "premium" ? price * PREMIUM_DISCOUNT : price * STANDARD_DISCOUNT;
```

### Prefer Options Objects

Use options objects for multiple parameters. Destructure at function start with defaults.

```typescript
// Avoid: Multiple positional parameters
const createPayment = (amount: number, currency: string, cardId: string) => {};

// Good: Options object
type CreatePaymentOptions = {
  amount: number;
  currency: string;
  cardId: string;
  description?: string;
};

const createPayment = (options: CreatePaymentOptions) => {
  const { amount, currency, cardId, description } = options;
  // implementation
};

// Clear at call site
createPayment({ amount: 100, currency: "USD", cardId: "card_123" });
```

Acceptable for single parameters and established patterns (map, filter callbacks).

## Development Workflow

### TDD Process - THE FUNDAMENTAL PRACTICE

**CRITICAL**: TDD is not optional. Follow Red-Green-Refactor strictly:

1. **Red**: Write failing test first. NO PRODUCTION CODE until you have a failing test.
2. **Green**: Write minimum code to make test pass.
3. **Refactor**: Assess for improvement opportunities. Only refactor if it adds value.

**Common violations to avoid:**
- Writing production code without failing test first
- Writing multiple tests before making first one pass
- Writing more code than needed to pass current test
- Skipping refactor assessment

#### TDD Example

```typescript
// 1. Red - Write failing test
it("should calculate order total", () => {
  const order = { items: [{ price: 30 }], shipping: 5 };
  expect(calculateTotal(order)).toBe(35);
});

// 2. Green - Minimal implementation
const calculateTotal = (order: Order) => 
  order.items.reduce((sum, item) => sum + item.price, 0) + order.shipping;

// 3. Red - Add free shipping test
it("should apply free shipping over £50", () => {
  const order = { items: [{ price: 60 }], shipping: 5 };
  expect(calculateTotal(order)).toBe(60);
});

// 4. Green - Add conditional
const calculateTotal = (order: Order) => {
  const itemsTotal = order.items.reduce((sum, item) => sum + item.price, 0);
  const shipping = itemsTotal > 50 ? 0 : order.shipping;
  return itemsTotal + shipping;
};

// 5. Refactor - Extract constants
const FREE_SHIPPING_THRESHOLD = 50;
const calculateTotal = (order: Order) => {
  const itemsTotal = order.items.reduce((sum, item) => sum + item.price, 0);
  return itemsTotal + (itemsTotal > FREE_SHIPPING_THRESHOLD ? 0 : order.shipping);
};
```

### Refactoring - The Critical Third Step

Always assess after green. Only refactor if it adds clear value.

#### When to Refactor
- Names could be clearer
- Structure could be simpler  
- Duplication of **knowledge** (not just code structure)
- Patterns emerge after implementing similar features

**Remember**: Not all code needs refactoring. If code is clean and expressive, move on.

#### Refactoring Guidelines

1. **Commit first** - Always commit working code before refactoring

2. **Abstract based on semantic meaning** - Only create abstractions when code shares the same purpose and meaning, not just structure. **Duplicate code is cheaper than the wrong abstraction.**

```typescript
// DON'T abstract - different business concepts
const validatePaymentAmount = (amount: number): boolean => 
  amount > 0 && amount <= 10000;
const validateTransferAmount = (amount: number): boolean => 
  amount > 0 && amount <= 10000;

// DO abstract - same semantic meaning  
const formatPersonDisplayName = (first: string, last: string): string => 
  `${first} ${last}`.trim();
```

3. **DRY is about knowledge, not code** - Don't duplicate business knowledge. Similar code structure is fine if it represents different concepts.

```typescript
// NOT a DRY violation - different business rules
const validateUserAge = (age: number) => age >= 18 && age <= 100;
const validateRating = (rating: number) => rating >= 1 && rating <= 5;

// IS a DRY violation - same business knowledge
const FREE_SHIPPING_THRESHOLD = 50;
const calculateShippingCost = (total: number) => 
  total > FREE_SHIPPING_THRESHOLD ? 0 : 5.99;
```

4. **Maintain external APIs** - Refactoring must never break existing consumers. Extract internal helpers but keep public API unchanged.

5. **Verify and commit** - Run tests, linting, and type checking. All must pass. Commit refactoring separately from features.

#### Refactoring Checklist

- [ ] Actually improves the code
- [ ] All tests pass without modification  
- [ ] Static analysis passes
- [ ] No new public APIs
- [ ] More readable than before
- [ ] Removed knowledge duplication, not code duplication
- [ ] No speculative abstractions
- [ ] Committed separately


### Commit & PR Guidelines

- Each commit represents complete, working change
- Use conventional commits: `feat:`, `fix:`, `refactor:`, `test:`
- Include test changes with feature changes in same commit
- PRs must have all tests and linting passing
- Work in small increments, single focus per PR

## Working with Claude

### Expectations

1. **ALWAYS FOLLOW TDD** - No production code without failing test
2. Think deeply, understand context, ask clarifying questions
3. Assess refactoring after every green (only if it adds value)
4. Keep project docs current

### Code Changes

- Start with failing test - always, no exceptions
- Assess refactoring after tests pass
- Verify tests and static analysis pass, then commit
- Respect existing patterns and conventions
- Keep changes small and incremental
- Meet TypeScript strict mode requirements

### Communication

- Explain trade-offs and reasoning for significant decisions
- Flag deviations from guidelines with justification  
- Ask for clarification rather than assuming

## Example Patterns

### Error Handling

Use Result types or early returns:

```typescript
// Result type pattern
type Result<T, E = Error> = 
  | { success: true; data: T } 
  | { success: false; error: E };

// Early returns with exceptions
const processPayment = (payment: Payment): ProcessedPayment => {
  if (!isValidPayment(payment)) throw new PaymentError("Invalid payment");
  if (!hasSufficientFunds(payment)) throw new PaymentError("Insufficient funds");
  return executePayment(payment);
};
```

### Testing Behavior

```typescript
// Good - test behavior through public API
describe("PaymentProcessor", () => {
  it("should decline payment when insufficient funds", () => {
    const payment = getMockPayment({ amount: 1000 });
    const account = getMockAccount({ balance: 500 });
    const result = processPayment(payment, account);
    expect(result.success).toBe(false);
    expect(result.error.message).toBe("Insufficient funds");
  });
});

// Avoid - testing implementation details
// Don't test internal method calls, test observable behavior
```

#### Achieving 100% Coverage Through Business Behavior

Validation code gets 100% coverage without testing it directly:

```typescript
// Validation used internally in payment processor
export const processPayment = (request: PaymentRequest): Result<Payment, PaymentError> => {
  if (!validatePaymentAmount(request.amount)) {
    return { success: false, error: new PaymentError("Invalid amount") };
  }
  // Process payment...
};

// Tests achieve 100% validation coverage through business behavior
describe("Payment processing", () => {
  it("should reject negative amounts", () => {
    const payment = getMockPayment({ amount: -100 });
    const result = processPayment(payment);
    expect(result.success).toBe(false);
    expect(result.error.message).toBe("Invalid amount");
  });

  it("should process valid payments", () => {
    const payment = getMockPayment({ amount: 100 });
    const result = processPayment(payment);
    expect(result.success).toBe(true);
  });
});
```

### React Component Testing

```typescript
describe("PaymentForm", () => {
  it("should show error when submitting invalid amount", async () => {
    render(<PaymentForm />);
    await userEvent.type(screen.getByLabelText("Amount"), "-100");
    await userEvent.click(screen.getByRole("button", { name: "Submit" }));
    expect(screen.getByText("Amount must be positive")).toBeInTheDocument();
  });
});
```

## Common Anti-patterns to Avoid

```typescript
// Avoid: Mutation
const addItem = (items: Item[], newItem: Item) => {
  items.push(newItem); // Mutates array
  return items;
};

// Prefer: Immutable update
const addItem = (items: Item[], newItem: Item): Item[] => [...items, newItem];

// Avoid: Nested conditionals
if (user?.isActive && user?.hasPermission) {
  // do something
}

// Prefer: Early returns
if (!user?.isActive || !user?.hasPermission) return;
// do something

// Prefer: Small composed functions over large ones
const processOrder = (order: Order) => 
  pipe(order, validateOrder, calculatePricing, applyDiscounts, submitOrder);
```

## Summary

Write clean, testable, functional code that evolves through small, safe increments. Every change driven by a test describing desired behavior. Implementation should be the simplest thing that makes the test pass. Favor simplicity and readability over cleverness.
