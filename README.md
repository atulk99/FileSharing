# File Sharing System

A secure file upload and sharing platform built with Ruby on Rails. This system allows users to upload sensitive files, view a list of uploaded files, delete files, and share them publicly using a unique URL. The app uses Redis and Sidekiq for background job processing and Devise for user authentication.

## Features

- **User Authentication**: Users can sign up, log in, and log out securely using Devise.
- **File Upload**: Users can upload files up to 1GB in size with additional metadata (title, description).
- **File Management**: Users can view, delete, and manage their uploaded files.
- **File Sharing**: Users can generate a public URL to share files.
- **Background Jobs**: Sidekiq is used for background processing tasks (e.g., file compression, file type detection).
- **Redis**: Redis is used to manage background jobs and cache.

## Tech Stack

- **Ruby on Rails**: Web framework for building the application.
- **Devise**: User authentication solution.
- **Sidekiq**: Background job processing.
- **Redis**: Caching and background job management.
- **MySQL**: Database for storing user and file data.
- **ActiveStorage**: Rails solution for managing file uploads.
- **TailwindCSS**: Utility-first CSS framework for fast and responsive UI design.

## Installation

### Prerequisites

- Ruby 3.0.0
- Rails 7.1.5.1
- MySQL
- Redis

### Step-by-step Instructions

1. **Clone the repository**

   ```bash
   git clone git@github.com:atulk99/FileSharing.git
   cd FileSharing
   ```

2. **Install dependencies**

   Install Ruby gems:

   ```bash
   bundle install
   ```

   Install JavaScript dependencies:

   ```bash
   yarn install
   ```

3. **Set up the database**

   Create and migrate the database:

   ```bash
   rails db:create
   rails db:migrate
   ```

4. **Set up Redis**

   Make sure Redis is installed and running:

   ```bash
   redis-server
   ```

   You can also start Redis using a service manager (e.g., systemctl on Linux).

5. **Configure Sidekiq**

   Sidekiq uses Redis to manage background jobs. By default, it will connect to `localhost:6379`. If your Redis server is running elsewhere, configure it in `config/initializers/sidekiq.rb`.

6. **Start the Rails server**

   Run the Rails server:

   ```bash
   rails server
   ```

   This will start your app on `http://localhost:3000`.

7. **Start Sidekiq**

   In a separate terminal, start the Sidekiq worker:

   ```bash
   bundle exec sidekiq
   ```

8. **Access the application**

   Open your browser and go to `http://localhost:3000` to view your application.
