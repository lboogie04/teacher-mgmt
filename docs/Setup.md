# Setup

Prerequisites (skip if you already have installed):
- Install Ruby ([rbenv](https://github.com/rbenv/rbenv) or [rvm](https://rvm.io/)) - latest version `3.1.x`
- Install [Yarn](https://classic.yarnpkg.com/lang/en/docs/install/#mac-stable)
- Install [Bundler](https://bundler.io/)

Install dependencies:

```
bundle install
npm install
```

Create, migrate, and seed your database:

```
rails db:create; rails db:migrate
```

Run rails server:

```
rails s
```

Run vite server:

```
npm run start
```

With Rails & Vite running, visit [http://localhost:3000/](http://localhost:3000/).


