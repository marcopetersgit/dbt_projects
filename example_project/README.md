# Example Analytics DBT Project

This is an example DBT (data build tool) project demonstrating a typical project structure and best practices.

## Project Structure

```
example_project/
├── models/
│   ├── staging/          # Raw data staging models (views)
│   └── marts/            # Business logic models (tables)
├── tests/                # Data quality tests
├── macros/               # Reusable SQL/Jinja macros
├── data/                 # Seed data (CSV files)
├── snapshots/            # Point-in-time snapshots
├── analyses/             # Ad-hoc analysis queries
├── dbt_project.yml       # Project configuration
├── profiles.yml          # Connection profiles
├── packages.yml          # Package dependencies
└── README.md             # This file
```

## Getting Started

### Prerequisites
- Python 3.8+
- dbt-core and appropriate database adapter (dbt-bigquery, dbt-postgres, etc.)

### Installation

1. Clone the repository
2. Install dbt dependencies:
   ```bash
   pip install dbt-core dbt-bigquery  # or your adapter
   ```

3. Install dbt packages:
   ```bash
   dbt deps
   ```

4. Configure your profile in `profiles.yml` with your database credentials

### Running dbt commands

```bash
# Run all models
dbt run

# Run tests
dbt test

# Run and test
dbt build

# Generate documentation
dbt docs generate

# Serve documentation
dbt docs serve

# Run with specific models
dbt run -s staging.*
dbt run -s +marts.users+  # Include upstream and downstream dependencies
```

## Project Conventions

- **Staging Models**: Prefix with `stg_` - light transformations of raw data
- **Mart Models**: No prefix - business logic, aggregations, and final outputs
- **Tests**: Use YAML config in `schema.yml` files
- **Macros**: Store reusable logic in `macros/` directory

## Documentation

Generate and serve documentation:
```bash
dbt docs generate
dbt docs serve
```

Visit `localhost:8000` to view the documentation DAG and model descriptions.

## Version Control

This project uses `.gitignore` to exclude sensitive files like:
- Target folder (compiled SQL)
- Virtual environments
- Credential files

Never commit credentials or sensitive data.
