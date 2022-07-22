class ItemResource < Avo::BaseResource

  # For web page headline 1
  self.title = :name

  # For web page headline 2
  self.description = "List all the items"

  # Enable eager loading for the index view.
  self.includes = []

  # Avo search for Ransack
  self.search_query = ->(params:) do
    scope.ransack(
      id_eq: params[:q], 
      demo_boolean_true: params[:q],
      demo_text_cont: params[:q], 
      demo_textarea_cont: params[:q], 
      demo_trix_cont: params[:q], 
      m: "or"
    ).result(distinct: false)
  end

  self.search_query_help = "- search by id, text, etc."

  # Avo label for Ransack search result list
    field :avo_label, 
    as: :text, 
    as_label: true,
    hide_on: :all \
  do |model|
    if model.id
      "Item #{model.id}"
    else
      "Item"
    end
  rescue
    "Item"
  end

  # Avo description for Ransack search result list
  field :avo_description, 
    as: :text,
    as_description: true,
    hide_on: :all \
  do |model|
    ActionView::Base.full_sanitizer.sanitize(model.body).truncate 130
  rescue
    "description goes here"
  end

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
    sortable: true,
    as_avatar: true

  #TODO
  # field :demo_file, 
  #   as: :file, 
  #   name: 'File',
  #   help: "help goes here",
  #   is_image: true, 
  #   link_to_resource: true

  field :demo_files, 
    as: :files,
    name: 'Files',
    help: "help goes here",
    sortable: true

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

  field :tags, 
    as: :tags,
    help: "help goes here",
    sortable: true,
    acts_as_taggable_on: :tags
    # close_on_select: false,
    # placeholder: 'tags',
    # suggestions: -> { Item.tags_suggestions },

  end
