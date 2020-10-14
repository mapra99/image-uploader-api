# Image Uploader

> Drag a file and drop it in the area, and you'll get a link you can use to share your image!

![](/docs/demo.gif)

This project presents a web component that you can use to upload files an reference link to share it in your document or anywhere else. This repo contains the backend project, made with Ruby on Rails. The frontend, made with vanilla JS, CSS and HTML. [can be found here](https://github.com/juanse1904/image-uploader-frontend).

## Built With

- Ruby on Rails 5
- PostgreSQL
- Cloudinary, powered with ActiveStorage
- RSpec for testing framework

## Live Demo

[Live Demo Link](https://image-uploader-be.herokuapp.com/)


## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

- Ruby 2.5.7 is required. If you're using rbenv you may need to `rbenv install 2.5.7`
- Bundler for ruby package management. You may install it with `gem install bundler`
- PostgreSQL
- Yoy may want to use Postman or curl to play with the API.

### Setup

1. Clone this repo in your local environment and cd to the project's folder
```
git clone git@github.com:mapra99/image-uploader-api.git
cd image-uploader-api
```
2. Install the project dependencies
```
bundle install
```
3. Create the database and run the migrations
```
rails db:create
rails db:migrate
```
4. Start the server
```
rails server
```

### 3rd Party Services and Env Variables

#### Cloudinary

On production this project uses cloudinary for files storage, but in development environment by default it stores the files locally. However, you may want to use cloudinary in your development environment, so you can go to [](https://cloudinary.com/), set up and account and get your own credentials. Then, do the following:

1. Create a `.env` file with the following content:
```
CLOUDINARY_CLOUD_NAME=<your cloud name>
CLOUDINARY_API_KEY=<your api key>
CLOUDINARY_API_SECRET=<your api secret>
```

2. Go to `config/environments/development.rb`, comment the line 31 and uncomment the line 33:
```ruby
# config/environments/development.rb
# ...

# # Store uploaded files on the local file system (see config/storage.yml for options)
# config.active_storage.service = :local
# Switch to this one if want to have cloudinary working locally
config.active_storage.service = :cloudinary

# ...
```

And that's it :)

#### CORS Policy

If you want to have your server accept requests from a specific URL domain, you need to add it to the `.env` file, like this:
```
PRODUCTION_FRONTEND_URL="https://my-frontend-project.com"
```

### Usage

This project is a backend API. Following the setup steps, you'll get the API running at http://localhost:3000. You may want to use Postman or curl to have a playground with the API, or you may want to check out [our frontend project](https://github.com/juanse1904/image-uploader-frontend) and [it's live version](https://image-uploader-frontend.vercel.app/).

Feel free to visit the [API docs here](https://documenter.getpostman.com/view/10455715/TVRn3muW).

### Run tests

We are using RSpec as testing framework. Run `bundle exec rspec spec` to check the tests, and explore the `spec/` dir to have a look at their code.

## Authors

**Miguel Prada**

- GitHub: [@mapra99](https://github.com/mapra99)
- LinkedIn: [/in/mprada/](https://www.linkedin.com/in/mprada/?locale=en_US)

**Juan Sebastián Gómez**

- GitHub: [@juanse1904](https://github.com/juanse1904)
- LinkedIn: [/in/juansebg/](https://www.linkedin.com/in/juansebg/)

## Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Hat tip to devchallenges.io for their design

## License

This project is [MIT](lic.url) licensed.
