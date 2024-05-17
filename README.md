# KatBin

KatBin is a fast, lightweight pastebin and URL shortener built in Rust using the Axum web framework. It allows users to quickly share code snippets or shorten URLs with ease.

## Features

- **Fast and Lightweight**: Built using Rust and Axum, KatBin is designed for speed and efficiency.
- **Pastebin**: Easily share code snippets and text with others.
- **URL Shortener**: Shorten long URLs into compact, easy-to-share links.
- **Simple to Use**: Minimalistic user interface for seamless interaction.
- **Secure**: Follows best practices for security and data privacy.

## Installation

To run KatBin locally, follow these steps:

1. Clone the repository:

   ```bash
   git clone https://github.com/katbin-oss/katbin.git
   ```

2. Navigate to the project directory:

   ```bash
   cd katbin
   ```
3. Create Environment File:<br/>
Create a file named env in the project root directory with the following contents:
    ```env
    DATABASE_URL=postgres://username:password@host:port/database_name
    PORT=port
    SECRET_KEY=secret_key # generate using `head -c64 /dev/urandom | base64`
    ```

3. Install dependencies:

   ```bash
   docker-compose up -d
   cargo build --release
   ```

4. Run the application:

   ```bash
   cargo run --release
   ```

5. Access KatBin in your web browser at `http://localhost:3000`.

## Usage

- **Paste Creation**: Visit the homepage and enter your code or text in the input box. Click "Create Paste" to generate a shareable link.
- **URL Shortening**: Visit the homepage and enter a long URL in the input box. Click "Shorten URL" to generate a shortened link.
- **Accessing Pastes**: Access pastes using their generated links. Paste IDs are case-sensitive.
- **Editing and Deleting**: Users can edit and delete their own pastes if logged in.

## Contributing

Contributions are welcome! If you encounter any bugs, issues, or have feature requests, please open an issue on the [GitHub repository](https://github.com/your-username/katbin). Pull requests are also appreciated.

## License

This project is licensed under the [MIT License](LICENSE).
