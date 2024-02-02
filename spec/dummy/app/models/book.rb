class Book < ApplicationRecord
    self.table_name = 'books'
    
    log_entity_history
end
