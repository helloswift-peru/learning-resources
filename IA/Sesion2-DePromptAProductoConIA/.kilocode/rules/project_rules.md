# iOS Project Setup — Rules + Cursor Config + SwiftLint

This file includes:
1. PROJECT_RULES.md

──────────────────────────────────────────────
# 1. PROJECT_RULES.md
──────────────────────────────────────────────

# iOS Project Rules (Swift + SwiftUI + Clean Architecture)

These rules define the coding standards, architecture guidelines, naming conventions, and best practices for this project.  
All generated code MUST follow these rules unless explicitly stated otherwise.

---

## 1. General Principles
1. Write clean, readable, and maintainable code.
2. Follow the Single Responsibility Principle everywhere.
3. Avoid unnecessary complexity. Prefer clarity over cleverness.
4. No dead code, unused imports, or commented-out blocks.
5. No force unwraps (!) unless absolutely impossible to avoid.
6. Error handling must use typed errors (enum conforming to Error).

---

## 2. Naming Conventions
- Types (class/struct/enum): PascalCase
- Variables & Functions: camelCase
- Booleans: must sound like a condition (isValid, hasItems)
- Constants: PascalCase or camelCase but descriptive
- Avoid cryptic abbreviations

---

## 3. Architecture Rules

This project follows **Clean Architecture**:

Presentation  → SwiftUI Views + ViewModels (MVVM)
Domain        → UseCases + Entities + Repository Interfaces
Data          → Repository Implementations + Data Sources + DTOs
Core          → DI + Utilities + Constants

Rules:
- Presentation → depends on Domain
- Domain → depends on NOTHING
- Data → depends on Domain
- DTOs NEVER appear outside Data
- ViewModels contain ZERO networking logic

---

## 4. SwiftUI Rules
1. Views must be stateless when possible.
2. Only ViewModels manage state using @Published.
3. Use @StateObject for ownership, @ObservedObject for usage.
4. Extract reusable UI components.
5. No business logic inside Views.

---

## 5. Domain Layer Rules
- Only Entities, UseCases, Repository interfaces.
- Domain imports nothing from SwiftUI/UIKit/Network layers.
- UseCases must do ONE thing.

---

## 6. Data Layer Rules
- Contains DTOs, Data Sources, Mappers, RepositoryImpl.
- Repositories must return Domain Entities.
- Networking uses async/await.
- No raw dictionaries returned.

---

## 7. Networking Rules
- Use URLSession + async/await.
- Typed errors only.
- Strongly typed DTOs.

---

## 8. Dependency Injection (DI)
- No random singletons.
- Use initializer injection everywhere.
- Use AppContainer (or DI container).

Simplified example:
```swift
struct AppContainer {
    let cartRepository: CartRepository

    init() {
        let remote = CartRemoteDataSourceImpl()
        cartRepository = CartRepositoryImpl(remote: remote)
    }
}
9. Testing Rules
	1.	All UseCases MUST have tests.
	2.	All ViewModels MUST have tests.
	3.	No network calls in tests.
	4.	Use mocks and fakes.

⸻

10. Style & Linting
	•	Use SwiftLint or SwiftFormat.
	•	Max line length: 120.
	•	No trailing spaces.
	•	Functions must be small, focused.
	•	Prefer guard over nested if.

⸻

11. Error Handling
	•	Always use error enums:
    enum CartError: Error { case empty, invalid }
    	•	Never compare error strings.
	•	UI handles presentation of errors.

⸻

12. File Structure
ProjectName
├─ Presentation
│  ├─ <Feature>/Views
│  ├─ <Feature>/ViewModels
│  └─ Components
├─ Domain
│  ├─ Entities
│  ├─ UseCases
│  └─ Repositories
├─ Data
│  ├─ DTOs
│  ├─ Network
│  ├─ Persistence
│  ├─ Mappers
│  └─ RepositoryImpl
└─ Core
   ├─ DI
   ├─ Utils
   └─ Config