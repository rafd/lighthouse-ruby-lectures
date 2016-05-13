# SQL Review

`WHERE`

`ORDER BY`

`LIMIT`

## joins

  ```
  SELECT artists.name, albums.name
  FROM artists LEFT OUTER JOIN albums ON (artists.id = albums.artist_id)
  ```
  
  types:
    `INNER` (default)
    `LEFT OUTER`
    `RIGHT OUTER`
    `FULL`

## aggregates

  `COUNT`, `AVG`, `MAX`, `MIN`, `SUM`:

  `GROUP BY`
    if you're using an aggregate, you should have a `GROUP BY`

  `HAVING`
    similar to `WHERE`, but for aggregates
    
    ```
    ... COUNT(likes.ids) AS num_likes
    ...
    HAVING num_likes > 0
    ...
    ```



# ActiveRecord Review


## relationships

  ```
  Student
    belongs_to :school

  School
    has_many :students
  ```


  *TIP!*
    can destroy dependents easily:
      `has_many :students, dependent: :destroy`


## validations

  ```
  validates :foo,
    presence: true
    length: { minimum: 1,
              maximum: 10 },
    numericality: { only_integer: true,
                    greater_than: 5 },
    format: { with: /iamregex/, message: 'not valid format' },
    uniqueness: true
  ```


## custom validations

  ```
  validates :attr_is_even

  def attr_is_even
    errors.add(:attr, 'attr must be even') if attr and attr % 2 != 0
  end
  ```

  *TIP!*
     you should check if a variable exists before calling methods on it

  *!!!*
     the first argument to errors.add must match what what the test expects

  *!!!*
     the error message must match what exactly the test expects

  *!!!*
     :attr_is_even should be a private method

  *!!!*
    name of custom validation should be what you're making sure is true
      yes:  `validate :correct_state`
      no:   `validate :incorrect_state`


## sql queries

  `Foo.where("table.column IS NULL AND table.other_column == ?", variable)`


## callbacks

  `before_save :do_something`
  `after_save :do_something`

  *!!!*
    :do_something should be a private method

  *!!!*
    if a before_save callback returns false, it will prevent the save

  *TIP!*
    you can check for a 'dirty' attribute (attr that has changed but not saved):
        name_changed?

  *TIP!*
     you can have a custom callback call methods on related objects

     ```
     def custom_callback
       self.related_thing.some_method
     end
     ```

     (`self` is optional in the example above)



# FactoryGirl

  `FactoryGirl.build` is like calling `Model.new`; only in memory
  `FactoryGirl.create` is like calling `Model.create`; saves to the db

  ```
  FactoryGirl.define do
    factory :student do
      name   Faker::Name.name
      school
    end
  end

  before :each do
    @student = FactoryGirl.build :student
  end

  describe '#name' do
    it 'is required' do
      @student.name = nil
      expect(@student).to_not be_valid
      expect(@student.errors[:name]).to include "can't be blank"

      @student.name = 'Bob'
      expect(@student).to be_valid
    end
  end
  ```



# Libraries and Dates

  `1.day.ago.to_date < Date.today`

  checkout -------> checkin

  should always be true:

    checkout < checkin
    checkout < due


