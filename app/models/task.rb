class Task < ApplicationRecord
  enum :status, {todo: 1, doing: 2, done: 3}
end
