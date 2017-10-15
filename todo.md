# Actual TODO:
- Portfolio
  - Table
  - Model
  - Controller
  - Form
- Project
  - Table
  - Motion
    - Model
    - Controller
    - Form
  - Stills
    - Model
    - Controller
    - Form
- Relationships
  - A portfolio `has many :projects`; A project `belongs to :portfolio`


## Models
- Page model (single table inheritance? class inheritance?)
  - Home page
    - Controller action find all projects flagged `homepage_feature: true`, use their thumbnails in slideshow and link to projects
  - Portfolios
    - A portfolio `has many :projects`
    - A project `belongs to :portfolio` - polymorphic? not needed for this, for now a project should only belong to one portfolio
    - A project should use STI and have two sub classes: Motion and Stills

    +------------+ +--------------------+
    | portfolios | | projects           |
    +------------+ +--------------------+
    | id         | | portfolio_id       |
    | title √    | | id                 |
    | nav_title √| | title √            |
    +------------+ | short_description √|
                   | description √      |
                   | thumbnail          |
                   | video              | ----> for Motion class
                   | gallery            | ----> for Stills class
                   | homepage_feature √ |
                   +--------------------+


- Images model

### Relationships
Assets must be global and shared throughout pages, i.e. upload an image to one page and it can be used in any other page...more than the below will be needed, but it's the start:
- Image `has many :projects, through: :images_projects`
- Project `has many :images, through: :images_projects`

## Speeding up the site:
- Either redis caching, clearing cache on save;
- Or rails app creates API that middleman uses to render static site when anything changes (look into server webhooks or a background job etc...)
- Look at CMS sitemap using cells etc
