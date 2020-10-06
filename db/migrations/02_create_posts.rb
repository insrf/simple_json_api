Sequel.migration do
  up do
    create_table(:posts) do
      primary_key :id
      foreign_key :user_id
      String :title, null: false
      String :body, null: false
      String :ip, null: false
      Integer :rating, null: false
    end
  end

  down do
    drop_table(:posts)
  end
end
