class Courses
    belongs_to :account
    validate_presence_of :url, :name, :bio

end