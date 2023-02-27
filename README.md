# Project Conversation History

This project allows users to leave comments and change the status of a project. The project conversation history lists comments and changes in status.

## Getting Started

### Prerequisites

To run this project, you'll need to have the following installed:

- Ruby 3.1.0
- Rails 7.0
- PostgreSQL

### Installation

1. Clone this repository to your local machine:
```
git clone https://github.com/javidevroom/project-conversation-history.git
```

2. Install the required dependencies:
```
bundle install
```

3. Set up the database:
```ruby
rails db:create
rails db:migrate
```

4. Start the Rails server:
```ruby
rails server
```

5. Open a web browser and navigate to `http://localhost:3000` to view the application.

## Usage

To use the application, follow these steps:

1. Sign up for an account or log in if you already have one.
2. Create a new project by clicking the "New Project" button.
3. On the project detail page, you can leave comments or change the status of the project using the provided form.
4. The project conversation history, including all comments and status changes, will be displayed on the project detail page.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/your-username/project-conversation-history. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](https://www.contributor-covenant.org/) code of conduct.

## License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT) - see the [LICENSE.md](LICENSE.md) file for details.
