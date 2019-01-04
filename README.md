# Starter Jets Project

This project demonstrates basic CRUD.

## Local Setup

    git clone https://github.com/tongueroo/jets-example-crud-html.git demo
    cd demo
    bundle update
    bundle install
    jets db:create db:migrate
    jets server

The `jets server` commands starts a local server and which you can go to at:

* http://localhost:8888
* http://localhost:8888/posts

## Deploy to AWS

    cd demo
    vim .env.development.remote # add DATABASE_URL
    jets deploy

Go to the API Gateway url that is provided at the end of the `jets deploy` command.

## Resources

* Blog Post: [Jets Tutorial: CRUD App](https://blog.boltops.com/2018/09/07/jets-tutorial-crud-app-introduction-part-1)
* Here's the link to the [Live CRUD Demo](https://demo.rubyonjets.com/)

If you find Jets interesting, please it a GitHub star <a href="https://github.com/tongueroo/jets">tongueroo/jets</a>. It helps others find out about the project.  I'd appreciate it!
