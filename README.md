# Book Dragon – A Reading Companion App

**Book Dragon** is a simple, user-friendly web application for book lovers. It helps readers keep track of their books, create reading lists, and write reviews for both books and authors.

> This is a work in progress project.

---

## Features

- Add books and organize them into personal reading lists
- Write and edit reviews for books and authors
- Search and browse titles
- Book and author detail pages
- Data stored in a database and accessible through the UI

---

## Tech Stack

- **Ruby on Rails** – back-end API and MVC structure
- **sqlite3** – database
- **HTML/CSS/JS** – front-end templates
- **Bootstrap** – styling
- _(Future plans: Add authentication and better user interface)_

---

## Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/olesiamironenko/book-dragon.git
cd book-dragon
```

### 2. Install dependencies

```bash
bundle install
```

### 3. Set up the database

```bash
rails db:create
rails db:migrate
rails db:seed
```

### 4. Start the server

```bash
rails server
```

Visit `http://localhost:3000` in your browser.

---

## Folder Structure

```text
app/
  controllers/
  models/
  views/
  ...
config/
db/
public/
```

---

## Testing

This project uses [**RSpec**](https://rspec.info/) for testing.

To run the test suite:

```bash
bundle exec rspec
```

RSpec provides a readable and expressive syntax for behavior-driven development (BDD) in Ruby.

If RSpec is not yet installed, you can add it with:

```bash
bundle add rspec-rails --group "development, test"
rails generate rspec:install
```

---

## Status

This project is still under development.\
New features and improved styling are planned.

---

## Contributing

Contributions, issues, and feature requests are welcome.\
Please feel free to submit a pull request or open an issue.

---

## License

This project is licensed under the [MIT License](LICENSE).

---

## Author

Made by [Olesia Mironenko](https://github.com/olesiamironenko)\
