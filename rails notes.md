# commands

`rails g migration MigrationName`

Migrations are stored as files in the db/migrate directory, one for each migration class. The name of the file is of the form YYYYMMDDHHMMSS_create_products.rb



  def change
    add_column :products, :part_number, :string
    add_index :products, :part_number
    remove_column :products, :part_number, :string
	change_column :products, :part_number, :text

  end


# Form Helpers
- comes from ActionView::Helpers::FormHelper
- these are helper methods (form_for, form_with, form_tag, etc...)

`https://guides.rubyonrails.org/form_helpers.html`

## form_for & form_tag (replaced with form_with)
- soft deprecated since rails 5.1


## form_with

```ruby
<%= form_with do |form| %>
  Form contents
<% end %>
```







# SecureRandom.hex(10)
- comes from ActiveSupport
- built into Ruby






# collection_select

https://apidock.com/rails/ActionView/Helpers/FormOptionsHelper/collection_select
https://medium.com/@theresamorelli/collection-select-what-the-heck-4e1cabc4be4b

This is basically the drop down option for a user to select from a collection. Takes in 7 arguments, but usually 4 is enough.
collection_select(object, method, collection, value_method, text_method, options = {}, html_options = {})

* note! if you use this with form_for, the form_for will fill in the first arg. (object)

```ruby
<%= form_for @post do |f| %>
  <%= f.collection_select :category_name, Category.all, :name, :name %>
  <%= f.text_field :content %>
  <%= f.submit %>
<% end %>
```

This will create a drop down selection input where the user can pick a category.

* Example (with just the 1st five arguments)
collection_select(object, method, collection, value_method, text_method)
Creates HTML that looks something like:

```ruby
<select name="object[method]" id="object_method">
  <option value="value_method">text_method</option>
  <option value="value_method">text_method</option>
```

* The first argument, object, is the model object the form is all about. This is the arg., if used with form_for, that will be automatically written by form_for.
* Second arg., method, along with the first argument object, sets the name and id attributes of the <select> tag. Note that method must be a property of object.
* Third arg., collection, is an array of the options. Each item in the array becomes an option tag.
* Fourth arg., value_method becomes the value attribute of each option tag.
* Fifth arg., text_method specifies which of the each item’s properties is displayed to the user in the list.

Method = method of a model / what the params key would be

Collection = the collection of objects iterating over
value_method = the actual value of each object iterated over / what is set equal to the attribute value in the input tag
text_method = what the actual HTML text that shows up is

```ruby
<%= form_for @song do |f| %>
  <%= f.collection_select :genre_id, Genre.all, :id, :name %>
  <%= f.submit %>
<% end %>
```

And the HTML:

```ruby
<select name="song[genre_id]" id="song_genre_id">
  <option value="1">Blues</option>
  <option value="2">Classic Rock</option>
  <option value="3">Country</option>
  <option value="4">Dance</option>
  <option value="5">Disco</option>
```
