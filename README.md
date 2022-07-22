# Demo Rails Avo

Demonstration of:

* [Ruby on Rails](https://rubyonrails.org) web framework

* [Avo](https://avohq.io) adminstration gem

* [ActsAsTaggableOn](https://github.com/mbleigh/acts-as-taggable-on) tagging gem


## Setup

Create a demo rails app any way you want such as:

```sh
rails new demo_rails_avo
```


## Avo fields

Avo provides many kinds of fields that render data:

* Badge: display an easily recognizable status of a record in the database. Postgres text.

* Boolean: render an icon on Index view and Show view; render a checkbox on Form views. Postgres boolean.

* Boolean Group: update a Hash with string keys and boolean values. Postgres jsonb.

* Code: show a code editor using codemirror. Postgres text.

* Country: show a select field on Edit view that includes all ISO 3166-1 countries. Postgres char(2).

* Date: display a date. The Edit view of the picker uses flatpickr. Postgres date.

* DateTime: display a date and time. The Edit view of the picker uses flatpickr. Postgres datetime.

* External image: display an image by using its URL. Postgres text.

* File: display a file as an image, or audio file, or video file. Postgres ?.

* Files: enable upload of multiple files at once using Active Storage. Postgres ?.

* Gravatar: display gravatar icon corresponding to an email address. Postgres text.

* Heading: display a banner between fields, such as a separator for lists or sections. Postgres N/A.

* Hidden: use a form hidden field. Postgres N/A.

* ID: show the record\'s id. Postgres primary key, such as an integer or UUID.

* KeyValue: edit flat key-value pairs stored in JSON format in the database. Postgres jsonb.

* Markdown: render a SimpleMDE Markdown Editor. Postgres text.

* Number: render `input[type="number"]` with options for min, max, step. Postgres numeric.

* Password: render `input[type="password"]`. Postgres N/A.

* Progress bar: render a progress element on index and show views, and `input[type=range]` on forms. Postgres numeric.

* Select: render a select field. Postgres integer, or enum, or text.

* Status: display the status of a column (loading or failed). Postgres text.

* Tags: show and edit tags. Postgres array of text, or ActsAsTaggableOn gem, etc.

* Text: render text, with options to render as HTML. Postgres text.

* Textarea: render a typical HTML form text area. Postgres text.

* Trix: render using a WYSIWYG Trix Editor, with options for file attachments and ActiveStorage. Postgres text.


## Avo

Install via app template:

```sh
bin/rails app:template LOCATION='https://avohq.io/app-template'
```

Avo creates some config files, and changes file `config/routes.rb`:

```ruby
Rails.application.routes.draw do
  mount Avo::Engine, at: Avo.configuration.root_path
  …
```

Visit <http://127.0.0.1:3000/avo> and you should see the Avo welcome page.


### Avo configuration

Avo configuration is in file `config/initializers/avo.rb`:

```ruby
# For more information regaring these settings check out our docs https://docs.avohq.io
Avo.configure do |config|
  ## == Routing ==
  config.root_path = '/avo'

  # Where should the user be redirected when visting the `/avo` url
  # config.home_path = nil

  ## == Licensing ==
  config.license = 'community' # change this to 'pro' when you add the license key
  # config.license_key = ENV['AVO_LICENSE_KEY']

  ## == Set the context ==
  config.set_context do
    # Return a context object that gets evaluated in Avo::ApplicationController
  end

  ## == Authentication ==
  # config.current_user_method = {}
  # config.authenticate_with = {}

  ## == Authorization ==
  # config.authorization_methods = {
  #   index: 'index?',
  #   show: 'show?',
  #   edit: 'edit?',
  #   new: 'new?',
  #   update: 'update?',
  #   create: 'create?',
  #   destroy: 'destroy?',
  # }
  # config.raise_error_on_missing_policy = false

  ## == Localization ==
  # config.locale = 'en-US'

  ## == Customization ==
  # config.app_name = 'Avocadelicious'
  # config.timezone = 'UTC'
  # config.currency = 'USD'
  # config.per_page = 24
  # config.per_page_steps = [12, 24, 48, 72]
  # config.via_per_page = 8
  # config.default_view_type = :table
  # config.hide_layout_when_printing = false
  # config.id_links_to_resource = false
  # config.full_width_container = false
  # config.full_width_index_view = false
  # config.cache_resources_on_index_view = true
  # config.search_debounce = 300
  # config.view_component_path = "app/components"
  # config.display_license_request_timeout_error = true
  # config.disabled_features = []

  ## == Breadcrumbs ==
  # config.display_breadcrumbs = true
  # config.set_initial_breadcrumbs do
  #   add_breadcrumb "Home", '/avo'
  # end

  ## == Menus ==
  # config.main_menu = -> {
  #   section "Dashboards", icon: "dashboards" do
  #     all_dashboards
  #   end

  #   section "Resources", icon: "resources" do
  #     all_resources
  #   end

  #   section "Tools", icon: "tools" do
  #     all_tools
  #   end
  # }
  # config.profile_menu = -> {
  #   link "Profile", path: "/avo/profile", icon: "user-circle"
  # }
end
```


### Optional


Enable home page:

```ruby
config.home_path = '/avo/resources/items'
```

Enable id links to resources:

```ruby
config.id_links_to_resource = true
```

Enable professional license:

```ruby
# License
config.license = 'pro'
config.license_key = ENV['AVO_LICENSE_KEY']
```

Enable localization:

```ruby
## == Localization ==
config.locale = 'en-US'
```

Enable breadcrumbs:

```ruby
## == Breadcrumbs ==
config.display_breadcrumbs = true
config.set_initial_breadcrumbs do
  add_breadcrumb "Home", '/avo'
end
```

Enable buttons:

```ruby
## == Buttons ==
# Show web page buttons on the footer of typical web page forms,
# e.g. a navigation `Back` button and an editing `Save` button.
# This confi can help the UI for resources that use long web pages.
config.buttons_on_form_footers = true
```

Enable authentication using Devise with typical  settings:

```ruby
# Authentication with Devise
config.current_user_method = :current_user
config.current_user_resource_name = :user
```


## Scaffold

Generate scaffold:

```sh
bin/rails generate scaffold Item \
  demo_badge:text \
  demo_boolean:boolean \
  demo_code:text \
  demo_country:text \
  demo_date:date \
  demo_date_time:datetime \
  demo_external_image:text \
  demo_file:binary \
  demo_files:binary \
  demo_gravatar:text \
  demo_markdown:text \
  demo_number:integer \
  demo_password:text \
  demo_progress_bar:integer \
  demo_select:integer \
  demo_status:text \
  demo_text:text \
  demo_textarea:text \
  demo_trix:text

TODO:

```sh
  demo_boolean_group:jsonb \
  demo_key_value:jsonb \
  demo_tags:array\[\] \
```


## Avo resource

Generate:

```sh
bin/rails generate avo:resource Item
```

Edit file `app/avo/resources/item_resource.rb`:

```ruby
class ItemResource < Avo::BaseResource

  # For web page headline 1
  self.title = :name

  # For web page headline 2
  self.description = "List all the items"

  # Enable eager loading for the index view.
  self.includes = []

  # self.search_query = ->(params:) do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  # All the fields we want

  field :id,
    as: :id,
    sortable: true

  field :demo_badge,
    as: :badge,
    name: 'Badge',
    help: "help goes here",
    sortable: true,
    options: {
      info: ["info", "i"],
      success: ["success", "s"],
      warning: ["warning", "w"],
      danger: ["danger", "d"],
    }

  field :demo_boolean,
    as: :boolean,
    name: 'Boolean',
    help: "help goes here",
    sortable: true
    # true_value: 'yes',
    # false_value: 'no'

  # field :demo_boolean_group,
  #   as: :boolean_group,
  #   help: "help goes here"

  field :demo_code,
    as: :code,
    name: 'Code',
    help: "help goes here",
    theme: 'default',
    language: 'ruby'

  field :demo_country,
    as: :country,
    name: 'Country',
    help: "help goes here",
    sortable: true,
    display_name: false

  field :demo_date,
    as: :date,
    name: 'Date',
    help: "help goes here",
    sortable: true

  field :demo_date_time,
    as: :date_time,
    name: 'Date Time',
    help: "help goes here",
    sortable: true

  field :demo_external_image,
    as: :external_image,
    name: 'External Image',
    help: "help goes here",
    sortable: true

  #TODO
  # field :demo_file,
  #   as: :file,
  #   name: 'File',
  #   help: "help goes here",
  #   is_image: true,
  #   link_to_resource: true

  #TODO
  # field :demo_files,
  #   as: :files,
  #   name: 'Files',
  #   help: "help goes here",
  #   sortable: true

  field :demo_gravatar,
    as: :gravatar,
    name: 'Gravatar',
    help: "help goes here",
    sortable: true,
    hide_on: [:index]

  #TODO
  # field :demo_key_value,
  #   as: :key_value,
  #   name: 'Key-Value',
  #   help: "help goes here",
  #   sortable: true

  field :demo_markdown,
    as: :markdown,
    name: 'Markdown',
    help: "help goes here",
    sortable: true,
    hide_on: [:index]

  field :demo_number,
    as: :number,
    name: 'Number',
    help: "help goes here",
    sortable: true

  field :demo_password,
    as: :password,
    name: 'Password',
    help: "help goes here",
    sortable: true,
    hide_on: [:index]

  field :demo_progress_bar,
    as: :progress_bar,
    name: 'Progress Bar',
    help: "help goes here",
    sortable: true,
    max: 100,
    step: 1

  #TODO
  # field :demo_select,
  #   as: :select,
  #   name: 'Select',
  #   help: "help goes here",
  #   sortable: true

  field :demo_status,
    as: :status,
    name: 'Status',
    help: "help goes here",
    sortable: true
    # loading_when: ["loading", "loading2", "loading3"],
    # failed_when: ["failed", "failed2", "failed3"]

  # field :demo_tags,
  #   as: :tags,
  #   help: "help goes here",
  #   sortable: true

  field :demo_text,
    as: :text,
    name: 'Text',
    help: "help goes here",
    placeholder: "placeholder goes here",
    sortable: true,
    hide_on: [:index]

  field :demo_textarea,
    as: :textarea,
    name: 'Text Area',
    help: "help goes here",
    sortable: true,
    hide_on: [:index]

  field :demo_trix,
    as: :trix,
    name: 'Trix',
    help: "help goes here",
    sortable: true,
    hide_on: [:index]

end
```


## Create seeds

Create demo data seeds and demo data fabricators.

Create these any way you wish. We favor using the typical Rails file `db/seeds.rb`. We favor methods with a naming convention that starts with "fab_" meaning fabricate.

Example file `db/seeds.rb`:

```ruby
def self.fab_badge
    fab_badge_sampler.sample
end

def self.fab_badge_sampler
    [
        "info",
        "success",
        "warning",
        "danger",
    ]
end

def self.fab_boolean
    [true, false].sample
end

def self.fab_code
    "puts \"Hello World\""
end

def self.fab_country
    fab_country_sampler.sample
end

def self.fab_country_sampler
    [
        "US",
        "UK",
        "CH",
        "IE",
        "IN",
        "IT",
    ]
end

def self.fab_external_image
    "https://picsum.photos/#{40 + rand(40)}/#{40 + rand(40)}"
end

def self.fab_gravatar
    fab_gravatar_sampler.sample
end

def self.fab_gravatar_sampler
    [
        "alpha@example.com",
        "bravo@example.com",
        "charlie@example.com",
        "delta@example.com",
        "echo@example.com",
        "foxtrot@example.com",
    ]
end

def self.fab_markdown
    "markdown"
end

def self.fab_number
    rand(100)
end

def self.fab_password
    "password"
end

def self.fab_progress_bar
    rand(100)
end

def self.fab_status
    fab_status_sampler.sample
end

def self.fab_status_sampler
    [
        "done",
        "complete",
        "waiting",
        "running",
        "failed",
    ]
end

def self.fab_text
    "text"
end

def self.fab_textarea
    "textarea"
end

def self.fab_trix
    "trix"
end

def self.fab_date
    Date.today + rand(1000)
end

def self.fab_date_time
    DateTime.now + rand(1000)
end

def self.fab_item
    Item.new(
        demo_badge: fab_badge,
        demo_boolean: fab_boolean,
        demo_code: fab_code,
        demo_country: fab_country,
        demo_date: fab_date,
        demo_date_time: fab_date_time,
        demo_external_image: fab_external_image,
        demo_gravatar: fab_gravatar,
        demo_markdown: fab_markdown,
        demo_number: fab_number,
        demo_password: fab_password,
        demo_progress_bar: fab_progress_bar,
        demo_status: fab_status,
        demo_text: fab_text,
        demo_textarea: fab_textarea,
        demo_trix: fab_trix,
    )
end

100.times do
    item = fab_item
    puts item
    item.save!
end
```


## Tags

Avo provides various ways to manage tags. We prefer using the gem [acts-as-taggable-on](https://github.com/mbleigh/acts-as-taggable-on)

Add to `Gemfile`:

```ruby
# Use tags with associations
gem 'acts-as-taggable-on', '~> 9.0'
```

```sh
bundle
rake acts_as_taggable_on_engine:install:migrations
bin/rails db:migrate
```

Edit file `app/models/item.rb` and add:

```ruby
acts_as_taggable_on :tags
```

Edit file `app/avo/resources/item_resource.rb` and add:

```ruby
field :tags,
  as: :tags
```

Restart the app.

Verify that you can edit an item, create some tags, save the record, then see your tags.


## Use ActiveStorage for files

Add to `Gemfile`:

```ruby
# Use Active Storage variant for files
gem "image_processing", "~> 1.2"
```

```sh
bundle
bin/rails active_storage:install
bin/rails db:mgirate
```

Add to file `app/models/item.rb`:

```ruby
has_many_attached :demo_files
```

Add to file `app/avo/resources/item_resource.rb`:

```ruby
field :demo_files,
  as: :files,
  name: 'Files',
  help: "help goes here",
  sortable: true
```

Optionally create some demo files:

```sh
echo "alpha" > tmp/alpha.txt
echo "bravo" > tmp/bravo.txt
```

Restart the app.

Verify that you can edit an item, upload some files, save the record, then see your file entries.


## Use Ransack for searching

Add to `Gemfile`:

```ruby
# Use Ransack for searching
gem 'ransack'
```

```sh
bundle
```

Edit file `app/avo/resources/item_resource.rb` to add a Ransack search query as a class lambda, and an optional search query help string:

```ruby
class ItemResource < Avo::BaseResource
  …
  # Avo search for Ransack search query
  self.search_query = ->(params:) do
    scope.ransack(
      id_eq: params[:q],
      m: "or"
    ).result(distinct: false)
  end

  self.search_query_help = "- search by id"
  …
end
```

Restart the app.

Verify that Avo shows a top navigation search box, and that you can type in the box, and that the box shows a dropdown area that lists some matching items.


### Add search result label and description

The search currently lists each item with same resource title which is "Item". We want to also show a label and description.

Edit file `app/avo/resources/item_resource.rb` to add option `as_label` and option `as_description` like this:

```ruby
class ItemResource < Avo::BaseResource
  …
  field :id, …
    as_label: true
  …
  field :demo_text, …
    as_description: true
  …
```

### Add search result custom label and custom description

If you want more customization for the label or description, then you can define your own fields with custom blocks such as:

```ruby
class ItemResource < Avo::BaseResource
  …
  # Avo label for Ransack search result list
  field :my_custom_label,
    as: :text,
    as_label: true,
    hide_on: :all \
  do |model|
    "Item #{model.id}"
  rescue
    "Item"
  end

  # Avo description for Ransack search result list
  field :my_custom_description,
    as: :text,
    as_description: true,
    hide_on: :all \
  do |model|
    ActionView::Base.full_sanitizer.sanitize(model.demo_text).truncate 130
  rescue
    ""
  end
  …
```


### Add search result list avatar

Edit file `app/avo/resources/item_resource.rb`:

```ruby
class ItemResource < Avo::BaseResource
  …
  field :demo_external_image, …
    as_avatar: :circle
  …
```


### Add search form fields

Edit file `app/avo/resources/item_resource.rb` to add a Ransack search query as a class lambda:

```ruby
class ItemResource < Avo::BaseResource
  …
  # Ransack search query
  self.search_query = ->(params:) do
    scope.ransack(
      id_eq: params[:q],
      demo_text_cont: params[:q],
      demo_textarea_cont: params[:q],
      demo_trix_cont: params[:q],
      m: "or"
    ).result(distinct: false)
  end
  …
end
```

