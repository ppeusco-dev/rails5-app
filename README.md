# Migrating from Rails 4 to Rails 5

To accomplish this task, we developed a basic application using Ruby v2.7.8 and Rails v4.2.3.11. The application includes three models: User, Post, and Comment. We added the Devise, Bootstrap, and JQuery gems (used for character counting in posts).

Next, we will describe the process we followed to migrate it to Rails v5.2.8.1. There are various guides and strategies on the web for this migration, and we'll detail our specific approach.

Before starting the migration, we recommend cloning the application. Perform the work on the copy, and once verified to function correctly, apply the changes to the original.

A crucial guiding light in this journey is unit testing. It's essential to have broad coverage before starting, and seeing all tests green at the end is an encouraging sign. Additionally, we suggest building a new application with the same Rails version we're targeting and trying scaffolding with some entity.

We used the following tools:
- **Railsbump:** To verify gem compatibility.
- **Upgrading Ruby on Rails (Section 9):** Official upgrade guide.
- **RailsDiff:** Tool to compare changes between Rails versions.

## Step 1: Working on the Gemfile

We begin by updating Ruby and Rails gem versions to v5.2.8.1 (the latest version of 5.x). Before running `bundle install /update`, we delete the Gemfile.lock file and ensure the correct bundler version, depending on the Ruby version. We compare our Gemfile with the new application or RailsDiff, resulting in a Gemfile for a standard Rails 5 app, plus the inherited gems from our application.

Rails 5 includes Puma as the default server. Resolving issues that may arise with dependencies is crucial at this stage.

## Step 2: Updating Files

In this stage, necessary files need to be added and updated. It can be an extensive and complex task, but it's crucial.

### Automatic Option: `rails app:update`

We run the `rails app:update` command, which will automatically make various changes, such as updating the Rails version in key files, gems in the Gemfile, migrations, models, controllers, and views.

**Pros:**
- Updates the Gemfile with the latest versions of Rails and other dependencies.
- Automatically applies some common configuration changes.
- Can save time with standard changes.

**Cons:**
- May break existing code that relies on deprecated functions or changes in Rails 5.
- Does not update all the code that may be using deprecated APIs. Review deprecation messages afterward.
- It's better to test in a staging environment first before updating production.

### Manual Option (Chosen in this case)

We chose to do it manually, relying on RailsDiff to identify files to modify, add, and delete. We complemented this with section 9 of the Rails upgrade guide. We modified and added configuration, migration, model, and controller files.

**Pros:**
- Greater control and understanding of changes.
- Adaptability to specific application situations.
- Avoids automatic changes that could break existing code.

**Cons:**
- More extensive and detailed task.

With the files updated, we move on to the next stage.

## Step 3: Testing the Migrated Application

We bring up the application in development/staging, run the tests, and ensure that all tests pass. This step is crucial to verify that the migration was successful.

This process is a journey that requires attention to detail and patience, but with the right practices, it can be successfully accomplished.

## Github Repositories:

- [Rails4App](https://github.com/ppeusco-dev/rails4-app/tree/main)
- [Rails5App](https://github.com/ppeusco-dev/rails5-app/tree/main)

