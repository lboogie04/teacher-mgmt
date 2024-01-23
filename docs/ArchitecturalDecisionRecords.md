# Architectural Decision Records

## Purpose
While the project requirements provide acceptance criteria, this document provides a more in-depth look at technical decisions made throughout the project and their corresponding reasoning and trade-offs.

This section should encapsulate some of the major decisions made throughout the project. All decisions may not be captured, but there are also some comments within the code as well.

## Frontend Tooling
There was a consideration to make use frontend bundling tools such as Vite to make use of React. As some of the basic CRUD functionalities began to be implemented, I found it unnecessary to add the increased setup complexity causing various process to run for the platform to run. Thus, I stuck with the basic ERB approach.

## Role Authorization Management
Based on some of the project requirements, I wanted a fairly simplistic approach to scope and resource authorization and Pundit, provided a great out-of-the-box solution. Pundit encourages explicit authorization checks in controllers and views. Instead of relying on implicit checks within the views or controllers, you explicitly call the relevant Pundit policy methods. This allows for more transparent and readable code. And while it has not been fully fleshed out here in this MVP, enough of it's prowess tooling is in place to display it's flexibility, testability and scalability.

## Versioning
For simplicity and speed sake, I made the decision to use a well supported dependency, `paper-trail` ([Github](https://github.com/paper-trail-gem/paper_trail))for any and all versioning needs. Similar to `Sortable` it serves as an abstract model that can seamlessly integrate with any model and provide versioned objects for the specified model.

Versions of a model are only created on an `update` action:
`has_paper_trail on: [:update]`
The reasoning behind this decision was to not convolute the initial creation of an object and allow the current "version" of an object to literally be the object.(i.e. The latest version of a document instance is the current document instance.)

Paper-trail versions store the previous state of an object in an attribute called `object` (could've changed the attribute name for timeliness, left it as is) which stores the json object of the previous state. This makes it easier to revert an object back to a specific version state(although I believe `paper-trail` has a method to revert an object back to a specific version) and also pass the version's `object` attribute as an actual `document` instance(i.e. there are instances where `setDocument` is setting the version's object to display previous doc versions).

Paper-trail provides a LOT of configurations out of the box and would require more time to assess but the base functionality services the needs of the requirements around versioning and if the functionality is extended upon, we should look further into the Paper-trail interface.


## Potential Improvements
- There are areas of the code that are not considerably `DRY` especially around certain views that could be repetitive partials and even controller and model code that could make use of callbacks. 
- Improve upon and further implement Pundit making use of it for access control for Document access.
- Further implement Tailwind CSS. I implemented the bare minimum making use of template components, etc.
- Add unit and system testing. Duhhhhh!
- Implement alert error handling.

